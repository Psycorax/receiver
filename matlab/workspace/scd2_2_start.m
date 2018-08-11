% ########################## scd2_2.m ###########################
% Transformation of an IIR filter to the cascade structure

clear all
close all

%% a.) load the filter into the workspace

load filt1 filt1

%% b.) transfer the filter to poles and zeros and check if the poles are inside the unit circle

% get a and b values from the filter
b = filt1.tf.num;
a = filt1.tf.den;

% transfer the filter to poles and zeroes
[z,p,k] = tf2zp(b, a);

% print the unit circle 
FIG1 = figure('Name','Pole-Zero-Plot of filt1','NumberTitle','off');
zplane(z,p), grid % pole-zero plot
xlabel('Re\{z\} \rightarrow'), ylabel('Im\{z\} \rightarrow')

% check if all poles are inside the unit circle
all_poles_inside = true;

for k=1:length(p)
    if(abs(p(k)) >= 1)
        all_poles_inside = false;
    end
end

fprintf('####### b.) pole zero plot of filt 1 #######\n');

% print result
if(all_poles_inside)
    fprintf('All poles are inside the circle!\n');
else
    fprintf('Not all poles are inside the circle!\n');
end

%% c.) transform the filter to second order systems

[sos, g] = tf2sos(b, a);

b1 = sos(1, 1:3);
a1 = sos(1, 4:6);
b2 = sos(2, 1:3);
a2 = sos(2, 4:6);
b3 = sos(3, 1:3);
a3 = sos(3, 4:6);


fprintf('\n####### c.) second order system 1 #######\n');

fprintf('SOS1: |a_1| < 2 und |a_2| < 1 trifft ');

if (abs(a1(2)) < 2) && (abs(a1(3)) < 1)
    fprintf('zu!\n');
else
    fprintf('nicht zu!\n');
end

H1tf = filt(b1, a1, -1)


fprintf('\n####### c.) second order system 2 #######\n');

fprintf('SOS2: |a_1| < 2 und |a_2| < 1 trifft ');

if (abs(a2(2)) < 2) && (abs(a2(3)) < 1)
    fprintf('zu!\n');
else
    fprintf('nicht zu!\n');
end

H2tf = filt(b2, a2, -1)


fprintf('\n####### c.) second order system 3 #######\n');

fprintf('SOS3: |a_1| < 2 und |a_2| < 1 trifft ');

if (abs(a3(2)) < 2) && (abs(a3(3)) < 1)
    fprintf('zu!\n');
else
    fprintf('nicht zu!\n');
end

H3tf = filt(b3, a3, -1)

% print the unit circles of each SOS
[z1,p1,~] = tf2zp(b1, a1);
FIG2 = figure('Name','Pole-Zero-Plot of SOS 1,2 and 3','NumberTitle','off');
subplot(1,3,1), zplane(z1,p1), grid % pole-zero plot
xlabel('Re\{z\} \rightarrow'), ylabel('Im\{z\} \rightarrow')
title('SOS 1')
axis([-1.5 1.5 -1.5 1.5])

[z2,p2,~] = tf2zp(b2, a2);
subplot(1,3,2), zplane(z2,p2), grid % pole-zero plot
xlabel('Re\{z\} \rightarrow'), ylabel('Im\{z\} \rightarrow')
title('SOS 2')
axis([-1.5 1.5 -1.5 1.5])

[z3,p3,~] = tf2zp(b3, a3);
subplot(1,3,3), zplane(z3,p3), grid % pole-zero plot
xlabel('Re\{z\} \rightarrow'), ylabel('Im\{z\} \rightarrow')
title('SOS 3')
axis([-1.5 1.5 -1.5 1.5])

%% d.) amplitude response of the three SOS

[H, f] = freqz(b, a);
[H1, f1] = freqz(b1, a1);
[H2, f2] = freqz(b2, a2);
[H3, f3] = freqz(b3, a3);
[bsos, asos] = sos2tf(sos, g);
[Hsos, fsos] = freqz(bsos, asos);

% print the amplitude responses
FIG3 = figure('Name','Amplitude Response of SOS 1,2 and 3','NumberTitle','off');
subplot(3,1,1)
plot(f1, 20*log(abs(H1)))
grid % pole-zero plot
xlabel('\Omega'), ylabel('20*log10(|H(\Omega_{SOS1})|)')
title('SOS 1')

subplot(3,1,2)
plot(f2, 20*log(abs(H2)))
grid % pole-zero plot
xlabel('\Omega'), ylabel('20*log10(|H(\Omega_{SOS2})|)')
title('SOS 2')

subplot(3,1,3)
plot(f3, 20*log(abs(H3)))
grid % pole-zero plot
xlabel('\Omega'), ylabel('20*log10(|H(\Omega_{SOS3})|)')
title('SOS 3')

FIG4 = figure('Name','Amplitude Response of H(z) and H_gsos(z)','NumberTitle','off');
subplot(2,1,1)
plot(f, 20*log(abs(H)))
grid % pole-zero plot
xlabel('\Omega'), ylabel('20*log10(|H(\Omega)|)')
title('H(z)')

subplot(2,1,2)
plot(fsos, 20*log(abs(Hsos)))
grid % pole-zero plot
xlabel('\Omega'), ylabel('20*log10(|H(\Omega_{SOS})|)')
title('H_{sos}(z)')