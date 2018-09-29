function [dd,pol]=hddiv(nod,fnod,fpnod,cont)
syms x
ncont=2*cont;
dd=zeros(ncont);
for t=1:ncont
if mod(t,2)==0
      dd(t-1,2)=fpnod(t/2);
end
end
dd(:,1)=fnod(:);
ia=2;
   for k=1:ncont-ia+1
       if mod(k,2)==0 
       dd(k,ia)=(dd(k+1,ia-1)-dd(k,ia-1))/(nod(k+ia-1)-nod(k));
       end
   end
for i=3:ncont
    for k=1:ncont-i+1
       dd(k,i)=(dd(k+1,i-1)-dd(k,i-1))/(nod(k+i-1)-nod(k)); 
    end
end

pol=num2str(dd(1,1));
xs=nod*-1;
for p=2:ncont
    signo='';
    if dd(1,p)>=0
        signo='+';
    end
    xt='';
    for u=1:p-1
        signo2='';
        if xs(u)>=0
            signo2='+';
        end
        xt=strcat(xt,'*(x',signo2,num2str(xs(u)),')');
        
    end
    pol=strcat(pol,signo,num2str(dd(1,p)),xt);
end

end