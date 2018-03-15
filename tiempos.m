
clear all; clc;clf

n=100;
ni=[];
tt1=[];
tt2=[];
terror=[];

for i=1:n
    A=[];b=[];
    A=rand(n)*1e5;
    b=rand(n,1)*1e5;
    
    %% metodo 1
    tic
    x1=inv(A)*b;
    t1=toc;
    tt1=[tt1;t1];

    %% metodo 2
    tic
    [l,u]=lu(A,'vector');
    y=inv(l)*b;
    x2=inv(u)*y;
    t2=toc;
    tt2=[tt2;t2];
    error=norm(x1-x2);
    terror=[terror,error];
    ni=[ni,i];
    drawnow
    subplot(2,1,1)
    plot(ni,tt1,ni,tt2,'LineWidth',2)
    xlabel('Tamaño problema')
    ylabel('Tiempo [s]')
    legend('Tiempo Resolucion standard','Tiempo Resolucion LU')
    
    
    subplot(2,1,2)
    plot(ni,terror,'-k','LineWidth',2)
    xlabel('Tamaño problema (standard-LU)')
    ylabel('Error Normalizado')
    
end



