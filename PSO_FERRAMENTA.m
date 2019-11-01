clear all;
clc;

niter = 30;
nparti = 10000;

c1 = 0.5;
c2 = 1; 
w  = 0.5;

Pos = randi([-30 , 30],1,nparti);
Vel = randi((20),1,nparti);

Sol = -Pos.^2;
%Sol = (12*Pos.^5 - 975*Pos.^4 + 2800*Pos.^3 - 345000*Pos.^2 + 1800000*Pos)/1000000

Pbest = Pos;
[maxfo, k] = max(Sol);
Gbest = Pos(:,k);

% %------------------------------------------------------------------------------------------------%
for J = 2 : niter
    
    Vel(J,:) = w.*Vel(J-1,:) + c1.*rand(1,nparti).*(Pbest(J-1,:)-Pos(J-1,:)) + c2.*rand(1,nparti).*(Gbest(J-1) - Pos(J-1,:));
    Pos(J,:) = Pos(J-1,:)+Vel(J,:);
    Sol = -Pos.^2;
    %Sol = (12*Pos.^5 - 975*Pos.^4 + 2800*Pos.^3 - 345000*Pos.^2 + 1800000*Pos)/1000000
    
    [maxfo, index] = max(Sol);
    
    for c = 1:nparti
        auxP(1,c) = Pos(index(c),c);
    end
    
    Pbest = [Pbest; auxP];
    
    [maxC,indC] = max(Sol);
    [maxL,indL] = max(maxC);
    Gbest = [Gbest; Pos(indC(indL),indL)];
end