-- romanconverter.ads: interface for converting to and from Roman numbers.
-- Documentation is expected to be with the implementations for this package.
-- Will be implemented in the romanconverter.adb file.
with Ada.Strings.Unbounded;
use  Ada.Strings.Unbounded;

package RomanConverter is
   function ToInteger(Roman : in Unbounded_String) return Integer;
   function ToRoman(Value : in Integer) return Unbounded_String;
end RomanConverter;
