-- Contains the body for the RomanConverter interface.
with romanconverter;
use romanconverter;
with Ada.Strings.Unbounded;
with Text_Io, Text_Io.Unbounded_Io;
with Ada.Integer_Text_Io;

-- Body for the RomanConverter Package.
package body RomanConverter is 
    -- Converts a roman numeral to an integer. Expects an unbounded_string
    -- as a parameter. Return type is of integer.
    function ToInteger(Roman : in Unbounded_String) return Integer is
        char : character;
        value : integer := 0;
    begin
        for I in 1..length(Roman) loop
            char := Element(Roman, I);
            case char is
                when 'M' => value := value + 1000;
                when 'D' => value := value + 500;
                when 'C' => value := value + 100;
                when 'L' => value := value + 50;
                when 'X' => value := value + 10;
                when 'V' => value := value + 5;
                when 'I' => value := value + 1;
                when others => value := value + 0;
            end case;
        end loop;
        return value;
    end ToInteger;
    
    -- Converts an integer to an roman numeral. Expects an integer value as a 
    -- parameter. Return type is an Unbounded_String.
    function ToRoman(value : in integer) return unbounded_String is
        roman : unbounded_String;
        changed_value : integer := value;
        Numerals : Array (1..7) of integer := (1000, 500, 100, 50, 10, 5, 1);
        Romans : Array (1..7) of character := ('M', 'D', 'C', 'L', 'X', 'V', 'I');
    begin
        while changed_value > 0 loop
            for I in Numerals'Range loop
                if changed_value >= Numerals(I) then
                    roman := roman & Romans(I);
                    changed_value := changed_value - Numerals(I);
                    exit;
                end if;
            end loop;
        end loop;
        return roman;
    end ToRoman;
end RomanConverter;
