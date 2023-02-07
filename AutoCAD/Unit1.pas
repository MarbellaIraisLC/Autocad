unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Grids, StdCtrls, Menus, Math;

  type

  TFormas=record
  loc1,loc2,loc3,loc4,loc5,loc6,loc7,loc8,loc9,loc10,loc11,loc12,loc13,loc14,loc15,loc16,loc17,loc18,loc19,loc20:Integer;

  end;

type
  TForm1 = class(TForm)
    FondoVentana: TImage;
    Image1: TImage;
    Grid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    MainMenu1: TMainMenu;
    gg1: TMenuItem;
    Lineas1: TMenuItem;
    Cuadrado1: TMenuItem;
    Rectangulo1: TMenuItem;
    Circulo1: TMenuItem;
    riangulo1: TMenuItem;
    Rombo1: TMenuItem;
    Elipse1: TMenuItem;
    Horizontal1: TMenuItem;
    Vertical1: TMenuItem;
    DiagonalIzquierda1: TMenuItem;
    DiagonalDerecha1: TMenuItem;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Button5: TButton;
    Button6: TButton;
    TxtRojo: TEdit;
    Txtverde: TEdit;
    Txtazul: TEdit;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Button12: TButton;
    txtrojor: TEdit;
    txtverder: TEdit;
    txtazulr: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button13: TButton;
    Button14: TButton;
    RecRedondo1: TMenuItem;
    Archivo1: TMenuItem;
    Guardar1: TMenuItem;
    Button17: TButton;
    Button18: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Grid2: TStringGrid;
    Label8: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Button19: TButton;
    Button23: TButton;
    Abrir1: TMenuItem;
    Edit6: TEdit;
    Label11: TLabel;
    ImagenE1: TMenuItem;
    Button15: TButton;
    procedure Image1MouseEnter(Sender: TObject);
    procedure ImagenE1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Guardar1Click(Sender: TObject);
    procedure riangulo1Click(Sender: TObject);
    procedure Circulo1Click(Sender: TObject);
    procedure RecRedondo1Click(Sender: TObject);
    procedure Rectangulo1Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Cuadrado1Click(Sender: TObject);
    procedure Elipse1Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  //Variables Globales----------------------------------------------------------
  clics, operacion, renglon:Integer;
  dx, dy:Integer;
  escala, mitady, mitadx:Integer;
  xp, yp:Real;
  ccuadrado,crectangulo,ctriangulo,ccirculo,cpolilinea:Integer;
  //----------------------------------------------------------------------------
implementation

uses Unit2;

{$R *.dfm}
//Inicio DDA--------------------------------------------------------------------
procedure dda(x1,y1,x2,y2,c1,c2,c3:integer; Image1:timage);
var
 k:Integer;
 dx,dy:Integer;
 steps:Integer;
 x_mas,y_mas:real;
 x,y:real;
begin
dx:=x2-x1;
dy:=y2-y1;
if abs (dx)> abs(dy) then
begin
  steps:= abs (dx);
  end
  else
  begin
  steps:=abs (dy);
end;
x_mas:= dx/steps;
y_mas:= dy/steps;
x:= trunc(x1);
y:= trunc(y1);
for k := 1 to steps do
  begin
    x:=x+(x_mas);
    y:=y+(y_mas);
    image1.Canvas.Pixels [trunc(x),trunc(y)]:= rgb (c1,c2,c3);
  end;
end;
//Fin DDA-----------------------------------------------------------------------

//Metodo Elipse-----------------------------------------------------------------
procedure elipse(r1,r2,xc,yc,angi,angf,c1,c2,c3:Integer;Image:Timage);
var
angulo:Real;
i:Integer;
x,y:Integer;
begin
  angulo:=angi;
  for I := angi to angf*10 do
    begin
      x:=xc+trunc(r1*cos(degtorad(angulo)));
      y:=yc+trunc(r2*sin(degtorad(angulo)));
      image.Canvas.Pixels[x,y]:=rgb(c1,c2,c3);
      angulo:=angulo+0.1;
    end;
end;
//Fin Metodo Elipse-------------------------------------------------------------

