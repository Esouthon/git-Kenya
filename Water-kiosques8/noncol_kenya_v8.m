function [c,ceq]=noncol_kenya_v8(X)

nb_villages=14;
nb_wk=4;

%Position des WK
Y=reshape(X,[2,nb_wk]);
Y=Y';


[villages, ~]=f_villages8;

c=[];
ceq=zeros(1,nb_villages);

%% Fonction anonyme

Distance=@(x,y,z,t) sqrt((x-z)^2+(y-t)^2);

%% Contrainte non linéaire d'égalité
%|      | Wk_A = Distance point A, point B, point C... point J |
%|      | Wk_B = Distance point A, point B, point C... point J |
%|M=    | Wk_C = Distance point A, point B, point C... point J |
%|      | Wk_D = Distance point A, point B, point C... point J |
%|      | Wk_E = Distance point A, point B, point C... point J |
%|      
M=zeros(nb_wk,nb_villages);
%on calcule la distance des WK aux points importants
for i=1:1:nb_wk
    for k=1:1:nb_villages
        M(i,k)=Distance(Y(i,1),Y(i,2),villages(k,1),villages(k,2));
    end 
end


%On regarde par village le WK le plus proche
[M_mini,~]=min(M);

for k=1:1:nb_villages
    %Si la distance minimum est plus d'1km, contrainte non validée
    if M_mini(k)>=1500
        ceq(k)=M_mini(k);
    end
end


