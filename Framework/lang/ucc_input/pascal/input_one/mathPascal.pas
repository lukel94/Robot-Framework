
{
 ??? ??????????,  2013???
 ????? ???????
 https://vk.com/id299999954
 romka97@bk.ru
}

unit mathLibPascal;

{$H+}

interface

uses SysUtils;

  function  SumStrV(s1,s2:string):string;
  function  RuzStrV(s1,s2:string):string;
  function  SumStr(s1,s2:string):string;      //?????
  function  RuzStr(s1,s2:string):string;      //????????
  function  SravnStr(s1,s2:string):boolean;   //?????????
  procedure AlignStr(var s1,s2:string);       //?????????
  function  UmnogStr(s1,s2:string):string;    //?????????
  function  UmnogStrV(s1,s2:string):string;
  function  DelStr(s1,s2:string; o:longword):string;  //???????
  function  DelStrV(s1,s2:string; d:longword):string;
  function  ModStr(s1,s2:string):string;              //???
  function  DivStr(s1,s2:string):string;              //???
  function  delV(s1:AnsiString):AnsiString;
  function  perZ(s1:AnsiString):AnsiString;
  function  StepStrP(s1,s2:string):string;
  function  StepStr(s1,s2:string; t:longword):string; //???????
  function  StepMStr(s1,s2,s3:string):string;        //??????? ?? ??????
  function  ProvStr(p:string; r:byte):boolean;       //???? ????????
  function  RandStr(s1:string):string;               //????????? ??????
  function  FactStr(s1:string):string;               //?????????
  function  SinStr(s1:string; t:word; z:boolean):string;  //?????
  function  CosStr(s1:string; t:word; z:boolean):string;  //???????
  function  NodStr(s1,s2:string):string;                  //???
  function  NokStr(s1,s2:string):string;                  //???
  function  SqrtStr(s1:string; k:longword):string;        //??????      //?????????? ? ???????, (?? ????????)
  function  TruncStr(s1:string):string;                   //?????? ??????
  function  AbsStr(s1:string):string;                     //??????
  function  SovpStr(s1,s2:string; a:longword):longword;   //?????? ?????????? ? ????? ???????
  function Str10ToStrBaseX(s1,s2:string; t:longword):string;    //??????? ? ?????? ??????? ?????????

implementation

procedure AlignStr(var s1,s2:string);          //+++
var a,b,i:longword;
begin
  a:=pos('.',s1);
  b:=pos('.',s2);
  if (a=0) and (b=0) then exit;
  if a=0 then s1:=s1+'.';
  if b=0 then s2:=s2+'.';
  a:=length(s1)-pos('.',s1);
  b:=length(s2)-pos('.',s2);
  if a>b then
    for i:=1 to (a-b) do
      s2:=s2+'0'
  else
    for i:=1 to (b-a) do
      s1:=s1+'0';
end;

function SumStr(s1,s2:string):string;
var b1,b2,b3,r:boolean;
    z:longword;
    s3:string;
begin
  b1:=true;
  b2:=true;
  r:=true;
  s3:='';
  z:=0;
  AlignStr(s1,s2);
  if pos('-',s1)=1 then
  begin
    b1:=false;
    delete(s1,1,1);
  end;
  if pos('-',s2)=1 then
  begin
    b2:=false;
    delete(s2,1,1);
  end;
  if pos('.',s1)>0 then
  begin
    z:=length(s1)-pos('.',s1);
    delete(s1,pos('.',s1),1);
    delete(s2,pos('.',s2),1);
    while pos('0',s1)=1 do delete(s1,1,1);
    while pos('0',s2)=1 do delete(s2,1,1);
  end;
  b3:=SravnStr(s1,s2);
  if b1 and b2 then
    if b3 then s3:=SumStrV(s1,s2)
    else s3:=SumStrV(s2,s1)
  else
    if not b1 and not b2 then
    begin
      if b3 then s3:=SumStrV(s1,s2)
      else s3:=SumStrV(s2,s1);
      r:=false;
    end
    else
      if b1 and not b2 then
        if b3 then s3:=RuzStrV(s1,s2)
        else
        begin
          s3:=RuzStrV(s2,s1);
          r:=false;
        end
      else
        if b3 then
        begin
          s3:=RuzStrV(s1,s2);
          r:=false;
        end
        else
          s3:=RuzStrV(s2,s1);
  if z>0 then
  begin
    while length(s3)<=z do s3:='0'+s3;
    insert('.',s3,length(s3)-z+1);
  end;
  while pos('0',s3)=1 do delete(s3,1,1);
  if pos('.',s3)>0 then
  begin
    while pos('0',s3)=length(s3) do delete(s3,length(s3),1);
    if pos('.',s3)=length(s3) then delete(s3,length(s3),1);
  end;
  if not r then s3:='-'+s3;
  if length(s3)<1 then s3:='0';
  Result:=s3;