//Metodo triangulo--------------------------------------------------------------
procedure triangulo (c1,c2,c3:Integer;Grid:TstringGrid;Image:Timage);
var
i:Integer;
begin
  for I := 1 to grid.RowCount - 1 do
    begin
      dda(strtoint(grid.Cells[0,i-1]),strtoint(grid.Cells[1,i-1]),
      strtoint(grid.Cells[0,i]),strtoint(grid.Cells[1,i]),c1,c2,c3,image);
    end;
    dda(strtoint(grid.Cells[0,i-1]),strtoint(grid.Cells[1,i-1]),
    strtoint(grid.Cells[0,0]),strtoint(grid.Cells[1,0]),c1,c2,c3,image);
end;
//Fin Metodo triangulo----------------------------------------------------------

//Metodo Cuadrado---------------------------------------------------------------
procedure cuadrado (c1,c2,c3,c4:Integer;Grid:TstringGrid;Image:Timage);
var
i:Integer;
begin
  for I := 1 to grid.RowCount - 1 do
  begin

  end;


end;
//image1.Canvas.Rectangle(x-10,y-10,x+110,y+110);
//Fin Metodo Cuadrado-----------------------------------------------------------


//Aunmentar y disminuir celdas Grid---------------------------------------------
procedure TForm1.Button1Click(Sender: TObject);
begin
grid1.RowCount:=grid1.RowCount+1;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
grid1.RowCount:=grid1.RowCount-1;
end;
//Fin---------------------------------------------------------------------------

//Plano cartesiano--------------------------------------------------------------
procedure TForm1.Button20Click(Sender: TObject);
var
i,j:Integer;
begin
for I := 0 to 700 do
begin
  image1.Canvas.Pixels[i,250]:=rgb(0,0,0);
end;
for I := 0 to 600 do
  begin
    image1.Canvas.Pixels[350,i]:=rgb(0,0,0);
  end;
end;
//Fin Plano Cartesiano----------------------------------------------------------

//Cuadricula--------------------------------------------------------------------
procedure TForm1.Button21Click(Sender: TObject);
var
i,j:Integer;
begin
for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[360,i]:=rgb(178,178,178);
  end;
for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[370,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[380,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[390,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[400,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[410,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[420,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[430,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[440,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[450,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[460,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[470,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[480,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[490,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[500,i]:=rgb(178,178,178);
  end;
   for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[510,i]:=rgb(178,178,178);
  end;
   for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[520,i]:=rgb(178,178,178);
  end;
   for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[530,i]:=rgb(178,178,178);
  end;
   for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[540,i]:=rgb(178,178,178);
  end;
   for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[550,i]:=rgb(178,178,178);
  end;
   for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[560,i]:=rgb(178,178,178);
  end;
   for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[570,i]:=rgb(178,178,178);
  end;
   for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[580,i]:=rgb(178,178,178);
  end;
   for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[590,i]:=rgb(178,178,178);
  end;
   for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[600,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[610,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[620,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[630,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[640,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[650,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[660,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[670,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[680,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[690,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[340,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[330,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[320,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[310,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[300,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[290,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[280,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[270,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[260,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[250,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[240,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[230,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[220,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[210,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[200,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[190,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[180,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[170,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[160,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[150,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[140,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[130,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[120,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[110,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[100,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[90,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[80,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[70,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[60,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[50,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[40,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[30,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[20,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[10,i]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[0,i]:=rgb(178,178,178);
  end;
//------------------------------------------------------------------------------
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,240]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,230]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,220]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,210]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,200]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,190]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,180]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,170]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,160]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,150]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,140]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,130]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,120]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,110]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,100]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,90]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,80]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,70]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,60]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,50]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,40]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,30]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,20]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,10]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,0]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,260]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,270]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,280]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,290]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,300]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,310]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,320]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,330]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,340]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,350]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,360]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,370]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,380]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,390]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,400]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,410]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,420]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,430]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,440]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,450]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,460]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,470]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,480]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,490]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,500]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,510]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,520]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,530]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,540]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,550]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,560]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,570]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,580]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,590]:=rgb(178,178,178);
  end;
  for I := 0 to 700 do
  begin
    image1.Canvas.Pixels[i,600]:=rgb(178,178,178);
  end;
end;
//Fin Cuadricula----------------------------------------------------------------


