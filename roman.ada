with romanconverter;
use romanconverter;
with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;
with Ada.Text_Io;
with Ada.Text_Io.Unbounded_Io;
use Ada.Text_Io.Unbounded_Io;
with Ada.Integer_Text_IO;

procedure roman is 
use Ada.Integer_Text_IO;
package Int_IO is new TEXT_IO.INTEGER_IO(INTEGER);
    function Operator(oper1 : integer; oper2 : integer; operator : character) return integer is
    begin
        case operator is
            when '+' => return oper1 + oper2;
            when '-' => return oper1 - oper2;
            when '*' => return oper1 * oper2;
            when '/' => return oper1 / oper2;
            when others => return 0;
        end case;
    end Operator;
    
    function CheckForNegative(total : integer) return unbounded_String is 
        abs_total : integer := abs total;
    begin
        if abs_total = 0 then
            return Null_Unbounded_String & "0";
        elsif abs_total < 0 then
            return "-" & ToRoman(total);
        else
            return ToRoman(total);
        end if;
    end CheckForNegative;
begin
    Init_Io.Get(I);
    Text_Io.Get_Line(dummy);
    while I > 0 loop
	Text_Io.Get_Line(line);
        I := I - 1;
    end loop;
end roman;
