No_microphones = 24;  % Number of microphones in one array.
frequency = 26000;    % Frequency of source.
phi = pi/2;       % Look-direction of beam(this should be less than 180 and greater than 0).
Distance = 11.4e-3; % Distance between microphones in meters.
%psi = linspace(0, 180, 1000); % Plot range.
points = 2500; %no of points to plot the graph.
si = linspace(0, pi, points);
c = 343;        %speed of light in meters
w = 2*pi*frequency;   % Angular frequency of source for the polar plot

first = cos(si)-cos(phi);
second = (pi*frequency*Distance.*first)./c;

W = 20*log10(abs( sin(No_microphones.*second)./(No_microphones.*sin(second))));

figure
ca = linspace(-180,180,points); % This has to be fixed to display the correct angle
plot(ca, W)
grid on
title('Cartesian')
xlabel('angle of arrival in deg')
ylabel('Gain in dB')

figure
pa = polaraxes;
polarplot(si, W+40);
pa.ThetaLim = [0 180];
hold on
polarplot([phi phi], [0 1])
hold off