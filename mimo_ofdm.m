
clear all; close all;
Nfft=512;  Ng=64;  Nofdm=Nfft+Ng;  
% frame_len=3*Nofdm;%一帧数据3个ofdm符号
frame_num=40;
Nps=4; Np=Nfft/Nps; Nd=Nfft-2*Np; % Pilot spacing, Numbers of pilots and data per OFDM symbol
Nsym=Nd*frame_num;%总的qpsk符号数
bps=2; M=2^bps; % Number of bits per (modulated) symbol
mod_object = modem.dpskmod('M', M, 'InitialPhase', pi/4,'SymbolOrder','gray','INPUTTYPE','Bit');
demod_object=modem.dpskdemod('M', M, 'InitialPhase', pi/4,'SymbolOrder','gray','OutputType','Bit')
% pilot_symbol=chu_sequence(Np);%每个ofdm符号都是相同的pilot
pilot_symbol=gold_sequence(Np);
% rand('seed',10); 
msgint=randint(1,bps*Nsym); %比特数据源
Data = modulate(mod_object,msgint.');%qpsk modulation 输入比特要是列向量
Data=Data.';
%alamouti encode
encoded_symbol=zeros(2,Nsym)+1j*zeros(2,Nsym);
encoded_symbol(1,1:2:end)=Data(1:2:end);
encoded_symbol(2,1:2:end)=Data(2:2:end);
encoded_symbol(1,2:2:end)=-1*conj(Data(2:2:end));
encoded_symbol(2,2:2:end)=conj(Data(1:2:end));
%ofdm modulation
tx1=[];
tx2=[];
for ofdm_count=1:frame_num
    start_d=(ofdm_count-1)*Nd+1;
    end_d=start_d+Nd-1;
    data_tmp1=encoded_symbol(1,start_d:end_d);
    data_tmp2=encoded_symbol(2,start_d:end_d);
    %add pilot
    X1=zeros(1,Nfft);
    X2=zeros(1,Nfft);
    ip=0;
    k=1;
    while k<=Nfft
        if mod(k,Nps)==1
           X1(k) = pilot_symbol(floor(k/Nps)+1);
           X2(k+1)=pilot_symbol(floor(k/Nps)+1);
           ip=ip+2;%两个导频占据两个空位
           k=k+2;
         else
           X1(k) = data_tmp1(k-ip);
           X2(k) = data_tmp2(k-ip);
           k=k+1;
         end
    end
    %ifft
    x1=ifft(X1,Nfft);
    x2=ifft(X2,Nfft);
    %add CP and generate frame
    tmp_tx1 = [x1(Nfft-Ng+1:Nfft) x1];
    tx1=[tx1,tmp_tx1];
    tmp_tx2 = [x2(Nfft-Ng+1:Nfft) x2];
    tx2=[tx2,tmp_tx2];      
end

%channel
h_len=length(tx1);
h1 = (1/sqrt(2)*[randn(1,Nfft/4) + j*randn(1,Nfft/4)]); % Rayleigh channel
h2 = (1/sqrt(2)*[randn(1,Nfft/4) + j*randn(1,Nfft/4)]); 
rx1=filter(h1,1,tx1);
rx2=filter(h2,1,tx2);

%add gaussion noise
SNRs = [0:30];  sq2=sqrt(2);
BERs=zeros(1,length(SNRs));
for i=1:length(SNRs)
   SNR = SNRs(i); 
   rx1=awgn(rx1,SNR,'measured');
   rx2=awgn(rx2,SNR,'measured');
   rx_tmp=rx1+rx2;
   %S->P
   rx=reshape(rx_tmp,Nofdm,frame_num);
   rx=rx.';
   %remove cp
   rx_rcp=rx(:,Ng+1:Nofdm);
   %fft dim=1,按列进行fft，dim=2,按行进行fft
   Rx_rcp=fft(rx_rcp,Nfft,2);
   %channel estimate
   rx_data=[];
   for id_ofdm=1:size(Rx_rcp,1)
       idx=1;
       ip=0;
       pilot_loc1=[];
       pilot_loc2=[];
       Rx_data_tmp=[];
       data_loc=[];
       while idx<=size(Rx_rcp,2)%找到一个ofdm符号中导频所在位置
          if mod(idx,Nps)==1
            pilot_loc1 = [pilot_loc1 idx]; 
            pilot_loc2 = [pilot_loc2 idx+1];
            ip = ip+2;
            idx=idx+2;
          else
            Rx_data_tmp=[Rx_data_tmp,Rx_rcp(id_ofdm,idx)];%找到一个ofdm符号中数据符号
            data_loc=[data_loc,idx];
            idx=idx+1;
         end
       end
       %estimate and interpolate
       LS_est1=Rx_rcp(id_ofdm,pilot_loc1)./pilot_symbol.';
       if pilot_loc1(Np)<Nfft %补充最右端缺少的估计值
            a=(LS_est1(Np)-LS_est1(Np-1))/(pilot_loc1(Np)-pilot_loc1(Np-1));
            end_est=LS_est1(Np)+a*(Nfft-pilot_loc1(Np));
            LS_est1=[LS_est1 end_est];
            pilot_loc1=[pilot_loc1 Nfft];
       end
       inter_index=1:Nfft;
       H1_est=interp1(pilot_loc1,LS_est1,inter_index,'linear');%完成插值fft点数
       H1=H1_est(data_loc);%提取数据位置出的信道系数
       
       LS_est2=Rx_rcp(id_ofdm,pilot_loc2)./pilot_symbol.';
       if pilot_loc2(Np)<Nfft
            a=(LS_est2(Np)-LS_est2(Np-1))/(pilot_loc2(Np)-pilot_loc2(Np-1));
            end_est=LS_est2(Np)+a*(Nfft-pilot_loc2(Np));
            LS_est2=[LS_est2 end_est];
            pilot_loc2=[pilot_loc2 Nfft];
       end
       H2_est=interp1(pilot_loc2,LS_est2,inter_index,'linear');
       H2=H2_est(data_loc);%提取数据位置出的信道系数
       %alamouti decode
       idx=1;
       len=length(Rx_data_tmp);
       while idx<=len
           tmp_y=[Rx_data_tmp(idx);Rx_data_tmp(idx+1)'];
           H=[H1(idx),H2(idx+1);conj(H2(idx+1)),-conj(H1(idx+1))];
           rx_data=[rx_data;inv(H'*H)*H'*tmp_y];
           idx=idx+2;
       end
   end
   % 对所有解码后的符号进行qpsk解调
   demod_bit = demodulate(demod_object,rx_data);
   demod_bit=demod_bit.';
   nbits_error=0;
   len=min(length(demod_bit),length(msgint));
   nbits_error=nbits_error+sum(xor(demod_bit(1:len),msgint(1:len)));
   ber=nbits_error/len;
   BER(i)=ber;
end
figure(1), clf, semilogy(SNRs,BER);
xlabel('Eb/N0(dB)');
ylabel('BER');
title('BER for QPSK modulation with Alamouti STBC (Rayleigh channel)');