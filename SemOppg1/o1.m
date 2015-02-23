%% o1
N = 1000;
x = randn(1,N);
p = .9;
x(1) = x(1) * sqrt(1-p.^2);
for i = [2 N]
    x(i) = p*x(i-1) + sqrt(1-p.^2)*x(i);
end
corrx = xcorr(x);
powerx = fft(corrx);
subplot(2,1,1); plot( -N+1:1:N-1 , corrx );
subplot(2,1,2); plot(abs(powerx));

% o2

Fs = 44000;
f = 0:1/(Fs-1):1;
sigmaU = 1;
P = 1;
bitRate = .75;
d = 2*pi*exp(1)*sigmaU*2.^(-2*bitRate);
sigmaQ = (d/12)^2;
lagrange = (sigmaQ/(P + sigmaQ))*sum(powerx);
G = sqrt( sigmaQ/lagrange./(powerx)-sigmaQ./powerx);
H = sqrt(lagrange*powerx/sigmaQ) - lagrange;
% figure
% plot(abs(fft(G,1)));
%powerout = 1/lagrange*sqrt(powerx.*sigmaQ) - sigmaQ;
% figure();
% plot(powerout);