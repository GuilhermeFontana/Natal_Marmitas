unit UntPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.CheckLst, Vcl.ExtCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TS_Inicial: TTabSheet;
    TabSheet1: TTabSheet;
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CheckListBox1: TCheckListBox;
    Memo1: TMemo;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    ListBox1: TListBox;
    LabeledEdit4: TLabeledEdit;
    Button4: TButton;
    ComboBox1: TComboBox;
    Memo2: TMemo;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Button5: TButton;
    Button6: TButton;
    Label1: TLabel;
    Timer1: TTimer;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure TS_InicialShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure Button4Click(Sender: TObject);

    //meus procedimentos
    procedure CarneX (var Int: Integer; var Carnes,CarneX: String);
    procedure Atualiza_Grid ();
    procedure Atualiza_List ();
    procedure Ordena_Vet (x: integer);
    procedure Opcoes_Restantes ();
    procedure Verifica_Opcoes();
    procedure Limpar();
    procedure Atrasado();

    //minhas fun��es
    function Carnes_OPS(Ops: Boolean): Integer;
    function Resgata_Code (Nom: string): Integer;

    //
    procedure ListBox1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure CheckListBox1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type
    Op��es_Comida = record

      Arroz: Integer;
      Feij�o: Integer;
      Macar�o: Integer;
      Salada: Integer;
      Acompanhamento: Integer;
      Carne1: Integer;
      Carne2: Integer;
      Carne3: Integer;
      Farofa: Integer;
      Refri: Integer;

    end;

  type
    PF = record

     Arroz: Boolean;
     Feij�o: Boolean;
     Macar�o: Boolean;
     Salada: Boolean;
     Acompanhamento: Boolean;
     Carne1: Boolean;
     Carne1_N: string[200];
     Carne2: Boolean;
     Carne2_N: string[200];
     Farofa: Boolean;
     Refri: Boolean;

     Nome: string[200];
     Endereco: string[200];
     Troco: Real;
     Horario: Integer;
     Codigo: Integer;

     Entrega: Boolean;

    end;

var
  Form1: TForm1;

  Total, Pedidos: Integer;
  Carne1,Carne2,Carne3: String;
  Hora: TDateTime;

  Ped_F: array [0..99999] of PF;

  Op��es_Restantes: Op��es_Comida;

  Ordem: array [0..99999] of Integer;

implementation

{$R *.dfm}

procedure TForm1.Atrasado;
var
  i: Integer;
  s: Integer;
begin
  if Pedidos > 0 then
    begin

      for i := 0 to Pedidos do
      begin

        if StrToDateTime(ComboBox1.Items[Ped_F[i].Horario]) < Hora then
        begin

          for s := 0 to ListBox1.Items.Count - 1 do
          begin

            if ListBox1.Items[s] = Ped_F[i].Nome then
            begin

              ListBox1.Items[s]:= ListBox1.Items[s] + ' -ATRASADO-';


            end;

          end;

        end;

      end;

    end;

end;

procedure TForm1.Atualiza_Grid;
begin
  StringGrid1.Cells[0,0]:= 'Arroz';
  StringGrid1.Cells[1,0]:= IntToStr(Op��es_Restantes.Arroz);

  StringGrid1.Cells[0,1]:= 'Feij�o';
  StringGrid1.Cells[1,1]:= IntToStr(Op��es_Restantes.Feij�o);

  StringGrid1.Cells[0,2]:= 'Macarr�o';
  StringGrid1.Cells[1,2]:= IntToStr(Op��es_Restantes.Macar�o);

  StringGrid1.Cells[0,3]:= 'Salada';
  StringGrid1.Cells[1,3]:= IntToStr(Op��es_Restantes.Salada);

  StringGrid1.Cells[0,4]:= 'Acompanhamento';
  StringGrid1.Cells[1,4]:= IntToStr(Op��es_Restantes.Acompanhamento);

  StringGrid1.Cells[0,5]:= Carne1;
  StringGrid1.Cells[1,5]:= IntToStr(Op��es_Restantes.Carne1);

  StringGrid1.Cells[0,6]:= Carne2;
  StringGrid1.Cells[1,6]:= IntToStr(Op��es_Restantes.Carne2);

  StringGrid1.Cells[0,7]:= Carne3;
  StringGrid1.Cells[1,7]:= IntToStr(Op��es_Restantes.Carne3);

  StringGrid1.Cells[0,8]:= 'Farofa';
  StringGrid1.Cells[1,8]:= IntToStr(Op��es_Restantes.Farofa);

  StringGrid1.Cells[0,9]:= 'Refrigerante';
  StringGrid1.Cells[1,9]:= IntToStr(Op��es_Restantes.Refri);