end;

function SumStrV(s1,s2:string):string;
var b,c:byte;
    s3:string;
    i:longword;
begin
  s3:='';
  b:=0;
  for i:=1 to length(s2) do
  begin
    c:=strtoint(copy(s1,length(s1)-i+1,1))+strtoint(copy(s2,length(s2)-i+1,1))+b;
    s3:=inttostr(c mod 10)+s3;
    b:=c div 10;
  end;

  for i:=(length(s1)-length(s2)) downto 1 do
  begin
    c:=strtoint(copy(s1,i,1))+b;
    s3:=inttostr(c mod 10)+s3;
    b:=c div 10;
    if b=0 then
    begin
      s3:=copy(s1,1,i-1)+s3;
      break;
    end;
  end;
  if b>0 then s3:=inttostr(b)+s3;
  Result:=s3;
end;

function RuzStr(s1,s2:string):string;
var b1,b2,b3,r:boolean;
    z:longword;
    s3:string;
begin
  b1:=true;
  b2:=true;
  r:=true;
  s3:='';
  z:=0;
  AlignStr(s1,s2);
  if pos('-',s1)=1 then
  begin
    b1:=false;
    delete(s1,1,1);
  end;
  if pos('-',s2)=1 then
  begin
    b2:=false;
    delete(s2,1,1);
  end;
  if pos('.',s1)>0 then
  begin
    z:=length(s1)-pos('.',s1);
    delete(s1,pos('.',s1),1);
    delete(s2,pos('.',s2),1);
    while pos('0',s1)=1 do delete(s1,1,1);
    while pos('0',s2)=1 do delete(s2,1,1);
  end;
  b3:=SravnStr(s1,s2);
  if b1 and b2 then
    if b3 then s3:=RuzStrV(s1,s2)
    else
    begin
      s3:=RuzStrV(s2,s1);
      r:=false;
    end
  else
    if not b1 and not b2 then
      if b3 then
      begin
        s3:=RuzStrV(s1,s2);
        r:=false;
      end
      else s3:=RuzStrV(s2,s1)
    else
      if b1 and not b2 then
        if b3 then s3:=SumStrV(s1,s2)
        else
          s3:=SumStrV(s2,s1)
      else
      begin
        if b3 then s3:=SumStrV(s1,s2)
        else
          s3:=SumStrV(s2,s1);
        r:=false;
      end;
  if z>0 then
  begin
    while length(s3)<=z do s3:='0'+s3;
    insert('.',s3,length(s3)-z+1);
  end;
  while pos('0',s3)=1 do delete(s3,1,1);
  if pos('.',s3)>0 then
  begin
    while pos('0',s3)=length(s3) do delete(s3,length(s3),1);
    if pos('.',s3)=length(s3) then delete(s3,length(s3),1);
  end;
  if not r then s3:='-'+s3;
  if length(s3)<1 then s3:='0';
  Result:=s3;
end;

function RuzStrV(s1,s2:string):string;
var b,c1,c2:byte;
    s3:string;
    i:longword;