//Botones Movimientos-----------------------------------------------------------
procedure TForm1.Button3Click(Sender: TObject);
begin
operacion:=1;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
Ex,Ey:Real;
Escala:Real;
i:Integer;
begin
escala:=strtoint(edit1.Text);
triangulo(255,255,255,grid1,image1);
for I := 0 to grid1.RowCount - 1 do
  begin
    grid1.Cells[0,i]:=inttostr(trunc(strtoint(grid1.Cells[0,i])*Escala));
    grid1.Cells[1,i]:=inttostr(trunc(strtoint(grid1.Cells[1,i])*Escala));
  end;
  triangulo(strtoint(TxtRojo.Text),strtoint(TxtVerde.Text),strtoint(TxtAzul.Text),grid1,image1);

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 grid1.RowCount:=4;
 operacion:=2;
 clics:=0;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
operacion:=3;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
operacion:=5;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
operacion:=7;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
operacion:=8;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
operacion:=9;
end;

procedure TForm1.Button11Click(Sender: TObject);
var
i,angulo:Integer;
xo,yo,xn,yn:Real;
begin
angulo:=strtoint(edit2.Text);
for I := 0 to grid1.RowCount - 1 do
begin
  xo:=strtoint(grid1.Cells[0,i]);
  yo:=strtoint(grid1.Cells[1,i]);
  xn:=xo*cos(degtorad(angulo))-yo*sin(degtorad(angulo));
  yn:=yo*cos(degtorad(angulo))+xo*sin(degtorad(angulo));
  grid1.Cells[0,i]:=inttostr(trunc(xn));
  grid1.Cells[1,i]:=inttostr(trunc(yn));
end;
   triangulo(0,0,0,grid1,image1);

end;

procedure TForm1.Button12Click(Sender: TObject);
begin
Form2.show;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
operacion:=19;
end;

procedure TForm1.Button15Click(Sender: TObject);
var
Formas:TFormas;
F:File of TFormas;
begin
ctriangulo:=ctriangulo+1;
edit4.Text:='Triangulo';
operacion:=20;
edit5.Text:=inttostr(ctriangulo);
AssignFile(F,ExtractFilePath(Application.ExeName)+edit4.Text+edit5.Text);
Rewrite(F);
closeFile(f);

end;

procedure TForm1.Button17Click(Sender: TObject);
var
Formas:TFormas;
F:File of TFormas;
begin
ccuadrado:=ccuadrado+1;
edit4.Text:='Cuadrado';

operacion:=17;
edit5.Text:=inttostr(ccuadrado);

AssignFile(F,ExtractFilePath(Application.ExeName)+edit4.Text+edit5.Text);
Rewrite(F);
closeFile(f);
end;

procedure TForm1.Button18Click(Sender: TObject);
var
Formas:TFormas;
F:File of TFormas;
begin
crectangulo:=crectangulo+1;
edit4.Text:='Rectangulo';
operacion:=18;
edit5.Text:=inttostr(crectangulo);

AssignFile(F,ExtractFilePath(Application.ExeName)+edit4.Text+edit5.Text);
Rewrite(F);
closeFile(f);
end;
//Fin Botones Movimientos-------------------------------------------------------

//Inicio Figuras Menu-----------------------------------------------------------
procedure TForm1.Elipse1Click(Sender: TObject);
begin
operacion:=10;
end;
//Guardar proyecto img................................
procedure TForm1.Guardar1Click(Sender: TObject);
begin
image1.Picture.Bitmap.SaveToFile(ExtractFilePath(Application.ExeName)+edit6.Text+'.bmp');
end;
//Abrir proyecto img..................................
procedure TForm1.Abrir1Click(Sender: TObject);
begin
//image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+edit6.Text+'.JPG');
image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+edit6.Text+'.bmp');
end;

procedure TForm1.Cuadrado1Click(Sender: TObject);
begin
operacion:=11;
end;

procedure TForm1.Rectangulo1Click(Sender: TObject);
begin
operacion:=13;
end;

procedure TForm1.RecRedondo1Click(Sender: TObject);
begin
operacion:=14;
end;

procedure TForm1.Circulo1Click(Sender: TObject);
begin
operacion:=15;
end;

procedure TForm1.riangulo1Click(Sender: TObject);
begin
operacion:=16;
end;
//Fin Figuras Menu--------------------------------------------------------------