end;

procedure TForm1.Atualiza_List;
var
  i: Integer;
begin
  Ordena_Vet(Pedidos-1);

  ListBox1.Clear;

  for i := 0 to Pedidos-1 do
  begin

    if Ped_F[i].Entrega = False then
    begin

      ListBox1.Items.Add((Ped_F[Ordem[i]].Nome));

    end;

  end;

  Atrasado();
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Panel1.Visible:= False;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  I, X: Integer;
  Carne: String;
  Y: Real;
begin
  Total:= StrToInt((InputBox('INFORME O N�MERO DE PRATOS (COMPLETOS) DO DIA','N�','1')));

  Y:= (Total *0.6666666666666667);
  if (Y - Trunc(Y) > 0) then
  begin

    Y:= Trunc(Y)+1;

  end;


  Op��es_Restantes.Arroz:= (Total);
  Op��es_Restantes.Feij�o:= (Total);
  Op��es_Restantes.Macar�o:= (Total);
  Op��es_Restantes.Salada:= (Total);
  Op��es_Restantes.Acompanhamento:= (Total);
  Op��es_Restantes.Carne1:= Trunc(Y);
  Op��es_Restantes.Carne2:= Trunc(Y);
  Op��es_Restantes.Carne3:= Trunc(Y);
  Op��es_Restantes.Farofa:= (Total);
  Op��es_Restantes.Refri:= (Total);

  Carne:= InputBox('INFORME AS 3 OP��ES DE CARNE','CARNES','separadas por virgula ","');

  X:=1;
  Carne1:= '';
  Carne2:= '';
  Carne3:= '';
  CarneX(X,Carne,Carne1);
  CarneX(X,Carne,Carne2);
  CarneX(X,Carne,Carne3);

  Atualiza_Grid();

  Button3.Enabled:= True;
  Button6.Enabled:= True;
  Button1.Enabled:= False;
  Button7.Visible:= True;
  Panel1.Visible:= False;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i: Integer;
  Ops: Boolean;
  OpsNum: Integer;

