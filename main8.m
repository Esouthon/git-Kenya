clear all
close
%% Bornes lb et ub
lb=zeros(1,8);
ub=8000*ones(1,8);
%% Contrainte linéaire
A=zeros(4,8);
b=zeros(8,1);
%for k=1:1:8
A(1,1)=-0.5;
b(1)=1000;
A(2);
A=[];
b=[];

%% Contrainte d'égalité
Aeq=[];
beq=[];
%% Initialisation 
%x0 = randi([4000,5000],10,1);
x0=[1100 1000 3000 3000 3200 3000 4000 3000];
%x0=[3200 3800 3200 2800 3200 1800 4000 4000 5000 5000];
%% Lancement programme 
options=optimoptions(@fmincon);
options=optimoptions(options,'Display','none','Plotfcns',@optimplotfval,'Algorithm','Interior-point','MaxFunctionEvaluations',7000);
%options=optimoptions(options,'Display','none','Plotfcns',@optimplotfval,'Algorithm','sqp','MaxFunctionEvaluations',7000);

[resultat,fval,exitflag,output,lambda]=fmincon(@calcul8,x0,A,b,[],[],lb,ub,@noncol_kenya_v8,options)

[P,o]=calcul8(resultat)
%% Représentation graphique

figure
hold on
%Ile de Rusinga
X1=1000*[0 0.5 1 2 2.75 2.5 2.5 4 8 2 0.75];
Y1=1000*[1 1.75 2 2 3 4 4.75 5 3 0 0.4];
pt1=fill(X1,Y1,[187/255 174/255 152/255]);

%Lac Victoria
X3=[8000 4000 2500 2500 2750 2000 1000 500 0 -1000 -1000 10000 10000 -1000  -1000 0 750 2000 8000];
Y3=[3000 5000 4750 4000 3000 2000 2000 1750 1000 1000 10000 10000 -2000 -2000  1000 1000 400 0 3000];
pt2=fill(X3,Y3,[176/255 224/255 230/255]);

%Position des villages
[villages, Livraison]=f_villages8;
%La focntion dégradée donne une couleur plus ou moins foncée pour les
%points de densité
degrade=@(x) 0.4952*x+73.26;


%pt3=plot(villages(1,1),villages(1,2),"d",'Color',[degrade(Livraison(1))/255 0 0],'MarkerSize',69);
pt3=scatter(villages(1,1),villages(1,2),"filled",'MarkerFaceColor',[degrade(Livraison(1))/255 0 0],"LineWidth",10);
text(villages(1,1)-80,villages(1,2)+150,"A",'FontSize',7);

scatter(villages(2,1),villages(2,2),"filled",'MarkerFaceColor',[degrade(Livraison(2))/255 0 0]);
text(villages(2,1)-80,villages(2,2)+150,"B",'FontSize',7);

scatter(villages(3,1),villages(3,2),"filled",'MarkerFaceColor',[degrade(Livraison(3))/255 0 0]);
text(villages(3,1)-80,villages(3,2)+150,"C",'FontSize',7);

scatter(villages(4,1),villages(4,2),"filled",'MarkerFaceColor',[degrade(Livraison(4))/255 0 0]);
text(villages(4,1)-80,villages(4,2)+150,"D",'FontSize',7);

scatter(villages(5,1),villages(5,2),"filled",'MarkerFaceColor',[degrade(Livraison(5))/255 0 0])
text(villages(5,1)-80,villages(5,2)+150,"E",'FontSize',7);

scatter(villages(6,1),villages(6,2),"filled",'MarkerFaceColor',[degrade(Livraison(6))/255 0 0]);
text(villages(6,1)-80,villages(6,2)+150,"F",'FontSize',7);

scatter(villages(7,1),villages(7,2),"filled",'MarkerFaceColor',[degrade(Livraison(7))/255 0 0]);
text(villages(7,1)-80,villages(7,2)+150,"G",'FontSize',7);

scatter(villages(8,1),villages(8,2),"filled",'MarkerFaceColor',[degrade(Livraison(8))/255 0 0]);
text(villages(8,1)-80,villages(8,2)+150,"H",'FontSize',7);

scatter(villages(9,1),villages(9,2),"filled",'MarkerFaceColor',[degrade(Livraison(9))/255 0 0]);
text(villages(9,1)-80,villages(9,2)+150,"I",'FontSize',7);

scatter(villages(10,1),villages(10,2),"filled",'MarkerFaceColor',[degrade(Livraison(10))/255 0 0]);
text(villages(10,1)-80,villages(10,2)+150,"J",'FontSize',7);

scatter(villages(11,1),villages(11,2),"filled",'MarkerFaceColor',[degrade(Livraison(11))/255 0 0]);
text(villages(11,1)-80,villages(11,2)+150,"K",'FontSize',7);

scatter(villages(12,1),villages(12,2),"filled",'MarkerFaceColor',[degrade(Livraison(12))/255 0 0]);
text(villages(12,1)-80,villages(12,2)+150,"L",'FontSize',7);

scatter(villages(13,1),villages(13,2),"filled",'MarkerFaceColor',[degrade(Livraison(13))/255 0 0]);
text(villages(13,1)-80,villages(13,2)+150,"M",'FontSize',7);

pt5=scatter(villages(14,1),villages(14,2),"filled",'MarkerFaceColor',[degrade(Livraison(14))/255 0 0]);
text(villages(14,1)-80,villages(14,2)+150,"N",'FontSize',7);
%% Visualisation graphique des solutions
Y=reshape(resultat,[2,4]);
Y=Y';
% Cercle de 1km autour des Wk
th1 = 0:pi/50:2*pi;
for k=1:1:4
    x_cercle_wk = 1000*cos(th1) + Y(k,1);
    y_cercle_wk = 1000*sin(th1) + Y(k,2);
    pt6=plot(x_cercle_wk,y_cercle_wk ,'--','Color',[(103-30)/255 (113-30)/255 (121-30)/255]);
end
%Affichage des solutions
pt4=plot(Y(1,1),Y(1,2),"b x");
%text(Y(1,1),Y(2,1),"1")
plot(Y(2,1),Y(2,2),"b x")
%text(Y(2,1),Y(2,2),"2")
plot(Y(3,1),Y(3,2),"b x")
%text(Y(3,1),Y(3,2),"3")
plot(Y(4,1),Y(4,2),"b x")
%text(Y(4,1),Y(4,2),"4")

%Mise en forme de la carte
title('Carte des Water-Kiosques de Runsiga Central');
legend([pt1 pt2 pt3 pt5 pt4],{'Rusinga Central','Lac Victoria','Point de Densité fort','Point de Densité faible','Water-Kiosques'},'Location','southeast');
xlim([0 9000]);
ylim([0 6000]);
xlabel('Km');
ylabel('Km');
 
hold off