//Guardar y abrir archivos------------------------------------------------------
//GUARDAR.......................................................................
procedure TForm1.Button19Click(Sender: TObject);
var
Formas:TFormas;
registro:Integer;
F:File of TFormas;
i:Integer;
guardar:Integer;
begin
AssignFile(F,ExtractFilePath(Application.ExeName)+edit4.Text+edit5.Text);
reset(F);
registro:=filesize(f);
seek(f,registro);
guardar:=grid1.RowCount;
if guardar=3 then
begin
formas.loc1:=strtoint(grid1.Cells[0,0]);
formas.loc2:=strtoint(grid1.Cells[1,0]);
formas.loc3:=strtoint(grid1.Cells[0,1]);
formas.loc4:=strtoint(grid1.Cells[1,1]);
formas.loc5:=strtoint(grid1.Cells[0,2]);
formas.loc6:=strtoint(grid1.Cells[1,2]);

 end;
if guardar=4 then
begin
formas.loc1:=strtoint(grid1.Cells[0,0]);
formas.loc2:=strtoint(grid1.Cells[1,0]);
formas.loc3:=strtoint(grid1.Cells[0,1]);
formas.loc4:=strtoint(grid1.Cells[1,1]);
formas.loc5:=strtoint(grid1.Cells[0,2]);
formas.loc6:=strtoint(grid1.Cells[1,2]);
formas.loc7:=strtoint(grid1.Cells[0,3]);
formas.loc8:=strtoint(grid1.Cells[1,3]);
end;
write(F,formas);
CloseFile(F);
end;


//Abrir.........................................................................
procedure TForm1.Button23Click(Sender: TObject);
var
Formas:TFormas;
F:File of TFormas;
i:Integer;
registro:Integer;
begin
AssignFile(F,ExtractFilePath(Application.ExeName)+edit4.Text+edit5.Text);
reset(F);
registro:=0;
seek(f,registro);
blockread(f,formas,1);

grid1.Cells[0,0]:=inttostr(formas.loc1);
grid1.Cells[1,0]:=inttostr(formas.loc2);
grid1.Cells[0,1]:=inttostr(formas.loc3);
grid1.Cells[1,1]:=inttostr(formas.loc4);
grid1.Cells[0,2]:=inttostr(formas.loc5);
grid1.Cells[1,2]:=inttostr(formas.loc6);
grid1.Cells[0,3]:=inttostr(formas.loc7);
grid1.Cells[1,3]:=inttostr(formas.loc8);

CloseFile(F);
triangulo(0,0,0,grid1,image1);
end;
//Fin Guardar y abrir archivos--------------------------------------------------




//Inicio Evento MouseDown-------------------------------------------------------
procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var
  a:array [0..3] of Tpoint;
  i,j:Integer;
  xn,yn:Integer;
  angulo:Integer;
  xo,yo,xn1,yn1:Real;
  va:Integer;
begin
case operacion of
0: //Dibujar polilinea
begin
  grid1.Cells[0,clics]:=inttostr(x);
  grid1.Cells[1,clics]:=inttostr(y);
  clics:=clics+1;
  if clics=grid1.RowCount then
  begin
    triangulo(strtoint(TxtRojo.Text),strtoint(TxtVerde.Text),strtoint(TxtAzul.Text),grid1,image1);
    clics:=0
  end;
end;

1: //Mover figura
begin
  operacion:=0;
  clics:=0;
end;

2: //Dibujar PoliBezier
begin
  grid1.Cells[0,clics]:=inttostr(x);
  grid1.Cells[1,clics]:=inttostr(y);

  image1.Canvas.Ellipse(x-5,y-5,x+5,y+5);
  clics:=clics+1;
  if clics=4 then
  begin
    for I := 0 to 3 do
      begin
        a[i].X:=strtoint(grid1.Cells[0,i]);
        a[i].Y:=strtoint(grid1.Cells[1,i]);
      end;
      image1.Canvas.PolyBezier(a);
      clics:=0;
      operacion:=0;
  end;
end;

3: //Deformar PoliBezier
begin
  for I := 0 to grid1.RowCount - 1 do
  begin
    xn:=x-strtoint(grid1.Cells[0,i]);
    yn:=y-strtoint(grid1.Cells[1,i]);
    if (abs(xn)<5) and (abs(yn)<5) then
    begin
      showmessage('Dato encontrado, en el renglon:' +inttostr(i));
      renglon:=i;
      operacion:=4;
    end;
  end;

