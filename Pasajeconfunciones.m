a=input('Ingrese una cadena: ','s');
[b1,b2,tipo,err ] = validacion(a);
if (err==1)
    if(tipo==1)
        [n1,n2]=  pol2bin(b1,b2);
    else
        [n1,n2]=  bin2pol(b1,b2);
    end
        concatcomplex(n1,n2,tipo)
else
    disp('Error en los datos ingresados');
end



        





function [ mod,ang ] = bin2pol( real,img )
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




function [ real,img,err ] = pol2bin( mod,ang )
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



function [ b1,b2,tipo,err ] = validacion(a)
%UNTITLED Summary of this function goes here
%   se la pasa un string y devuelve que tipo de valor polar o binomica, si
%   es valido el ingreso de dato y seccionado
len=strlength(a);

if (a(1)=='(' && a(len)==')' && count(a,",")==1 && count(a,"(")==1 && count(a,")")==1)
        binomica=erase(a,"(");
        binomica=erase(binomica,")");
        binomica_separado=strsplit(binomica,",");
        [real,realer]=str2num(binomica_separado{1});
        [img,imger]=str2num(binomica_separado{2});
        if(realer==1&&imger==1)
            b1=real;
            b2=img;
            tipo=0;
            err=1;   
                       
        else
            b1=-1;
            b2=-1;
            tipo=-1;
            err=0;
        end
        
       elseif (a(1)=='[' && a(len)==']' && count(a,";")==1 && count(a,"[")==1 && count(a,"]")==1)

        polar=erase(a,"[");
        polar=erase(polar,"]");
        polar_separado=strsplit(polar,";");
        [mod,moder]=str2num(polar_separado{1});
        [ang,anger]=str2num(polar_separado{2});
        if(moder==1&&anger==1 && mod>=0)
            b1=mod;
            b2=ang;
            tipo=1;
            err=1;           
        else
            b1=-1;
            b2=-1;
            tipo=-1;
            err=0;
        end

    else
            b1=-1;
            b2=-1;
            tipo=-1;
            err=0;
end

end



function [ c ] = concatcomplex( b1,b2,tipo )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if (tipo==1)
        c=strcat("[",num2str(b1),";",num2str(b2),"]");
    elseif (tipo==0)
        c=strcat("(",num2str(b1),",",num2str(b2),")");
    end
end
