Numerals : Array (1..7) := (1000, 500, 100, 50, 10, 5, 1);
Romans : Array (1..7) := (M, D, C, L, X, V, I);
    
function ToInteger(Roman : in Unbounded_String) return Integer is
    char : character;
    value : integer := 0;
begin
    for I in 1..length(Roman) loop
        char := Element(Roman, I);
        value += convertToInt(char);
    end loop;
    return value;
end ToInteger;

function ToRoman(value : in integer) return unbounded_String is
    roman : character;
begin
    while value > 0 loop
        roman = ConvertToRoman(value);
    end loop;
    return roman
end ToRoman;

function ConvertToInt(char : in unbounded_String) return integer is
    value : integer :=0;
begin
    case char
        when 'M' => value += 1000;
        when 'D' => value += 500;
        when 'C' => value += 100;
        when 'L' => value += 50;
        when 'X' => value += 10;
        when 'V' => value += 5;
        when 'I' => value += 1;
        when others => value += 0;
    end case;
    return value;
end ConvertToInt;

function ConvertToRoman(value : in integer) return unbounded_String is
    roman : character;
begin
    for I in Numerals'Range loop
        if value >= Numerals(I);
            roman += Romans(Numerals(I));
            value -= Numerals(I);
        end if;
    end loop
    return roman;
end ConvertToRoman;
    
