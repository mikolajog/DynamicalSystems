%metoda Newton-Raphson Mikołaj Ogarek

function root = newtonRaphsonMikolajOgarek(p, start, epsilon)
war=0;

if((polyval(p,start)*polyval(polyder(polyder(p)),start))<0)
    root="err";
    return
end

prev= start-(polyval(p,start)/polyval(polyder(p), start));
while(war<100)
    war=war+1;
    xn=prev-(polyval(p,prev)/polyval(polyder(p), prev));
    if((abs(polyval(p,xn))<=epsilon) || (abs(xn-prev)<=epsilon))
        root=xn;
        war=101;
    end
    if(war==100)
        root=xn;
    end
    prev=xn;
end


