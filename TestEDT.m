%test numeros complejos
function algo = TestEDT()


function [ mod,ang ] = parOrd2pol( real,img )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    mod=sqrt(real^2+img^2);
    ang_=atan(img/real);
    if(real>0 && img>0)
       ang=ang_;
    elseif(real>0 && img<0)
       ang=ang_+2*pi;
    else
       ang=ang_+pi;
    end        
end

function [ mod,ang ] = bin2pol( complejo)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
nreal = real(complejo);
nimg = img(complejo);
    mod=sqrt(nreal^2+nimg^2);
    ang_=atan(nimg/nreal);
    if(nreal>0 && nimg>0)
       ang=ang_;
    elseif(nreal>0 && nimg<0)
       ang=ang_+2*pi;
    else
       ang=ang_+pi;
    end        
end

function [ real,img,err ] = pol2parOrd( mod,ang )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if (mod>=0)
        real=mod*cos(ang);
        img=mod*sin(ang);
        err=1;
    else
        err=0;
    end
end

    function complejo = valida(str)
       L = length(str); 
  %     if(L>0)
           %ver si esta en forma de par ordenado
           k=0;
           k = strfind(str,';');
          % if()
    end

%[x,y]=bin2poli(2,3);
a= input('ingrese dato');
fprintf('numero ingresado %i\n',a);
%fprintf('angulo %g\n',y);
e1='3t';
e2= '2+3i';
fprintf('parte imaginaria %g\n',imag(2+3i));
%fprintf('parte imaginaria %g\n',imag(e1));
fprintf('parte imaginaria %g\n',imag(e2));

end