begin
  if Pedidos < Total then
  begin

    if not(LabeledEdit4.Text = '') and not(ComboBox1.ItemIndex = -1)
   and not(LabeledEdit2.Text = '') and not (LabeledEdit1.Text = '') then
    begin

    //COMUNS
      if CheckListBox1.Checked[0] = True then
      begin

        Ped_F[Pedidos].Arroz:= True;

        Dec(Op��es_Restantes.Arroz);

      end;

      if CheckListBox1.Checked[1] = True then
      begin

        Ped_F[Pedidos].Feij�o:= True;

        Dec(Op��es_Restantes.Feij�o);

      end;

      if CheckListBox1.Checked[2] = True then
      begin

        Ped_F[Pedidos].Macar�o:= True;

        Dec(Op��es_Restantes.Macar�o);

      end;

      if CheckListBox1.Checked[3] = True then
      begin

        Ped_F[Pedidos].Salada:= True;

        Dec(Op��es_Restantes.Salada);

      end;

      if CheckListBox1.Checked[4] = True then
      begin

        Ped_F[Pedidos].Acompanhamento:= True;

        Dec(Op��es_Restantes.Acompanhamento);

      end;

      if CheckListBox1.Checked[8] = True then
      begin

        Ped_F[Pedidos].Farofa:= True;

        Dec(Op��es_Restantes.Farofa);

      end;

      if CheckListBox1.Checked[9] = True then
      begin

        Ped_F[Pedidos].Refri:= True;

        Dec(Op��es_Restantes.Refri);

      end;


      //CARNES
      OPs:= False;
      OpsNum:= Carnes_OPS(Ops);

      if not(OpsNum = -1) then
      begin

        Ped_F[Pedidos].Carne1:= True;
        Ped_F[Pedidos].Carne1_N:= CheckListBox1.Items[OpsNum];

        Ops:= True

      end;


      OpsNum:= Carnes_OPS(Ops);

      if not(OpsNum = -1) then
      begin

        Ped_F[Pedidos].Carne2:= True;
        Ped_F[Pedidos].Carne2_N:= CheckListBox1.Items[OpsNum];

      end;


      //INFORMA��ES DO CLIENTE
      Ped_F[Pedidos].Nome:= LabeledEdit4.Text;
      Ped_F[Pedidos].Endereco:= LabeledEdit1.Text;
      Ped_F[Pedidos].Troco:= StrToFloat(LabeledEdit2.Text);
      Ped_F[Pedidos].Horario:= ComboBox1.ItemIndex;
      Ped_F[Pedidos].Codigo:= Pedidos;
      Ordem[Pedidos]:= Pedidos;
      Ped_F[Pedidos].Entrega:= False;

      Memo1.Lines[1]:= LabeledEdit4.Text;
      Memo1.Lines[4]:= LabeledEdit1.Text;
      Memo1.Lines[8]:= LabeledEdit2.Text;
      Memo1.Lines[11]:= ComboBox1.Items[ComboBox1.ItemIndex];

      Inc(Pedidos);

    end
      else
    begin

      ShowMessage('pedido n�o concluido, verifique se o nome do cliente, hor�rio de entrega e troco est�o preenchidos');

    end;

  end
    else
      ShowMessage('N�O � MAIS POSSIVEL REALIZAR NOVOS PEDIDOS');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if Total > Pedidos then
  begin

    TabSheet1.Show;
    Opcoes_Restantes();

  end
    else
      ShowMessage('N�O � MAIS POSSIVEL REALIZAR NOVOS PEDIDOS');

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Limpar();

  TS_Inicial.Show;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Limpar();
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Panel1.Visible:= True;

  Memo2.Clear;
  Memo2.Lines.Add('Total de Pedidos: '+IntToStr(Pedidos));
  Memo2.Lines.Add('');
  Memo2.Lines.Add('Sobras:');

  if Op��es_Restantes.Arroz > 0 then
  begin
    Memo2.Lines.Add('Arroz: ' + IntToStr(Op��es_Restantes.Arroz));
  end;
  if Op��es_Restantes.Feij�o > 0 then
  begin
    Memo2.Lines.Add('Feij�o: ' + IntToStr(Op��es_Restantes.Feij�o));
  end;
  if Op��es_Restantes.Macar�o> 0 then
  begin
    Memo2.Lines.Add('Macar�o: ' + IntToStr(Op��es_Restantes.Macar�o));
  end;
  if Op��es_Restantes.Acompanhamento> 0 then
  begin
    Memo2.Lines.Add('Acompanhamento: ' + IntToStr(Op��es_Restantes.Acompanhamento));
  end;
  if Op��es_Restantes.Carne1> 0 then
  begin
    Memo2.Lines.Add(Carne1 + ': ' + IntToStr(Op��es_Restantes.Carne1));
  end;
  if Op��es_Restantes.Carne2> 0 then
  begin
    Memo2.Lines.Add(Carne2 + ': ' + IntToStr(Op��es_Restantes.Carne2));
  end;
  if Op��es_Restantes.Carne3> 0 then
  begin
    Memo2.Lines.Add(Carne3 + ': ' + IntToStr(Op��es_Restantes.Carne3));
  end;
  if Op��es_Restantes.Farofa> 0 then
  begin
    Memo2.Lines.Add('Farofa: ' + IntToStr(Op��es_Restantes.Farofa));
  end;
  if Op��es_Restantes.Refri> 0 then
  begin
    Memo2.Lines.Add('Refri: ' + IntToStr(Op��es_Restantes.Refri));
  end;

  Button3.Enabled:= False;
  Button6.Enabled:= False;
  Button1.Enabled:= True;
  Button7.Visible:= False

end;

procedure TForm1.Button7Click(Sender: TObject);
begin

  Ped_F[Resgata_Code(ListBox1.Items[ListBox1.ItemIndex])].Entrega:= True;

  Panel1.Visible:= False;
  Atualiza_List();
end;

function TForm1.Carnes_OPS(Ops: Boolean): Integer;
var
  Aux: string;

begin

  if Ops = False then   //CARNE 1
  begin

    if CheckListBox1.Checked[5] = True then
    begin

      Result:= 5;

      Dec(Op��es_Restantes.Carne1);

    end
      else
    begin

      if CheckListBox1.Checked[6] = True then
      begin

        Result:= 6;

        Dec(Op��es_Restantes.Carne2);

      end
        else
      begin

        if CheckListBox1.Checked[7] = True then
        begin

          Result:= 7;

          Dec(Op��es_Restantes.Carne3);

        end
          else
        begin

          Result:= -1;

        end;

      end;

    end;

  end
    else    //CARNE 2
  begin

    Aux:= Ped_F[Pedidos].Carne1_N;  //nome da op��o de carne 1 para confer�ncia

    if ((CheckListBox1.Checked[6] = True) and not(CheckListBox1.Items[6] = Aux)) then
    begin

      Result:= 6;

      Dec(Op��es_Restantes.Carne2);

    end
      else
    begin

      if ((CheckListBox1.Checked[7] = True) and not(CheckListBox1.Items[7] = Aux)) then
      begin

        Result:= 7;

        Dec(Op��es_Restantes.Carne3);

      end
        else
      begin

        Result:= -1;

      end;

    end;

  end;

