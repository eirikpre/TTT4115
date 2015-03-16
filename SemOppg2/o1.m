close all
N = 10;
s = [1 zeros(1,N-1)];
k = tan([.39 .41 .45 .49]*pi);


 
zero = zeros(1,N);

u1 = TFB(s,zero,zero,zero,zero,zero,zero,zero,k);
u2 = TFB(zero,s,zero,zero,zero,zero,zero,zero,k);
u3 = TFB(zero,zero,s,zero,zero,zero,zero,zero,k);
u4 = TFB(zero,zero,zero,s,zero,zero,zero,zero,k);
u5 = TFB(zero,zero,zero,zero,s,zero,zero,zero,k);
u6 = TFB(zero,zero,zero,zero,zero,s,zero,zero,k);
u7 = TFB(zero,zero,zero,zero,zero,zero,s,zero,k);
u8 = TFB(zero,zero,zero,zero,zero,zero,zero,s,k);
figure(1); hold on, title('Freq. Response of TFB')
plot(abs(fft(u1)))
plot(abs(fft(u2)),'g');
plot(abs(fft(u3)),'y');
plot(abs(fft(u4)),'m');
plot(abs(fft(u5)),'c');
plot(abs(fft(u6)),'r');
plot(abs(fft(u7)),'k');
plot(abs(fft(u8)),'b--');
legend('u1','u2','u3','u4','u5','u6','u7','u8')
legend('show')
%% o2

h = [0.3336, 0.2975, 0.1328, 0.0729, 0.0389, 0.0274, 0.0172, 0.0140, 0.0098, 0.0087, 0.0064, 0.0061, 0.0047, 0.0048, 0.0037, 0.0042, 0.0029, 0.0046, 0.0010, 0.0086];
N = 50;
x = [1 zeros(1,N-1)];
y = filter(h,1,x);
figure(2)
plot(abs(fft(y)),'r');title('H(f)');

%2b
y1 = filter(h,1,u1);
y2 = filter(h,1,u2);
y3 = filter(h,1,u3);
y4 = filter(h,1,u4);
y5 = filter(h,1,u5);
y6 = filter(h,1,u6);
y7 = filter(h,1,u7);
y8 = filter(h,1,u8);
figure(3); title('Problem 2: b)');hold on;
plot(abs(fft(y1)))
plot(abs(fft(y2)),'g');
plot(abs(fft(y3)),'y');
plot(abs(fft(y4)),'m');
plot(abs(fft(y5)),'c');
plot(abs(fft(y6)),'r');
plot(abs(fft(y7)),'k');
plot(abs(fft(y8)),'b--');
legend('y1','y2','y3','y4','y5','y6','y7','y8')
legend('show')

%% 2c
v = filter(1,h,x);
figure(4);
stem(conv(v,h));  title('result of V & H in cascade: unit-pulse')
figure(5);  
zplane(h,1); title('zplane(h)')
figure(6)
zplane(1,h); title('zplane(v)')


%% 2d

figure(3); title('Problem 2: d)');hold on;
plot(abs(fft(filter(v,1,y1))))
plot(abs(fft(filter(v,1,y2))),'g');
plot(abs(fft(filter(v,1,y3))),'y');
plot(abs(fft(filter(v,1,y4))),'m');
plot(abs(fft(filter(v,1,y5))),'c');
plot(abs(fft(filter(v,1,y6))),'r');
plot(abs(fft(filter(v,1,y7))),'k');
plot(abs(fft(filter(v,1,y8))),'b--');
legend('y1','y2','y3','y4','y5','y6','y7','y8')
legend('show')
hold off

%% 2e
x = TFB([1 0 0 0 0 0 0 0],[0 1 0 0 0 0 0 0],[0 0 1 0 0 0 0 0],[0 0 0 1 0 0 0 0],[0 0 0 0 1 0 0 0],[0 0 0 0 0 1 0 0],[0 0 0 0 0 0 1 0], [0 0 0 0 0 0 0 1],k);
y = filter(h,1,x);
noise = randn(1,size(x,2))/100;
g = y + noise;
[p1, p2, p3, p4, p5, p6, p7, p8]=RFB(filter(v,1,g),k);

figure; hold on; title('2e: Output of the chain with G.noise')
plot(p1)
plot(p2,'g')
plot(p3,'y');
plot(p4,'m');
plot(p5,'c');
plot(p6,'r');
plot(p7,'k');
plot(p8,'b--');
hold off

%% 2f