begin
  s3:='';
  b:=0;
  for i:=1 to length(s2) do
  begin
    c1:=strtoint(copy(s1,length(s1)-i+1,1));
    c2:=strtoint(copy(s2,length(s2)-i+1,1));
    if c1>=(c2+b) then
    begin
      c1:=c1-c2-b;
      b:=0;
    end
    else
    begin
      c1:=c1+10-c2-b;
      b:=1;
    end;
    s3:=inttostr(c1)+s3;
  end;

  for i:=(length(s1)-length(s2)) downto 1 do
  begin
    if b=0 then
    begin
      s3:=copy(s1,1,i)+s3;
      break;
    end;
    c1:=strtoint(copy(s1,i,1));
    if c1>0 then
    begin
      c1:=c1-b;
      b:=0;
    end
    else
     c1:=9;
    s3:=inttostr(c1)+s3;
  end;
 Result:=s3;
end;

function SravnStr(s1,s2:string):boolean;       //+++
var b:boolean;
begin
  b:=true;
  if length(s1)>length(s2) then
    b:=true
  else
    if length(s2)>length(s1) then
      b:=false
    else
      if s1<s2 then b:=false;
  Result:=b;
end;

function UmnogStr(s1,s2:string):string;
var b1,b2,r:boolean;
    z:longword;
    s3:string;
begin
  b1:=true;
  b2:=true;
  r:=false;
  s3:='';
  z:=0;
  if pos('-',s1)=1 then
  begin
    b1:=false;
    delete(s1,1,1);
  end;
  if pos('-',s2)=1 then
  begin
    b2:=false;
    delete(s2,1,1);
  end;
  if (b1 and b2) or (not b1 and not b2) then r:=true;
  if pos('.',s1)>0 then
  begin
    z:=z+length(s1)-pos('.',s1);
    delete(s1,pos('.',s1),1);
    while pos('0',s1)=1 do delete(s1,1,1);
  end;
  if pos('.',s2)>0 then
  begin
    z:=z+length(s2)-pos('.',s2);
    delete(s2,pos('.',s2),1);
    while pos('0',s2)=1 do delete(s2,1,1);
  end;
  if SravnStr(s1,s2) then s3:=UmnogStrV(s1,s2)
  else s3:=UmnogStrV(s2,s1);
  if z>0 then
  begin
    while length(s3)<=z do s3:='0'+s3;
    insert('.',s3,length(s3)-z+1);
  end;
  while pos('0',s3)=1 do delete(s3,1,1);
  if pos('.',s3)>0 then
  begin
    while pos('0',s3)=length(s3) do delete(s3,length(s3),1);
    if pos('.',s3)=length(s3) then delete(s3,length(s3),1);
  end;
  if not r then s3:='-'+s3;
  if length(s3)<1 then s3:='0';
  Result:=s3;
end;

function UmnogStrV(s1,s2:string):string;
var b,c,d:byte;
    s3,s4,s5:string;
    i,i2:longword;
    mas1:array[1..9] of string=('0','0','0','0','0','0','0','0','0');
begin
  s4:='0';
  s5:='';
  mas1[1]:=s1;
  for i:=length(s2) downto 1 do
  begin
    s3:='';
    b:=0;
    d:=strtoint(copy(s2,i,1));
    if d=0 then
    begin
      s5:=s5+'0';
      continue;
    end;
    if mas1[d]='0' then
    begin
      for i2:=0 to length(s1)-1 do
      begin
        c:=strtoint(copy(s1,length(s1)-i2,1))*d+b;
        s3:=inttostr(c mod 10)+s3;
        b:=c div 10;
      end;
      if b>0 then s3:=inttostr(b)+s3;
      mas1[d]:=s3;
    end
    else
      s3:=mas1[d];

    s3:=s3+s5;
    s5:=s5+'0';
    if SravnStr(s4,s3) then s4:=SumStrV(s4,s3)
    else
      s4:=SumStrV(s3,s4)
  end;
  Result:=s4;
end;