end;

4: //Soltar deformacion PoliBezier
begin
  for I := 0 to grid1.RowCount - 1 do
    begin
      image1.Canvas.Ellipse(strtoint(grid1.Cells[0,i])-5,
                            strtoint(grid1.Cells[1,i])-5,
                            strtoint(grid1.Cells[0,i])+5,
                            strtoint(grid1.Cells[1,i])+5);
    end;
    operacion:=0;
end;

5: //Deformar Polilinea
begin
  for I := 0 to grid1.RowCount - 1 do
  begin
    xn:=x-strtoint(grid1.Cells[0,i]);
    yn:=y-strtoint(grid1.Cells[1,i]);
    if (abs (xn)<5) and (abs(yn)<5) then
    begin
      showmessage('Dato encontrado, en el renglon:'+inttostr(i));
      renglon:=i;
      operacion:=6;
    end;
  end;

end;

6:
begin
  operacion:=0;
end;

7: //Reflexion en x
begin
  triangulo(255,255,255,grid1,image1);
  for I := 0 to grid1.RowCount - 1 do
    begin
      dx:=x-strtoint(grid1.Cells[0,i]);
      grid1.Cells[0,i]:=inttostr(x+dx);
    end;
    triangulo(strtoint(TxtRojo.Text),strtoint(TxtVerde.Text),strtoint(TxtAzul.Text),grid1,image1);
    operacion:=0;
end;

8: //Reflexion en y
begin
  triangulo(255,255,255,grid1,image1);
  for I := 0 to grid1.RowCount - 1 do
    begin
      dy:=y-strtoint(grid1.Cells[1,i]);
      grid1.Cells[1,i]:=inttostr(y+dy);
    end;
    triangulo(strtoint(TxtRojo.Text),strtoint(TxtVerde.Text),strtoint(TxtAzul.Text),grid1,image1);
    operacion:=0;
end;

9: //Rotar Polilinea
begin
  angulo:=strtoint(edit2.Text);
  for I := 0 to grid1.RowCount - 1 do
  begin
    xo:=strtofloat(grid1.Cells[0,i]);
    yo:=strtofloat(grid1.Cells[1,i]);

    xn1:=x+(xo-x)*cos(degtorad(angulo))-(yo-y)*sin(degtorad(angulo));
    yn1:=y+(yo-y)*cos(degtorad(angulo))+(xo-x)*sin(degtorad(angulo));
    grid1.Cells[0,i]:=inttostr(trunc(xn1));
    grid1.Cells[1,i]:=inttostr(trunc(yn1));
  end;
  triangulo(strtoint(TxtRojo.Text),strtoint(TxtVerde.Text),strtoint(TxtAzul.Text),grid1,image1);

end;

10: //Dibujar Elipse con Menu
begin
  image1.Canvas.Ellipse(x-20,y-20,x+60,y+20);
  operacion:=0;
end;

11: //Dibujar Cuadrado con Menu
 begin
  image1.Canvas.Rectangle(x-10,y-10,x+110,y+110);
  operacion:=0;
 end;

13: //Dibujar Rectangulo con Menu
 begin
  image1.Canvas.Rectangle(x-150,y-10,x+110,y+110);
  operacion:=0;
 end;

14: //Dibujar Rectangulo redondeado con Menu
 begin
  image1.Canvas.RoundRect(x-150,y-50,x+280,y+100,x-30,y-30);
  operacion:=0;
 end;

15: //Dibujar Circulo con Menu
 begin
  image1.Canvas.Ellipse(x-60,y-10,x+60,y+110);
  operacion:=0;
 end;

16: //Dibujar Triangulo con Menu
 begin
  image1.Canvas.Polygon([point(x-100,y-220), point(x+10,y+220), point(x-50,y-150)]);
  operacion:=0;
 end;

