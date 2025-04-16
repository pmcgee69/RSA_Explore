unit U_BigInt_Calc;

interface
uses Velthuis.BigIntegers;

function power_mod          (a,n,p : BigInteger) : BigInteger;
function mod_BigInt         (a,p   : BigInteger) : BigInteger;
function gcd_BigInt (const a,b     : BigInteger) : BigInteger;
function mod_inverse(const pub, phi: BigInteger) : BigInteger;


implementation


function gcd_BigInt(const a,b : BigInteger) : BigInteger;
var
    x,y,quot,rem : BigInteger;
begin
    if a > b  then begin  x := a;  y := b;  end
              else begin  x := b;  y := a;  end;
    repeat
       BigInteger.DivMod(x,y,quot,rem);
       x := y;
       y := rem;
    until (rem = 0);

    result := x;
end;


function mod_BigInt(a,p : BigInteger) : BigInteger;      // a mod p
var x, k : BigInteger;
begin
    if a>=p  then begin
                  x := a;
                  BigInteger.DivMod(x,p,k,a);
             end;
    exit(a);
end;


function power_mod(a,n,p : BigInteger) : BigInteger;     // a^n mod p
begin
    if n=0 then exit(1);
    if n=1 then exit(a);

    while n.IsEven do
    begin
       n := BigInteger.Divide(n,2);
       a := a*a;
    end;
    a := mod_BigInt(a,p);              //writeln(n.tostring, '  -  ', a.ToString);
    a := a * power_mod(a, n-1, p);
    a := mod_BigInt(a,p);              //writeln(a.ToString);
    exit(a);
end;


function mod_inverse(const pub, phi: BigInteger): BigInteger;
var
  a, b, quot, rem, temp, x₀, x₁ : BigInteger;
begin
  // Extended Euclidean Algorithm to find modular inverse
  a  := pub;
  b  := phi;
  x₀ := 1;
  x₁ := 0;

  while b > 0 do
  begin
      BigInteger.DivMod(a,b,quot,rem);    // quot := a div b;   //b rem := a mod b;
      a    := b;
      b    := rem;

      temp := x₁;
      x₁   := x₀ - quot * x₁;
      x₀   := temp;
  end;

  if x₀ < 0 then x₀ := x₀ + phi;          // result > 0

  result := x₀;
end;

end.