function DelStr(s1,s2:string; o:longword):string;
var b1,b2,r:boolean;
    z,z2,i,k:Longword;
    s3:string;
begin
  b1:=true;
  b2:=true;
  r:=false;
  z:=0;
  k:=0;
  z2:=0;
  s3:='';
  if pos('-',s1)=1 then
  begin
    b1:=false;
    delete(s1,1,1);
  end;
  if pos('-',s2)=1 then
  begin
    b2:=false;
    delete(s2,1,1);
  end;
  if (b1 and b2) or (not b1 and not b2) then r:=true;
  if pos('.',s1)>0 then
  begin
    z:=length(s1)-pos('.',s1);
    delete(s1,pos('.',s1),1);
    for i:=1 to z do
    begin
      z2:=z2+1;
      if pos('.',s2)=0 then s2:=s2+'0'
      else
      begin
        k:=length(s2)-pos('.',s2);
        delete(s2,pos('.',s2),1);
        insert('.',s2,length(s2)-k+1);
      end;
    end;
    while pos('0',s1)=1 do delete(s1,1,1);
  end;
  if pos('.',s2)>0 then
  begin
    z2:=length(s2)-pos('.',s2);
    delete(s2,pos('.',s2),1);
    for i:=1 to z2 do
    begin
      z:=z+1;
      s1:=s1+'0';
    end;
    while pos('0',s2)=1 do delete(s2,1,1);
  end;
  s3:=DelStrV(s1,s2,o);
  if pos('.',s3)>0 then
    z:=z+length(s3)-pos('.',s3);
  delete(s3,pos('.',s3),1);
  if (z-z2)>0 then
  begin
    while length(s3)<(z-z2) do s3:='0'+s3;
    insert('.',s3,length(s3)-(z-z2)+1);
  end
  else
    if (z2-z)>0 then
      for i:=1 to (z2-z) do s3:=s3+'0';
  if pos('.',s3)>0 then
  begin
    while pos('0',s3)=length(s3) do delete(s3,length(s3),1);
    if pos('.',s3)=length(s3) then delete(s3,length(s3),1);
  end;
  if not r then s3:='-'+s3;
  if length(s3)<1 then s3:='0';
  Result:=s3;
end;

function DelStrV(s1,s2:string; d:longword):string;
var b:byte;
    s3,s4:string;
    l:boolean;
    i:longword;
begin
  l:=true;
  b:=0;
  s4:='';
  if length(s1)>length(s2) then
  begin
    s3:=copy(s1,1,length(s2));
    delete(s1,1,length(s2));
  end
  else
  begin
    s3:=s1;
    s1:='';
  end;
    while true do
      if SravnStr(s3,s2) then
      begin
        //form1.memo1.lines.append(s3);
        s3:=RuzStr(s3,s2);
        b:=b+1;
        //form1.memo1.lines.append(s3);
        //form1.memo1.lines.append(s2);
       // Application.ProcessMessages;
       // sleep(2000);
        if s3='0' then
        begin
          s3:='';
          if length(s1)>0 then
          begin
            for i:=1 to length(s1) do
              if copy(s1,i,1)<>'0' then
              begin
                l:=false;
                break;
              end;
            if l then
            begin
              s4:=s4+inttostr(b)+s1;
              b:=0;
              break;
            end;
          end
          else
          begin
            s4:=s4+inttostr(b);
            b:=0;
            break;
          end;
        end;
      end
      else
        if length(s1)>0 then
        begin
          s4:=s4+inttostr(b);
          b:=0;
          s3:=s3+copy(s1,1,1);
          delete(s1,1,1);
          if not SravnStr(s3,s2) and (length(s1)=0) and (d=0) then s4:=s4+'0';
          if copy(s3,1,1)='0' then  delete(s3,1,1);
         // form1.memo1.lines.append(s3);
        //  Application.ProcessMessages;
        end
        else
          if d>0 then
          begin
            s4:=s4+inttostr(b);
            b:=0;
            if pos('.',s4)<1 then s4:=s4+'.';
            s3:=s3+'0';
            d:=d-1;
          end
          else
            break;
 if b>0 then s4:=s4+inttostr(b);
 while copy(s4,1,1)='0' do delete(s4,1,1);
 //form1.memo1.lines.append(s4+'vv');
 Result:=s4;
