%{
Written by Lucas Lim
12/3/20
%}
%% Outer
data = readmatrix('Generated_coord_Yardley.xlsx','Range','d1:e400');
%% Inner
% data = readmatrix('Generated_inner_Yardley.xlsx','Range','h1:i400');
%% Process
pgon = polyshape(data(:,1),data(:,2))

% plot(pgon)
hold on
[cenX,cenY]=centroid(pgon)

%Apply proper translations
xShifted = data(:,1)-cenX;
yShifted = data(:,2)-cenY;

pgon2 = polyshape(xShifted,yShifted);
plot(pgon2)
plot(zeros(length(xShifted)),yShifted,'r')
plot(xShifted,zeros(length(yShifted)),'r')

I_x = 0
for i = 1:length(xShifted)-1
    U_n=(xShifted(i)*yShifted(i+1)-xShifted(i+1)*yShifted(i))*(yShifted(i)^2+yShifted(i)*yShifted(i+1)+yShifted(i+1)^2);
    I_x = I_x + (1/12)*U_n;
end

disp(I_x)

Inner_area=area(pgon2)