end;

procedure TForm1.CarneX(var Int: Integer; var Carnes,CarneX: String);
var
  i: Integer;
begin
  for i := Int to Length(Carnes) do
  begin

    if (Carnes[i] = ',') then
    begin

      Int:= i+1;

      exit;
    end;

    CarneX:= CarneX+Carnes[I];
  end;
end;


procedure TForm1.CheckListBox1Click(Sender: TObject);
var
  Aux: Integer;

begin
  Aux:= 0;

  if CheckListBox1.Checked[5] = True then
  begin
    if Aux < 2 then
      Inc(Aux)
    else
      begin

        CheckListBox1.Checked[5]:= False;
        ShowMessage('voc� s� pode selecoinar duas op��es de carne por pedido');

      end;

  end;

  if CheckListBox1.Checked[6] = True then
  begin
    if Aux < 2 then
      Inc(Aux)
    else
      begin

        CheckListBox1.Checked[6]:= False;
        ShowMessage('voc� s� pode selecoinar duas op��es de carne por pedido');

      end;

  end;

  if CheckListBox1.Checked[7] = True then
  begin
    if Aux < 2 then
      Inc(Aux)
    else
      begin

        CheckListBox1.Checked[7]:= False;
        ShowMessage('voc� s� pode selecoinar duas op��es de carne por pedido');

      end;

  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Carne1:= 'Carne1';
  Carne2:= 'Carne2';
  Carne3:= 'Carne3';

  StringGrid1.ColWidths[0]:= 200;
  StringGrid1.ColWidths[1]:= 50;

  Button3.Enabled:= False;
  Button6.Enabled:= False;
end;

procedure TForm1.Limpar;
var
  i: Integer;
begin
  LabeledEdit1.Clear;
  LabeledEdit2.Clear;
  LabeledEdit4.Clear;
  ComboBox1.Text:= 'Hor�rio';
  ComboBox1.ItemIndex:= -1;

  Memo1.Lines[1]:= '';
  Memo1.Lines[4]:= '';
  Memo1.Lines[8]:= '';
  Memo1.Lines[11]:= '';

  for i := 0 to 6 do
    CheckListBox1.Checked[i]:= True;

  CheckListBox1.Checked[7]:= False;
  CheckListBox1.Checked[8]:= True;
  CheckListBox1.Checked[9]:= True;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
var
  Aux: Integer;

begin
  Panel1.Visible:= True;
  Aux:= Resgata_Code(ListBox1.Items[ListBox1.ItemIndex]);

  //PASSANDO INFORMA��ES P/ MEMO
  Memo2.Clear;

  Memo2.Lines.Add(Ped_F[Aux].Nome);
  Memo2.Lines.Add(IntToStr(Ped_F[Aux].Codigo));
  Memo2.Lines.Add(Ped_F[Aux].Endereco);
  Memo2.Lines.Add('R$ ' + FloatToStr(Ped_F[Aux].Troco) + ' - ' + ComboBox1.Items[Ped_F[Aux].Horario]);

  Memo2.Lines.Add('');
  Memo2.Lines.Add('Pedido:');

  if Ped_F[Aux].Arroz = True then
  begin
    Memo2.Lines.Add('Arroz');
  end;
  if Ped_F[Aux].Feij�o= True then
  begin
    Memo2.Lines.Add('Feij�o');
  end;
  if Ped_F[Aux].Macar�o= True then
  begin
    Memo2.Lines.Add('Macar�o');
  end;
  if Ped_F[Aux].Salada= True then
  begin
    Memo2.Lines.Add('Salada');
  end;
  if Ped_F[Aux].Acompanhamento= True then
  begin
    Memo2.Lines.Add('Acompanhamento');
  end;
  if Ped_F[Aux].Carne1= True then
  begin
    Memo2.Lines.Add(Ped_F[Aux].Carne1_N);
  end;
  if Ped_F[Aux].Carne2= True then
  begin
    Memo2.Lines.Add(Ped_F[Aux].Carne2_N);
  end;
  if Ped_F[Aux].Farofa= True then
  begin
    Memo2.Lines.Add('Farofa');
  end;
  if Ped_F[Aux].Refri= True then
  begin
    Memo2.Lines.Add('Refri');
  end;

end;

procedure TForm1.Opcoes_Restantes;
begin

  if not(Op��es_Restantes.Carne1 > 0) then
  begin

    CheckListBox1.ItemEnabled[0]:= False

  end;

end;