end;

function ModStr(s1,s2:string):string;       //+++
var s3:string;
begin
 s3:=DelStr(s1,s2,0);
 result:=RuzStr(s1,UmnogStr(s2,s3));
end;

function DivStr(s1,s2:string):string;       //+++
begin
   result:=DelStr(s1,s2,0);
end;

function RandStr(s1:string):string;        //+++
var s2:string;
    i:longword;
    b:boolean;
begin
  randomize;
  s1:=RuzStrV(s1,'1');
  b:=true;
  s2:='';
  for i:=1 to length(s1) do
    if b then
    begin
      s2:=s2+inttostr(random(strtoint(copy(s1,i,1))+1));
      if copy(s2,i,1)<copy(s1,i,1)  then b:=false;
    end
    else
      s2:=s2+inttostr(random(10));
  while copy(s2,1,1)='0' do delete(s2,1,1);
  if s2='' then s2:='0';
  Result:=s2;
end;

function ProvStr(p:string; r:byte):boolean;
label metka1;
var mas1:array[1..4] of string[1]=('2','3','5','7');
    i,b:longword;
    m,a,j,z:string;
begin
  for i:=1 to 4 do
    if (ModStr(p,mas1[i]))='0' then begin result:=false; exit; end;
  m:=RuzStrV(p,'1');
  b:=0;
  while true  do
  begin
    m:=delV(m);
    b:=b+1;
    if ModStr(m,'2')='1' then break;
  end;
  m:=RuzStrV(p,'1');
  for i:=1 to r do begin
    a:=SumStrV(RandStr(RuzStrV(m,'2')),'2');
    j:='0';
    z:='1';
    z:=StepMStr(a,m,p);
    // form1.memo1.lines.append(z);
    //form1.memo1.lines.append(m);
   // Application.ProcessMessages;
    if (z='1') or (z=RuzStrV(p,'1')) then  begin result:=true; continue; end;
    metka1:
    if not SravnStr('0',j) and (z='1') then  begin Result:=false; exit; end;
    j:=SumStrV(j,'1');
    if not SravnStr(j,inttostr(b)) and not SravnStr(z,RuzStrV(p,'1')) then begin z:=ModStr(UmnogStrV(z,z),p); goto metka1; end;
    if z=RuzStrV(p,'1') then begin result:=true; continue; end;
    if (j=inttostr(b)) and (z<>RuzStrV(p,'1')) then begin result:=false; exit; end;
  end;
end;

function delV(s1:AnsiString):AnsiString;  //??????? ?????????? ?????? ?? 2  (+++)
var a,b:byte;
    i:longword;
    s2:string;
begin
  b:=0;
  s2:='';
  for i:=1 to length(s1) do
  begin
    a:=strtoint(copy(s1,i,1));
    a:=a+b;
    b:=0;
    if (a mod 2 = 1) then b:=10;
    a:=trunc(a/2);
    s2:=s2+inttostr(a);
  end;
  while copy(s2,1,1)='0' do delete(s2,1,1);
  delV:=s2;
end;

function perZ(s1:AnsiString):AnsiString;         // +++   (delV)
var s2:AnsiString='';
  a:byte;
begin
  a:=strtoint(copy(s1,length(s1),1));
  while (a>1) or (length(s1)>1) do
  begin
    if (a mod 2)=0 then
      s2:='0'+s2
    else begin
      s2:='1'+s2;
      a:=a-1;
    end;
   delete(s1,length(s1),1);
   s1:=s1+inttostr(a);
   s1:=delV(s1);
   while copy(s1,1,1)='0' do delete(s1,1,1);
   a:=strtoint(copy(s1,length(s1),1));
  end;
  Result:='1'+s2;
end;

