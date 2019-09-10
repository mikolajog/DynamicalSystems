% Autor: koziolek

%% Czyszczenie
clear all;
close all;

%% Rysowanie
% Konfiguracja
x_min = -1;
x_max =  1;
dx    = 0.25;

width  = 0.95;
height = 0.90;

% Lista portret�w - nie tyka� bo si� zepsuje :P
J(1,:) = [ 0  1,  0 -1,  0  0,  0  0,  1  0, -1  0,  0  0,  0  0,  1  0, -1  0,  2  0, -2  0,  1  0, -1  0,  1  1, -1  1, -1  0,  1  0,  0  1,  0 -1,  1  1, -1  1];
J(2,:) = [ 0  0,  0  0,  1  0, -1  0,  0  0,  0  0,  0  1,  0 -1,  0  2,  0 -2,  0  1,  0 -1,  0  1,  0 -1,  0  1,  0 -1,  0  1,  0 -1, -1  0,  1  0, -1  1, -1 -1];

titles = {
    'Poziome linie i kropki'
    'Pionowe linie i kropki'
    'Poziome linie'
    'Pionowe linie'
    'W�ze� 1'
    'W�ze� 2'
    'Gwiazda'
    'W�ze� zdegenerowany'
    'Siod�o'
    '�rodek'
    'Ognisko'
};

for j = 1:length(J(1,:))/2
    A = J(1:2, 2*j-1:2*j);
    
    % Nowe okno
    if mod(j, 2) == 1
        figure('Name', titles{ceil(j/2)}, 'Units', 'normalized', 'OuterPosition', [(1-width)/2 (1-height)/2 width height], 'MenuBar', 'none');
    end;
    
    subplot(1, 2, 2-mod(j, 2));
    
    [x1 x2] = meshgrid(x_min:dx:x_max, x_min:dx:x_max);
    
    dx1 = A(1,1)*x1 + A(1,2)*x2;
    dx2 = A(2,1)*x1 + A(2,2)*x2;
    quiver(x1, x2, dx1, dx2);
    
    title({
        [num2str(A(1,1)) ' ' num2str(A(1,2))],
        [num2str(A(2,1)) ' ' num2str(A(2,2))]
    });
    xlabel('x1');
    ylabel('x2');
    grid on;
    axis([x_min x_max x_min x_max]);
end;