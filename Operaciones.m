classdef Operaciones
    %Clase para operaciones basicas y avanzadas
    %referencia a NumeroComplejo
    
    %resultado es otro numero complejo.
    
    properties
        
    end
    
    methods
        %suma de numeros complejos
       function result=suma(thisoperaciones, numeroComplejo, otroNumeroComplejo)
        real= numeroComplejo.FormBinomica_real + otroNumeroComplejo.FormBinomica_real;
        img = numeroComplejo.FormBinomica_img + otroNumeroComplejo.FormBinomica_img;
        str=strcat('(',(num2str(real) ),',', num2str(img), ')');
        result = NumeroComplejo(str);
       end
        %resta de numeros complejos
        function result=resta(thisoperaciones, numeroComplejo, otroNumeroComplejo)
        real= numeroComplejo.FormBinomica_real - otroNumeroComplejo.FormBinomica_real;
        img = numeroComplejo.FormBinomica_img - otroNumeroComplejo.FormBinomica_img;
        str=strcat('(',(num2str(real) ),',', num2str(img), ')');
        result = NumeroComplejo(str);
       end
        %multiplicacion de numeros complejos
        
        %cociente o division de numeros complejos
        
        %potencia
        
        %radicacion numero natural       
        
        
    end
    
end