function StepStr(s1,s2:string; t:longword):string;
var b:boolean;
begin
  b:=false;
  if copy(s2,1,1)='-' then
  begin
    delete(s2,1,1);
    b:=true;
  end;
  s1:=StepStrP(s1,s2);
  if b then s1:=DelStr('1',s1,t);
  result:=s1;
end;

function StepStrP(s1,s2:string):string;
var i:longword;
    s0,sb:string;
begin
  s0:=s1;
  s2:=perZ(s2);
  for i:=2 to length(s2) do
  begin
    sb:=UmnogStr(s0,s0);
    if copy(s2,i,1)='1' then sb:=UmnogStr(sb,s1);
    s0:=sb;
  end;
  if s2='0' then s0:='1';
  Result:=s0;
end;

function StepMStr(s1,s2,s3:string):string;
var i:longword;
    s0,sb:string;
begin
  s2:=perZ(s2);
  s0:=s1;
  for i:=2 to length(s2) do
  begin
    sb:=UmnogStrV(s0,s0);
    if copy(s2,i,1)='1' then sb:=UmnogStrV(sb,s1);
    s0:=sb;
    s0:=ModStr(s0,s3);
  end;
  Result:=s0;
end;

function FactStr(s1:string):string;
var i:longword;
    s2:string;
begin
  s2:='1';
  for i:=2 to strtoint(s1) do
    s2:=UmnogStr(s2,inttostr(i));
  Result:=s2;
end;

function SinStr(s1:string; t:word; z:boolean):string;
var s2,s3:string;
    b:boolean;
    a,i:longword;
begin
  b:=true;
  s2:='0';
  a:=1;
  i:=0;
  if not z then
  begin
    s1:=ModStr(s1,'360');
    s1:=DelStr(s1,'57.2957795130823',20);
  end;
  //form1.memo1.lines.append(s1+'ggggggg');
  //Application.ProcessMessages;
  while a<(t+1) do
  begin
    s3:=s2;
    if b then
    begin
      s2:=SumStr(s2,DelStr(StepStrP(s1,inttostr(i*2+1)),FactStr(inttostr(i*2+1)),t+10));
      b:=false;
    end
    else
    begin
      s2:=RuzStr(s2,DelStr(StepStrP(s1,inttostr(i*2+1)),FactStr(inttostr(i*2+1)),t+10));
      b:=true;
    end;
    a:=SovpStr(s2,s3,a);
    i:=i+1;
  end;
  s2:=copy(s2,1,pos('.',s2)+t);
  Result:=s2;
end;

function CosStr(s1:string; t:word; z:boolean):string;
var s2,s3:string;
    b:boolean;
    i,a:longword;
begin
  b:=false;
  s2:='1';
  a:=1;
  i:=1;
  if not z then
  begin
    s1:=ModStr(s1,'360');
    s1:=DelStr(s1,'57.2957795130823',20);
  end;
  while a<(t+1) do
  begin
   s3:=s2;
    if b then
    begin
      s2:=SumStr(s2,DelStr(StepStrP(s1,inttostr(i*2)),FactStr(inttostr(i*2)),t+10));
      b:=false;
    end
    else
    begin
      s2:=RuzStr(s2,DelStr(StepStrP(s1,inttostr(i*2)),FactStr(inttostr(i*2)),t+10));
      //form1.memo1.lines.append(s2+'ll');
      b:=true;
    end;
    a:=SovpStr(s2,s3,a);
    i:=i+1;
  end;
  s2:=copy(s2,1,pos('.',s2)+t);
  Result:=s2;
end;

function NodStr(s1,s2:string):string;
var s3:string;
begin
  if copy(s1,1,1)='-' then delete(s1,1,1);
  if copy(s2,1,1)='-' then delete(s2,1,1);
  if not SravnStr(s1,s2) then
  begin
    s3:=s1; s1:=s2; s2:=s3;
  end;
  if s2='0' then
  begin
    Result:=s1;
    exit;
  end;
  while true do
  begin
    s3:=ModStr(s1,s2);
    if s3='0' then
    begin
      Result:=s2;
      break;
    end;
    s1:=s2;
    s2:=s3;
  end;
