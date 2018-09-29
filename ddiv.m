function [dd,pol]=ddiv(nod,fnod,cont)
syms x
dd=zeros(cont);
dd(:,1)=fnod(:);
for i=2:cont
   for k=1:cont-i+1
       dd(k,i)=(dd(k+1,i-1)-dd(k,i-1))/(nod(k+i-1)-nod(k));
   end
end

pol=num2str(dd(1,1));
xs=nod*-1;
for p=2:cont
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