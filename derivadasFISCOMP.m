%{
    LA NORMA INFINITA 
    Calculando Derivadas hacia adelante, atras y centradas
    F(X) = sin(X)
    Actividad 1    Ricardo Lopez R. A01066515
%}

function derivadasFISCOMP()

    close all
    errorAdelanteAct = 0;
    errorAdelanteAct2 = 0;
    errorAdelanteAct3 = 0;
    errorAdelanteAct4 = 0;
    errorAdelanteAct5 = 0;
    errorAdelanteAct6= 0;
    
    div = 150;
    
    x2 = linspace(0,2*pi,1000);
    x = linspace(0,2*pi,div);
    f = sin(x);   %declaracion de funcion
    fPrime = cos(x2);
    fPrime2 = @(theta)cos(theta);
    h = x(2) - x(1) ;   % delta x
    disp("h---> "+h);
    n = length(f);
    deriv = zeros(1,n);
    deriv2 = zeros(1,n);
    deriv3 = zeros(1,n);
    deriv4 = zeros(1,n);
    deriv5 = zeros(1,n);
    deriv6 = zeros(1,n);
    
    %Derivadas hacia adelante    
    for i = 1:length(x)
        
        if i <= length(x) -1 
            
            deriv(i) = (f(i+1) - f(i))/h;            
            errorAdelante1 = abs(fPrime2(x(i))-deriv(i));
            errorAdelanteAct = errorAdelanteAct + errorAdelante1 ; 
        end
        
        if i <= length(x) -2 
            
            deriv2(i) = (-f(i+2) + 4*f(i+1) - 3*f(i))/(2*h);            
            errorAdelante2 = abs(fPrime2(x(i))-deriv2(i));
            errorAdelanteAct2 = errorAdelanteAct2 + errorAdelante2 ; 
        end
        
    end
   
   disp("Error hacia adelante con 2 puntos ----> "+errorAdelanteAct);
   disp("Error hacia adelante con 3 puntos ----> "+errorAdelanteAct2);
    
%     deriv(length(x)) = deriv(length(x)-1);
%     deriv2(length(x)-1) = deriv2(length(x)-2);
%     deriv2(length(x)) = deriv(length(x)-1);    
    graficar(x2,fPrime,x,deriv,deriv2,1,"Derivada hacia adelante");

    %Derivadas hacia atras    
    for i = length(x):-1:1
        
        if i >= 2
            deriv3(i) = (f(i) - f(i-1))/h; 
            errorAdelante3 = abs(fPrime2(x(i))-deriv3(i));
            errorAdelanteAct3 = errorAdelanteAct3 + errorAdelante3 ; 
        end
        
        if i >= 3
            deriv4(i) = (3*f(i) - 4*f(i-1) + f(i-2))/(2*h); 
            errorAdelante4 = abs(fPrime2(x(i))-deriv4(i));
            errorAdelanteAct4 = errorAdelanteAct4 + errorAdelante4 ; 
        end
    end   
    
    disp("Error hacia atras con 2 puntos ----> "+errorAdelanteAct3);
    disp("Error hacia atras con 3 puntos ----> "+errorAdelanteAct4);
    graficar(x2,fPrime,x,deriv3,deriv4,3,"Derivada hacia atras");
    
    %Derivadas Centrales    
    for i = 2:length(f)-1         
        
        deriv5(i) = (f(i+1) - f(i-1)) /(2*h);        
        errorAdelante5 = abs(fPrime2(x(i))-deriv5(i));
        errorAdelanteAct5 = errorAdelanteAct5 + errorAdelante5; 

    end
    
    for i = 3:length(f)-2
        
        deriv6(i) = (-f(i+ 2) + 8*f(i+1) - 8*f(i-1) + f(i-2))/(12*h) ;
        errorAdelante6 = abs(fPrime2(x(i))-deriv6(i));
        errorAdelanteAct6 = errorAdelanteAct6 + errorAdelante6 ;        
    end    
    
    disp("Error hacia central con 2 puntos ----> "+errorAdelanteAct5);
    disp("Error hacia central con 3 puntos ----> "+errorAdelanteAct6);
    graficar(x2,fPrime,x,deriv5,deriv6,5,"Derivada Central");

end


function graficar(x2,f,x,deriv,deriv2,num, tit)

    figure (num+1)
    plot(x2,f,'b');
    title(tit+" 3 puntos");
    hold on
    grid on
    plot(x,deriv2,'ro');
    %axis square
    
    figure (num)
    plot(x2,f,'b');
    title(tit+" 2 puntos");
    hold on
    grid on
    plot(x,deriv,'ro');
    %axis square

end