procedure TForm1.Ordena_Vet(x: integer);
var
  i: Integer;
  s: Integer;
  Aux: Integer;

begin
  for i := 0 to x do
  begin

    for s := i to x do
    begin

      if Ped_F[i].Horario > Ped_F[s].Horario then
      begin

        Aux:= Ordem[i];
        Ordem[i]:= Ordem[s];
        Ordem[s]:= Aux

      end;

    end;

  end;
end;

function TForm1.Resgata_Code(Nom: string): Integer;
var
  i: Integer;
  Aux: Integer;
  x: Integer;
  AuxTxt: string;
  Atraso: Boolean;
begin
  Atraso:= False;

  for i := 1 to Length(Nom) do
  begin

    if Nom[i] = '-' then
    begin

      Atraso:= True

    end;

  end;

//------------------------------------------------------------


  if Atraso = True then
  begin

    for i := 0 to Pedidos-1 do
    begin

      AuxTxt:= '';
      x:= 1;
      repeat

        AuxTxt:= AuxTxt + Nom[x];

        x:= x+1

      until Nom[x+1] = '-'  ;

      if AuxTxt = Ped_F[i].Nome then
      begin

        Aux:= Ped_F[i].Codigo

      end;


    end;

  end
    else
  begin

    for i := 0 to Pedidos-1 do
    begin

      if Nom = Ped_F[i].Nome then
      begin

        Aux:= Ped_F[i].Codigo

      end;


    end;

  end;

  Result:= Aux
end;

procedure TForm1.TabSheet1Show(Sender: TObject);
var
  i: Integer;
begin
  CheckListBox1.Items[5]:= Carne1;
  CheckListBox1.Items[6]:= Carne2;
  CheckListBox1.Items[7]:= Carne3;

  Limpar();

  Verifica_Opcoes();

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Hora:= (Time);
  Label1.Caption:= TimeToStr(Hora);        //REL�GIO

end;

procedure TForm1.TS_InicialShow(Sender: TObject);
begin
  Atualiza_Grid();
  Atualiza_List();
end;

procedure TForm1.Verifica_Opcoes;
begin
  if Op��es_Restantes.Arroz< 1 then
  begin

    CheckListBox1.ItemEnabled[0]:= False;
    CheckListBox1.Checked[0]:= False;

  end
    else
     CheckListBox1.ItemEnabled[0]:= True;

  if Op��es_Restantes.Feij�o< 1 then
  begin

    CheckListBox1.ItemEnabled[1]:= False;
    CheckListBox1.Checked[1]:= False;

  end
   else
     CheckListBox1.ItemEnabled[1]:= True;

  if Op��es_Restantes.Macar�o < 1 then
  begin

    CheckListBox1.ItemEnabled[2]:= False;
    CheckListBox1.Checked[2]:= False;

  end
    else
     CheckListBox1.ItemEnabled[2]:= True;

  if Op��es_Restantes.Salada < 1 then
  begin

    CheckListBox1.ItemEnabled[3]:= False;
    CheckListBox1.Checked[3]:= False;

  end
    else
     CheckListBox1.ItemEnabled[3]:= True;

  if Op��es_Restantes.Acompanhamento < 1 then
  begin

    CheckListBox1.ItemEnabled[4]:= False;
    CheckListBox1.Checked[4]:= False;

  end
    else
     CheckListBox1.ItemEnabled[4]:= True;

  if Op��es_Restantes.Carne1 < 1 then
  begin

    CheckListBox1.ItemEnabled[5]:= False;
    CheckListBox1.Checked[5]:= False;

  end
    else
     CheckListBox1.ItemEnabled[5]:= True;

  if Op��es_Restantes.Carne2 < 1 then
  begin

    CheckListBox1.ItemEnabled[6]:= False;
    CheckListBox1.Checked[6]:= False;

  end
   else
     CheckListBox1.ItemEnabled[6]:= True;

  if Op��es_Restantes.Carne3 < 1 then
  begin

    CheckListBox1.ItemEnabled[7]:= False;
    CheckListBox1.Checked[7]:= False;

  end
    else
     CheckListBox1.ItemEnabled[7]:= True;

  if Op��es_Restantes.Farofa < 1 then
  begin

    CheckListBox1.ItemEnabled[8]:= False;
    CheckListBox1.Checked[8]:= False;

  end
    else
     CheckListBox1.ItemEnabled[8]:= True;

  if Op��es_Restantes.Refri < 1 then
  begin

    CheckListBox1.ItemEnabled[9]:= False;
    CheckListBox1.Checked[9]:= False;

  end
    else
     CheckListBox1.ItemEnabled[9]:= True;

end;

initialization
Pedidos:= 0;


end.
