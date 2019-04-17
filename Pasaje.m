a=input('Ingrese una cadena: ','s');
len=strlength(a);


if (a(1)=='(' && a(len)==')' && count(a,",")==1 && count(a,"(")==1 && count(a,")")==1)
        binomica=erase(a,"(");
        binomica=erase(binomica,")");
        binomica_separado=strsplit(binomica,",");
        [real,realer]=str2num(binomica_separado{1});
        [img,imger]=str2num(binomica_separado{2});
        if(realer==1&&imger==1)
             [mod,ang]=  bin2pol(real,img)
             polar=strcat("[",num2str(mod),";",num2str(ang),"]")
                       
        else
            disp("ERROR DATO")
        end

        
elseif (a(1)=='[' && a(len)==']' && count(a,";")==1 && count(a,"[")==1 && count(a,"]")==1)

        polar=erase(a,"[");
        polar=erase(polar,"]");
        polar_separado=strsplit(polar,";");
        [mod,moder]=str2num(polar_separado{1});
        [ang,anger]=str2num(polar_separado{2});
        if(moder==1&&anger==1 && mod>=0)
          [real,img]=pol2bin(mod,ang)
          binomica=strcat("(",num2str(real),",",num2str(img),")")
            
        else
            disp("ERROR DATO")
        end

    else
        disp("ERROR");
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