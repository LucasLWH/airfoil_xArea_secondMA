%{
Written by Lucas Lim
12/3/20
%}
%% Import
data = readmatrix('.xlsx','Range','');

%% Process
%Gen Polyshape
pgon = polyshape(data(:,1),data(:,2));
%Detect centroid & center on origin
[cenX,cenY]=centroid(pgon)
xShifted = data(:,1)-cenX;
yShifted = data(:,2)-cenY;

%Create centred polyshape
pgon2 = polyshape(xShifted,yShifted);
plot(pgon2)
plot(zeros(length(xShifted)),yShifted,'r')
plot(xShifted,zeros(length(yShifted)),'r')

%Numerical Integration for 2nd moment of area
I_x = 0;
for i = 1:length(xShifted)-1
    U_n=(xShifted(i)*yShifted(i+1)-xShifted(i+1)*yShifted(i))*(yShifted(i)^2+yShifted(i)*yShifted(i+1)+yShifted(i+1)^2);
    I_x = I_x + (1/12)*U_n;
end
disp(I_x)

%Cross-sectional area of polyshape
Cross_area=area(pgon2)
