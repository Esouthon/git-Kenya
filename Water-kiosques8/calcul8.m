function [Cout,M]=calcul8(X)


%Importation des coordonées des villages
[villages, Livraison]=f_villages8;
%Cout arbitraire du transport
C_trans=50;
%Initialisation du cout total
Cout=0;
%Capacité maximum d'un Wk
max=825;
%Données du problèmes
nb_villages=14;
nb_wk=4;
%Création de la matrice des distances
M=zeros(nb_wk,nb_villages+3);
M(:,1)=[1;2;3;4];
%Fonction anonyme de calcul de la distance
Distance=@(x,y,z,t) sqrt((x-z)^2+(y-t)^2);


for k=1:1:nb_villages
    %Liste de la distance d'un entropôt par rapport à une ville
    Distance_entr_1=Distance(X(1),X(2),villages(k,1),villages(k,2));
    Distance_entr_2=Distance(X(3),X(4),villages(k,1),villages(k,2));
    Distance_entr_3=Distance(X(5),X(6),villages(k,1),villages(k,2));
    Distance_entr_4=Distance(X(7),X(8),villages(k,1),villages(k,2));
 
    
    M(:,2)=[Distance_entr_1;Distance_entr_2;Distance_entr_3;Distance_entr_4];
    
    %On trie la matrice pour avoir la liste des entrepôts par ordre
    %croissant de leur distance à la ville k
    %C'est la deuxième colonne avec les distances
    M=sortrows(M,2);
    
    for j=1:1:Livraison(k)
        if M(1,3)+1<=max
            %Cout=Cout+ 2*C_trans*M(1,2)+10;
            Cout=Cout+ C_trans*M(1,2)^2;
            M(1,3)=M(1,3)+1;
            M(1,k+3)=M(1,k+3)+1;
        elseif M(2,3)+1<=max
            %Cout=Cout+ 2*C_trans*M(2,2)+15;
            Cout=Cout+ C_trans*M(2,2)^2;
            M(2,3)=M(2,3)+1; 
            M(2,k+3)=M(2,k+3)+1;
        elseif M(3,3)+1<=max
            %Cout=Cout+ 2*C_trans*M(3,2)+20;
            Cout=Cout+ C_trans*M(3,2)^2;
            M(3,3)=M(3,3)+1;
            M(3,k+3)=M(3,k+3)+1;
        elseif M(4,3)+1<=max
            %Cout=Cout+ 2*C_trans*M(4,2)+25;
            Cout=Cout+ C_trans*M(4,2)^2;
            M(4,3)=M(4,3)+1;
            M(4,k+3)=M(4,k+3)+1;
        end
    end
    M=sortrows(M,1);
end