//Lets go boys-------------------------------
17: //Cuadrado
begin
  Grid1.RowCount:=4;
  grid1.Cells[0,0]:=inttostr(x);
  grid1.Cells[1,0]:=inttostr(y);
  grid1.Cells[0,1]:=inttostr(x);
  grid1.Cells[1,1]:=inttostr(y+100);
  grid1.Cells[0,2]:=inttostr(x+100);
  grid1.Cells[1,2]:=inttostr(y+100);
  grid1.Cells[0,3]:=inttostr(x+100);
  grid1.Cells[1,3]:=inttostr(y);

  va:=grid2.RowCount-1;
  grid2.Cells[0,va]:='Cuadrado';
  grid2.Cells[1,va]:=inttostr(ccuadrado);

  grid2.RowCount:=grid2.RowCount+1;
  va:=va+1;

  grid2.Cells[0,va]:=grid1.Cells[0,0];
  grid2.Cells[1,va]:=grid1.Cells[1,0];
  grid2.RowCount:=grid2.RowCount+1;
  va:=va+1;

  grid2.Cells[0,va]:=grid1.Cells[0,1];
  grid2.Cells[1,va]:=grid1.Cells[1,1];
  grid2.RowCount:=grid2.RowCount+1;
  va:=va+1;

  grid2.Cells[0,va]:=grid1.Cells[0,2];
  grid2.Cells[1,va]:=grid1.Cells[1,2];
  grid2.RowCount:=grid2.RowCount+1;
  va:=va+1;

  grid2.Cells[0,va]:=grid1.Cells[0,3];
  grid2.Cells[1,va]:=grid1.Cells[1,3];
  grid2.RowCount:=grid2.RowCount+1;

   triangulo(strtoint(TxtRojo.Text),strtoint(TxtVerde.Text),strtoint(TxtAzul.Text),grid1,image1);
  //triangulo (0,0,0,grid1,image1);
  clics:=0;
  operacion:=0;
  x:=0;
  y:=0;
end;

18: //Rectangulo
begin
 Grid1.RowCount:=4;
  grid1.Cells[0,0]:=inttostr(x);
  grid1.Cells[1,0]:=inttostr(y);
  grid1.Cells[0,1]:=inttostr(x);
  grid1.Cells[1,1]:=inttostr(y+100);
  grid1.Cells[0,2]:=inttostr(x+200);
  grid1.Cells[1,2]:=inttostr(y+100);
  grid1.Cells[0,3]:=inttostr(x+200);
  grid1.Cells[1,3]:=inttostr(y);

  va:=grid2.RowCount-1;
  grid2.Cells[0,va]:='Rectengulo';
  grid2.Cells[1,va]:=inttostr(crectangulo);

  grid2.RowCount:=grid2.RowCount+1;
  va:=va+1;

  grid2.Cells[0,va]:=grid1.Cells[0,0];
  grid2.Cells[1,va]:=grid1.Cells[1,0];
  grid2.RowCount:=grid2.RowCount+1;
  va:=va+1;

  grid2.Cells[0,va]:=grid1.Cells[0,1];
  grid2.Cells[1,va]:=grid1.Cells[1,1];
  grid2.RowCount:=grid2.RowCount+1;
  va:=va+1;

  grid2.Cells[0,va]:=grid1.Cells[0,2];
  grid2.Cells[1,va]:=grid1.Cells[1,2];
  grid2.RowCount:=grid2.RowCount+1;
  va:=va+1;

  grid2.Cells[0,va]:=grid1.Cells[0,3];
  grid2.Cells[1,va]:=grid1.Cells[1,3];
  grid2.RowCount:=grid2.RowCount+1;

   triangulo(strtoint(TxtRojo.Text),strtoint(TxtVerde.Text),strtoint(TxtAzul.Text),grid1,image1);
  //triangulo(0,0,0,grid1,image1);
  clics:=0;
  operacion:=0;
  x:=0;
  y:=0;
end;

19: //Color
begin
  image1.Canvas.Brush.Color:=rgb(strtoint(txtrojor.Text),strtoint(txtverder.Text),strtoint(txtazulr.Text));
  image1.Canvas.FloodFill(x,y,rgb(strtoint(txtrojo.Text),strtoint(txtverde.Text),strtoint(txtazul.Text)),fsborder);
  operacion:=0;
end;

20: //Triangulo
begin
  grid1.RowCount:=3;
  grid1.Cells[0,0]:=inttostr(x);
  grid1.Cells[1,0]:=inttostr(y);
  grid1.Cells[0,1]:=inttostr(x-100);
  grid1.Cells[1,1]:=inttostr(y+100);
  grid1.Cells[0,2]:=inttostr(x+100);
  grid1.Cells[1,2]:=inttostr(y+100);

  va:=grid2.RowCount-1;
  grid2.Cells[0,va]:='Triangulo';
  grid2.Cells[1,va]:=inttostr(ctriangulo);

  grid2.RowCount:=grid2.RowCount+1;
  va:=va+1;
  
  grid2.Cells[0,va]:=grid1.Cells[0,0];
  grid2.Cells[1,va]:=grid1.Cells[1,0];
  grid2.RowCount:=grid2.RowCount+1;
  va:=va+1;

  grid2.Cells[0,va]:=grid1.Cells[0,1];
  grid2.Cells[1,va]:=grid1.Cells[1,1];
  grid2.RowCount:=grid2.RowCount+1;
  va:=va+1;

  grid2.Cells[0,va]:=grid1.Cells[0,2];
  grid2.Cells[1,va]:=grid1.Cells[1,2];
  grid2.RowCount:=grid2.RowCount+1;
  va:=va+1;


   triangulo(strtoint(TxtRojo.Text),strtoint(TxtVerde.Text),strtoint(TxtAzul.Text),grid1,image1);
  //triangulo(0,0,0,grid1,image1);
  clics:=0;
  operacion:=0;
  x:=0;
  y:=0;
end;





end;

end;
procedure TForm1.Image1MouseEnter(Sender: TObject);
begin

end;

//Fin Evento MouseDown----------------------------------------------------------

//Inicio Evento MouseMove-------------------------------------------------------
procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var
  j:Integer;
  tx,ty,i:Integer;
  a:array[0..3] of Tpoint;
begin
case operacion of
1:
begin
  triangulo(255,255,255,grid1,image1);
  Tx:=x-strtoint(grid1.Cells[0,0]);
  Ty:=y-strtoint(grid1.Cells[1,0]);
  for I := 0 to grid1.RowCount - 1 do
    begin
      grid1.Cells[0,i]:=inttostr(strtoint(grid1.Cells[0,i])+tx);
      grid1.Cells[1,i]:=inttostr(strtoint(grid1.Cells[1,i])+ty);
    end;
    triangulo(strtoint(TxtRojo.Text),strtoint(TxtVerde.Text),strtoint(TxtAzul.Text),grid1,image1);
end;

4:
begin
  for I := 0 to 3 do
    begin
      a[i].X:=strtoint(grid1.Cells[0,i]);
      a[i].Y:=strtoint(grid1.Cells[1,i]);
    end;
    image1.Canvas.Pen.Color:=rgb(255,255,255);
    image1.Canvas.PolyBezier(a);

    grid1.Cells[0,renglon]:=inttostr(x);
    grid1.Cells[1,renglon]:=inttostr(y);
    for I := 0 to 3 do
      begin
        a[i].X:=strtoint(grid1.Cells[0,i]);
        a[i].Y:=strtoint(grid1.Cells[1,i]);
      end;
      image1.Canvas.Pen.Color:=rgb(0,0,0);
      image1.Canvas.PolyBezier(a);
end;

6:
begin
  triangulo(255,255,255,grid1,image1);
  grid1.Cells[0,renglon]:=inttostr(x);
  grid1.Cells[1,renglon]:=inttostr(y);
  triangulo(0,0,0,grid1,image1);
  triangulo(strtoint(TxtRojo.Text),strtoint(TxtVerde.Text),strtoint(TxtAzul.Text),grid1,image1);

end;

12:
begin
  image1.Canvas.Pixels[x,y]:=rgb(197,14,18);
end;

end;

//Coordenadas plano-------------------------------------------------------------
begin
escala:=10;
xp:=trunc((x-mitadx)/escala);
yp:=trunc((y-mitady)/escala);
edit3.Text:='X= ' + inttostr(trunc(xp))+'Y= ' + inttostr(trunc(yp));

end;

end;
procedure TForm1.ImagenE1Click(Sender: TObject);
begin
image1.Picture.SaveToFile('C:\Users\jesus\Desktop\Imagen1.bmp');
end;

//Fin Evento MouseMove----------------------------------------------------------



end.
