unit U_RSA_Fns;

interface
uses System.Classes;

function  Load_Input    : string;
function  Generate_Keys : string;
function  Encrypt       : string;
function  Decrypt       : string;
function  Get_Decrypted : TBytesStream;


implementation
 uses
   System.IOUtils, System.SysUtils, U_RSA_Gen_Keys;


 const path       = 'D:\Users\Perseus\Documents\Embarcadero\Studio\Projects\_FM2GP\';
 const input_file = 'What is APL.jpg';

 var   ByteArray: TBytes;

 function Load_Input : string;
   begin
    var bs        := TBytesStream.Create;
        bs.LoadFromFile(path+input_file);
        ByteArray := bs.Bytes;
        result    := 'File "'+input_file+'" loaded. Size: '+bs.size.ToString+' bytes';
   end;

 function Generate_Keys : string;
   begin
        result := Get_Keys;
   end;

 function Encrypt : string;
   begin

   end;

 function Decrypt : string;
   begin

   end;

 function Get_Decrypted : TBytesStream;
   begin


   end;

end.
