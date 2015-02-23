Fs = 44000;
f = 0:1/(Fs-1):1;
sigmaU = 1;
bitRate = .75;
d = 2*pi*exp(1)*sigmaU*2.^(-2*bitRate);