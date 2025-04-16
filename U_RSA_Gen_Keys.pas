unit U_RSA_Gen_Keys;

interface

function Get_Keys : string;


implementation
uses
   Velthuis.BigIntegers,
   Velthuis.BigIntegers.Primes,
   System.Diagnostics,
   System.SysUtils,
   U_BigInt_Calc;

const
   prec = 100;
   crlf = #13#10;
   bits = 1024;

var
   i : integer;
   t : TStopwatch;
   p,   n,
   p1,  p2,  x,
   phi, pub, prv : Biginteger;

function Get_Keys : string;
begin
//   t   := TStopwatch.Create;
   t.Start;
   p1  := RandomProbablePrime(bits,prec);                    //20
   p2  := RandomProbablePrime(bits,prec);                    //30

   n   := p1 * p2;
   phi := (p1-1) * (p2 -1);

   repeat
      pub := RandomProbablePrime(bits,prec);                 //30
   until ( gcd_BigInt(pub, phi) = 1);

   result := 'phi ' + crlf + phi.ToString + crlf +
             'pub ' + crlf + pub.ToString + crlf;

// prv := power_mod(pub, phi-2, phi);
   prv := mod_inverse(pub, phi);

   result := result +
             'prv ' + crlf + prv.ToString + crlf;

   x := prv * pub;

   result := result +
             'inverse? ' + crlf + mod_BigInt( x, phi ).ToString + crlf;
   result := result + t.Elapsed.Milliseconds.ToString + ' ms';
end;

end.


