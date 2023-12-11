nearest_binary32 := proc(xx)
   local x, sign, logabsx, exponent, mantissa, infmantissa, powermin,
   expmin, powermax, expmax, powermiddle, expmiddle;
   Digits := 100;
   x := evalf(xx);
   if (x=0) then sign, exponent, mantissa := 1, -126, 0
   else
     if (x < 0) then sign := -1
     else sign := 1
     fi:
     x := abs(x);
     if x >=  2^(127)*(2-2^(-24)) then mantissa := infinity; exponent := 127
     else if x <= 2^(-150) then mantissa := 0; exponent := -126
         else
            if x <= 2^(-126) then exponent := -126
            else
   # x is between 2^(-126) and 2^(128)
            powermin := 2^(-126); expmin := -126;
            powermax := 2^128; expmax := 128;
            while (expmax-expmin > 1) do
               expmiddle := round((expmax+expmin)/2);
               powermiddle := 2^expmiddle;
               if x >= powermiddle then
                   powermin := powermiddle;
                   expmin := expmiddle
               else
                   powermax := powermiddle;
                   expmax := expmiddle
               fi
             od;
   # now, expmax - expmin = 1
   # and powermin <= x < powermax
   # powermin = 2^expmin
   # and powermax = 2^expmax
   # so expmin is the exponent of x
            exponent := expmin;
            fi;
            infmantissa := x*2^(23-exponent);
            if frac(infmantissa) <> 0.5 then mantissa := round(infmantissa)
               else
                  mantissa := floor(infmantissa);
                  if type(mantissa,odd) then mantissa := mantissa+1 fi
                  fi;
            mantissa := mantissa*2^(-23);
fi; fi;
   fi;
   sign*mantissa*2^exponent;
   end:

nearest_binary64 := proc(xx)
   local x, sign, logabsx, exponent, mantissa, infmantissa,
   powermin, expmin, powermax,expmax, powermiddle, expmiddle;
   Digits := 100;
   x := evalf(xx);
   if (x=0) then sign, exponent, mantissa := 1, -1022, 0
   else
     if (x < 0) then sign := -1
     else sign := 1
     fi:
     x := abs(x);
     if x >=  2^(1023)*(2-2^(-53)) then mantissa := infinity; exponent := 1023
     else if x <= 2^(-1075) then mantissa := 0; exponent := -1022
         else
            if x <= 2^(-1022) then exponent := -1022
            else
   # x is between 2^(-1022) and 2^(1024)
            powermin := 2^(-1022); expmin := -1022;
            powermax := 2^1024; expmax := 1024;
            while (expmax-expmin > 1) do
               expmiddle := round((expmax+expmin)/2);
               powermiddle := 2^expmiddle;
               if x >= powermiddle then
                   powermin := powermiddle;
                   expmin := expmiddle
               else
                   powermax := powermiddle;
                   expmax := expmiddle
               fi
             od;
   # now, expmax - expmin = 1
   # and powermin <= x < powermax
   # powermin = 2^expmin
   # and powermax = 2^expmax
   # so expmin is the exponent of x
            exponent := expmin;
            fi;
            infmantissa := x*2^(52-exponent);
            if frac(infmantissa) <> 0.5 then mantissa := round(infmantissa)
               else
                  mantissa := floor(infmantissa);
                  if type(mantissa,odd) then mantissa := mantissa+1 fi
               fi;
            mantissa := mantissa*2^(-52);
fi; fi;
   fi;
   sign*mantissa*2^exponent;
   end:

ulp_in_binary_32 := proc(t)
    local x, res, expmin, expmax, expmiddle;
    x := abs(t);
    if x < 2^(-125) then res := 2^(-149)
       else if x > (1-2^(-24))*2^(128) then res := 2^104
       else
         expmin := -125; expmax := 128;
    # x is between 2^expmin and 2^expmax
         while (expmax-expmin > 1) do
           expmiddle := round((expmax+expmin)/2);
           if x >= 2^expmiddle then
                 expmin := expmiddle
           else  expmax := expmiddle
           fi;
          od;
    # now, expmax - expmin = 1
    # and 2^expmin <= x < 2^expmax
           res := 2^(expmin-23)
   fi;
   fi; res;
   end:

ulp_in_binary_64 := proc(t)
    local x, res, expmin, expmax, expmiddle;
    x := abs(t);
    if x < 2^(-1021) then res := 2^(-1074)
       else if x > (1-2^(-53))*2^(1024) then res := 2^971
       else
         expmin := -1021; expmax := 1024;
    # x is between 2^expmin and 2^expmax
         while (expmax-expmin > 1) do
           expmiddle := round((expmax+expmin)/2);
           if x >= 2^expmiddle then
                 expmin := expmiddle
           else  expmax := expmiddle
           fi;
          od;
    # now, expmax - expmin = 1
    # and 2^expmin <= x < 2^expmax
           res := 2^(expmin-52)
   fi;
   fi:
   res;
   end:
