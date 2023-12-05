program DKR_3;

uses Crt;

const
  NORM = 8; {серый}
  SEL = 13; {розовый}
  Num = 2;

var
  menu: array[1..Num] of string;{ названия пунктов меню }
  punkt: integer; ch: char; x1, y1: integer;  n: integer;
  a, b, x, s, h: real;

function Left(xx: real): real;
begin
  Left := 2 * (xx * xx * xx) + (-1) * (xx * xx) + (-2) * xx + 8;
end;

function Perv: real;
begin
  Perv := ((b ** 4) / 2 - (b ** 3) / 3 - b ** 2 + 8 * b) - ((a ** 4) / 2 - (a ** 3) / 3 - a ** 2 + 8 * a);
end;


procedure punkt1;
begin
  ClrScr;
  textcolor(11);
  Writeln('Введите границы интегрирования: ');
  textcolor(14);
  readln(a, b);
  textcolor(11);
  Writeln('Введите количество промежутков: ');
  textcolor(14);
  readln(n);
  h := (b - a) / n;
  x := a;
  for var i := 0 to n - 1 do
  begin
    s += Left(x);
    x += h;
  end;
  s *= h;
  textcolor(10);
  writeln('Результат интегрирования:  ', s:0:2);
  textcolor(12);
  writeln;
  writeln('Погрешность вычисления равна:  ', perv - s); 
  textcolor(norm);
  writeln('Нажмите [Enter] для выхода в меню');
  repeat
    ch := readkey;
  until ch = #13;
end;

procedure MenuToScr;
var
  i: integer;
begin
  ClrScr;
  for i := 1 to Num do
  begin
    GoToXY(x1, y1 + i - 1);
    write(menu[i]);
  end;
  TextColor(SEL);
  GoToXY(x1, y1 + punkt - 1);
  write(menu[punkt]);
  TextColor(NORM);
end;

begin
  clrscr;
  textcolor(10);
  Writeln;
  Writeln;
  Writeln('██╗░░░░░███████╗███████╗████████╗  ██████╗░███████╗░█████╗░████████╗░█████╗░███╗░░██╗░██████╗░██╗░░░░░███████╗░██████╗');
  Writeln('██║░░░░░██╔════╝██╔════╝╚══██╔══╝  ██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██╔══██╗████╗░██║██╔════╝░██║░░░░░██╔════╝██╔════╝');
  Writeln('██║░░░░░█████╗░░█████╗░░░░░██║░░░  ██████╔╝█████╗░░██║░░╚═╝░░░██║░░░███████║██╔██╗██║██║░░██╗░██║░░░░░█████╗░░╚█████╗░');
  Writeln('██║░░░░░██╔══╝░░██╔══╝░░░░░██║░░░  ██╔══██╗██╔══╝░░██║░░██╗░░░██║░░░██╔══██║██║╚████║██║░░╚██╗██║░░░░░██╔══╝░░░╚═══██╗');
  Writeln('███████╗███████╗██║░░░░░░░░██║░░░  ██║░░██║███████╗╚█████╔╝░░░██║░░░██║░░██║██║░╚███║╚██████╔╝███████╗███████╗██████╔╝');
  Writeln('╚══════╝╚══════╝╚═╝░░░░░░░░╚═╝░░░  ╚═╝░░╚═╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚══════╝╚══════╝╚═════╝░');
  writeln;
  textcolor(norm);
  writeln('                                          Нажмите [Enter] для продолжения');
  repeat
    ch := readkey;
  until ch = #13;
  clrscr;
  menu[1] := ' Начать интегрирование ';
  menu[2] := ' Выход ';
  punkt := 1; x1 := 5; y1 := 5;
  TextColor(NORM);
  MenuToScr;
  repeat
    ch := ReadKey;
    if ch = #0 then begin
      ch := ReadKey;
      case ch of
        #40:{ стрелка вниз }
          if punkt < Num then begin
            GoToXY(x1, y1 + punkt - 1); write(menu[punkt]);
            punkt := punkt + 1;
            TextColor(SEl);
            GoToXY(x1, y1 + punkt - 1); write(menu[punkt]);
            TextColor(NORM);
          end;
        #38:{ стрелка вверх }
          if punkt > 1 then begin
            GoToXY(x1, y1 + punkt - 1); write(menu[punkt]);
            punkt := punkt - 1;
            TextColor(SEl);
            GoToXY(x1, y1 + punkt - 1); write(menu[punkt]);
            TextColor(NORM);
          end;
      end;
    end
    else
    if ch = #13 then begin{ нажата клавиша <Enter> }
      case punkt of
        1: punkt1;
        2: ch := #27;{ выход }
      end;
      MenuToScr;
    end;
  until ch = #27;{ 27 - код <Esc> }
end.