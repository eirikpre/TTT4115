
N = 100;
x = zeros(1,N);
p = 0.9;
x(1) = sqrt(1-p^2)*randn();
for i = 2:N
    x(i) =  (p*x(i-1) + sqrt(1-p^2)*randn()) ;
end
average;
for i = 1:average
    
% plot( xcorr(x,x) ) ;

plot( abs(fft(xcorr(x))));