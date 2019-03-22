clear all; close all;
Nt=2;%发射天线数
Nfft=512;  Ng=64;  Nofdm=Nfft+Ng;  
% frame_len=3*Nofdm;%一帧数据3个ofdm符号
frame_num=40;
Nps=4; %实际插入导频时，真正的间隔，用于确定导频位置
Nd=Nfft;%-2*Np; % Pilot spacing, Numbers of pilots and data per OFDM symbol
Nsym=Nd*frame_num;%总的qpsk符号数
bps=2; M=2^bps; % Number of bits per (modulated) symbol
mod_object = modem.dpskmod('M', M, 'InitialPhase', pi/4,'SymbolOrder','gray','INPUTTYPE','Bit');
demod_object=modem.dpskdemod('M', M, 'InitialPhase', pi/4,'SymbolOrder','gray','OutputType','Bit');
% pilot_symbol=chu_sequence(Np);%每个ofdm符号都是相同的pilot
pilot_symbol=gold_sequence(Nfft);
% rand('seed',10); 
msgint=randint(bps*Nsym,1); %比特数据源
Data = modulate(mod_object,msgint);%qpsk modulation 输入比特要是列向量
%alamouti encode
[encode_data1,encode_data2]=stbc2x1(Data,Nfft,frame_num);
%add block pilot
%IFFT
x1=ifft(encode_data1,Nfft,1);
x2=ifft(encode_data2,Nfft,1);
%add CP and generate frame
tx1_tmp = [x1(Nfft-Ng+1:Nfft,:);x1];
tx2_tmp = [x2(Nfft-Ng+1:Nfft,:);x2];
tx1=tx1_tmp;
tx2=tx2_tmp;
%channel
[h1,h2]=chan_stbc(Nd,frame_num,Ng);
rx1_tmp=h1.*tx1;
rx2_tmp=h2.*tx2;
%P->S
rx1_tmp=rx1_tmp(:);
rx2_tmp=rx2_tmp(:);
%add gaussion noise
SNRs = [0:30];  sq2=sqrt(2);
BERs=zeros(1,length(SNRs));
for i=1:length(SNRs)
   SNR = SNRs(i); 
   rx1=rx1_tmp;
   rx2=rx2_tmp;
   rx1=awgn(rx1,SNR,'measured');
   rx2=awgn(rx2,SNR,'measured');
   rx_tmp=rx1+rx2;
   %S->P
   rx=reshape(rx_tmp,Nofdm,frame_num);
   %remove cp
   rx_rcp=rx(Ng+1:Nofdm,:);
   %fft dim=1,按列进行fft，dim=2,按行进行fft
   Rx_rcp=fft(rx_rcp,Nfft,1);
   H1_est=h1(Ng+1:end,:);
   H2_est=h2(Ng+1:end,:);
   %alamouti解码
   rx_data=stbc_decode_2x1(H1_est,H2_est,Rx_rcp);
   %P->S
   Rx_data=rx_data(:);
   % 对所有解码后的符号进行qpsk解调
   demod_bit = demodulate(demod_object,Rx_data);
   nbits_error=0;
   len=min(length(demod_bit),length(msgint));
   nbits_error=nbits_error+sum(xor(demod_bit(1:len),msgint(1:len)));
   ber=nbits_error/len;
   BERs(i)=ber;
end
figure(1), clf, semilogy(SNRs,BERs);
xlabel('Eb/N0(dB)');
ylabel('BER');
title('BER for QPSK modulation with Alamouti STBC (Rayleigh channel)');
figure(2)
plot( Rx_data,'r*');
xlabel('real')
ylabel('image')
title('解码信号星座图');
