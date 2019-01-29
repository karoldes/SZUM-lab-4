function [pr1,pr2] = karol_karim (w1,w2)

x=0;                                %polozenie poczatkowe
y=0;
theta=0;

R = 0.025;                          %srednica kola
L = 0.15;                           %srednica robota


x1 = x + (L/2)*cos(pi/2+theta);     %obliczanie i rysowanie punktow pomocniczych
y1 = y + (L/2)*sin(pi/2+theta);

x2 = x - (L/2)*cos(pi/2+theta);
y2 = y - (L/2)*sin(pi/2+theta);

x3 = x + 0.025*cos(theta);
y3 = y + 0.025*sin(theta);

plot(x,y,'*k');
axis equal
hold on
plot(x1,y1,'bo');
hold on
plot(x2,y2,'go');
line([x1 x2],[y1 y2],'color','black');
line([x x3], [y y3], 'color', 'red');


for i=0:0.1:2
    xp = R*(w1 + w2)/2*cos(theta);      %obliczanie przesuniecia robota w czasie kroku
    yp = R*(w1 + w2)/2*sin(theta);
    thetap = R*(w1 - w2)/L;
    
    x = x + xp;
    y = y + yp;
    theta = theta + thetap;
    
    x1 = x + (L/2)*cos(pi/2+theta);     %obliczanie i rysowanie nowej pozycji
    y1 = y + (L/2)*sin(pi/2+theta);
    
    x2 = x - (L/2)*cos(pi/2+theta);
    y2 = y - (L/2)*sin(pi/2+theta);
    
    x3 = x + 0.025*cos(theta);
    y3 = y + 0.025*sin(theta);
    
    plot(x,y,'*k');
    axis equal
    hold on
    plot(x1,y1,'bo');
    hold on
    plot(x2,y2,'go');
    line([x1 x2],[y1 y2],'color','black');
    line([x x3], [y y3], 'color', 'red');
    
end

pr1 = round(w1*255/130);                %obliczenie wysterowan dla silnikow robota
pr2 = round(w2*255/130);

end
