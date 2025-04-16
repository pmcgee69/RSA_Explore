unit U_RSA_App;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, U_RSA;

type
  TForm1 = class(TForm)
    Label1  : TLabel;
    Label2  : TLabel;
    Image1  : TImage;
    Image2  : TImage;
    Button1 : TButton;
    Button2 : TButton;
    Memo1   : TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
    Memo1.Lines.Add( Load_Input );     // load the file input_file into a byte array
    Memo1.Lines.Add('Generate Keys');
    Memo1.Lines.Add( Generate_Keys );
    Memo1.Lines.Add( Encrypt );
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
    Memo1.Lines.Add( Decrypt );
    Image2.Picture.LoadFromStream( Get_Decrypted );
end;

end.


