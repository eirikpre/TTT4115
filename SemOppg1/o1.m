%% o1
close all;
N = 1000;p = .9;
average = 1000;
corrx = 0;
x = zeros(1,N);
for j = 1:average
    x = sqrt(1-p^2)*randn(1,N);
    x = filter( 1,[1 -p],x);
    corrx = corrx + xcorr(x);
end
corrx = corrx/average/N;
powerx = fft(corrx);
figure; set(gcf,'name','oppg1','numbertitle','off');
subplot(2,1,1); plot(-20:20, corrx(N-20:N+20)),title('Correlation');
subplot(2,1,2); plot(abs(powerx)),title('Power Density');


% o2

sigmaU = 1;     P = 1;      

for bitRate = [.75] % [.75 2 5]
    sigmaQ = ((2*pi*exp(1)*sigmaU*2^(-2*bitRate))^2)/12;
    lagrange = ((sigmaQ/(P + sigmaQ))*sqrt(trapz(powerx)))^2;
    fprintf('bitrate:%g  sigmaQ:%d   lagrange:%d\n',bitRate,sigmaQ,lagrange);
    G = sqrt(sigmaQ./(lagrange.*powerx))-sigmaQ./powerx;
    H = sqrt( lagrange.*powerx/sigmaQ) - lagrange;
    figure(); 
    set(gcf,'name',sprintf('Bitrate: %g',bitRate),'numbertitle','off')
    subplot(2,1,1); plot(-.5:1/(2*N-2):.5, abs(G)),title('G(f)');
    subplot(2,1,2); plot(-.5:1/(2*N-2):.5, abs(H)),title('H(f)');
end