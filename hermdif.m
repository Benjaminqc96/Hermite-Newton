clear 
close all
clc
syms x
fprintf('Ingrese la opcion siguiente: \n')
fprintf('1. Nodos y funcion\n2. coordenadas\n')
control=input('');
        nod=[];
fnod=[];
fpnod=[];
switch (control)
    case control==1
        fu=input('Ingrese la funcion: ');
        fprima=diff(fu,x);
        cont=input('¿Cuantos nodos desea ingresar?: ');
        for i=1:cont
            fprintf('Nodo %d: ',i)
            nod(i)=input('');
        end
        for j=1:cont
            fnod(j)=double(subs(fu,nod(j)));
        end
         for k=1:cont
            fpnod(k)=double(subs(fprima,nod(k)));
         end
        %dd=ddiv(nod,fnod,cont);
    otherwise
        cont=input('¿Cuantas coordeneadas desea ingresar: ');
        for i=1:cont
            fprintf('Ingrese x%d: ',i)
            nod(i)=input('');
        end
         for j=1:cont
            fprintf('Ingrese y%d: ',j)
            fnod(j)=input('');
         end
          for k=1:cont
            fprintf('Ingrese y´%d: ',k)
            fpnod(k)=input('');
         end
end      
ncont=cont*2;
for t=1:ncont
    if mod(t,2)==0
        nnod(t)=nod(t/2);
        nfnod(t)=fnod(t/2);
        nnod(t-1)=nnod(t);
        nfnod(t-1)=nfnod(t);
    end
end
[dd,pol]=hddiv(nnod,nfnod,fpnod,cont);
[ddh,polh]=ddiv(nod,fnod,cont);
ppol=str2mat(pol);
ppolh=str2mat(polh);
z=0:.01:30;
ejez=double(subs(ppol,z));
ejezh=double(subs(ppolh,z));
for i=1:length(ejez)
    err(i)=ejez(i)-ejezh(i);
   
end
ezplot(ppol)
grid on
hold on
ezplot(ppolh)
hold off
