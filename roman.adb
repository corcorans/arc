with romanconverter;
use romanconverter;
with Ada.Strings.Unbounded;
with Text_Io, Text_Io.Unbounded_Io;
with Ada.Integer_Text_Io;
use Ada.Strings.Unbounded;
with Ada.Strings;

--The main procedure for the roman file.
--This procedure contains a procedure and two functions
--which will output roman numerals and integer values 
--after converting them.
procedure roman is
    package Int_IO is new TEXT_IO.INTEGER_IO(INTEGER);
    use Int_IO;
    
    line : Unbounded_String;
    dummyChar : Unbounded_String;
    count : integer;
    roman1 : Unbounded_String;
    roman2 : Unbounded_String;
    oper : character;
    space : integer := 0;
    total : integer;
    output : Unbounded_String;
    
    --Takes three parameters, two integers and a character
    --Will do and return the math on the operation passed in on the two
    --values also passed in.
    function Operator(oper1 : in integer; 
                      oper2 : in integer; 
                      operator : in character) return integer is
    begin
        case operator is
            when '+' => return oper1 + oper2;
            when '-' => return oper1 - oper2;
            when '*' => return oper1 * oper2;
            when '/' => return oper1 / oper2;
            when others => return 0;
        end case;
    end Operator;
    
    --Checks for negative integers so that a negative 
    --Roman Numeral can be printed to the screen.
    function CheckForNegative(total : in integer) return Unbounded_String is 
        abs_total : integer := abs total;
    begin
        if total = 0 then
            return Null_Unbounded_String & "zero";
        elsif total < 0 then
            return "-" & ToRoman(abs_total);
        else
            return ToRoman(abs_total);
        end if;
    end CheckForNegative;
   
    --Handles printing out all of the input plus to calculations performed
    --on each roman numeral. The parameters are 2 unbounded_strings for the
    --roman numerals, a character for the operation performed on the numerals
    -- and a total which is an integer.
    procedure PrintOutput(roman1 : in Unbounded_string; 
                          roman2 : in Unbounded_String; 
                          oper : in character; 
                          total : in integer) is
    begin
        Ada.Integer_Text_Io.Put(ToInteger(roman1), 1);
        Text_Io.Unbounded_Io.Put(Null_Unbounded_String & " ");
        Ada.Text_Io.Put(oper);
        Text_Io.Unbounded_Io.Put(Null_Unbounded_String & " ");
        Ada.Integer_Text_Io.Put(ToInteger(roman2), 1);
        Text_Io.Unbounded_Io.Put(Null_Unbounded_String & " = ");
        Ada.Integer_Text_Io.Put(total, 1);
        Text_Io.unbounded_Io.Put(Null_Unbounded_String & " = ");
        Text_Io.Unbounded_Io.Put_Line(output);	
    end PrintOutput;
begin
    Int_Io.Get(count);
    Text_Io.Unbounded_Io.Get_Line(dummyChar);
    while count > 0 loop
        Text_Io.Unbounded_Io.Get_Line(line);
        space := Index(line, " ");
        roman1 := Null_Unbounded_String & slice(line, 1, space - 1);
        oper := Element(Null_Unbounded_String & 
                                         slice(line, space + 1, space + 2), 1);
        roman2 := Null_Unbounded_String & slice(line, space + 3, length(line));
        total := Operator(ToInteger(roman1), ToInteger(roman2), oper);
        output := CheckForNegative(total);
	PrintOutput(roman1, roman2, oper, total);
        count := count - 1;
    end loop;
end roman;