end;

function NokStr(s1,s2:string):string;
begin
   Result:=DelStr(UmnogStr(s1,s2),NodStr(s1,s2),0);
end;

function SqrtStr(s1:string; k:longword):string;
var z,i,i2:longword;
    s0,s2,s3,s5:string;
begin
  z:=length(s1);
  if pos('.',s1)>0 then
    z:=pos('.',s1)-1;
  if (z mod 2)=1 then
  begin
    s2:=copy(s1,1,1);
    delete(s1,1,1);
  end
  else
  begin
    s2:=copy(s1,1,2);
    delete(s1,1,2);
  end;
  z:=z div 2;
  if pos('.',s1)>0 then
  begin
    z:=length(s1)-pos('.',s1);
    if (z mod 2)=1 then s1:=s1+'0';
    z:=(length(s1)-1) div 2;
  end;
  s0:=inttostr(trunc(sqrt(strtoint(s2))));
  s3:=UmnogStr(s0,s0);
  s2:=RuzStr(s2,s3);
  for i:=1 to z+k do
  begin
    //form1.memo1.lines.append(s1);
    if copy(s1,1,1)='.' then
    begin
      s0:=s0+'.';
      delete(s1,1,1);
    end;
    if length(s1)>0 then
    begin
      s2:=s2+copy(s1,1,2);
      delete(s1,1,2);
    end
    else
      s2:=s2+'00';
    //form1.memo1.lines.append(s2);
    //form1.memo1.lines.append(s2+'gg');
    for i2:=1 to 10 do
      if not SravnStr(s2,UmnogStr(s3+inttostr(i2),inttostr(i2))) then
      begin
        s0:=s0+inttostr(i2-1);
        break;
      end;
    // form1.memo1.lines.append(UmnogStr(s3+inttostr(i2-1),inttostr(i2-1)));
     //form1.memo1.lines.append(s3);
     //form1.memo1.lines.append(inttostr(i2-1));
    s2:=RuzStr(s2,UmnogStr(s3+inttostr(i2-1),inttostr(i2-1)));
    s5:=s0;
    if pos('.',s5)>0 then
      delete(s5,pos('.',s5),1);
    s3:=UmnogStr(s5,'2');
  end;
  result:=s0;
end;

function TruncStr(s1:string):string;
begin
  if pos('.',s1)>0 then
    Result:=copy(s1,1,pos('.',s1)-1)
  else
    Result:=s1;
end;

function AbsStr(s1:string):string;
begin
  if copy(s1,1,1)='-' then delete(s1,1,1);
  result:=s1;
end;

function SovpStr(s1,s2:string; a:longword):longword;
var i,ch:longword;
begin
  ch:=0;
  for i:=1 to length(s1)-a+1 do
    if copy(s1,a+i,1)=copy(s2,a+i,1) then ch:=ch+1
    else break;
  result:=ch+a;
end;

function Str10ToStrBaseX(s1,s2:string; t:longword):string;
const co='0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ+/';
var s0,s3,s4:string;
    i:longword;
begin
  s0:='';
  if pos('.',s1)>0 then
  begin
    s4:=copy(s1,pos('.',s1),length(s1)-pos('.',s1)+1);
    s1:=DivStr(s1,'1');
    s0:=s0+'.';
    for i:=1 to t do
    begin
      s4:=UmnogStr(s4,s2);
      s0:=s0+copy(co,strtoint(DivStr(s4,'1'))+1,1);
      if pos('.',s4)=0 then break;
      s4:=RuzStr(s4,DivStr(s4,'1'));
    end;
  end;
  if s1='' then s1:='0';
  while s1<>'0' do
  begin
    s3:=ModStr(s1,s2);
    s0:=copy(co,strtoint(s3)+1,1)+s0;
    s1:=DivStr(s1,s2);
  end;

  Result:=s0;
end;



end.