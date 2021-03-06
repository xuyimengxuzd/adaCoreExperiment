------------------------------------------------------------------------------
--                        Bareboard drivers examples                        --
--                                                                          --
--                     Copyright (C) 2015-2016, AdaCore                     --
--                                                                          --
-- This library is free software;  you can redistribute it and/or modify it --
-- under terms of the  GNU General Public License  as published by the Free --
-- Software  Foundation;  either version 3,  or (at your  option) any later --
-- version. This library is distributed in the hope that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE.                            --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
------------------------------------------------------------------------------

with Cos;
with STM32.Board;     use STM32.Board;

package Raycaster is

   type Cell is mod 7;
   Empty       : constant Cell := 0;
   Grey_Stone  : constant Cell := 1;
   Grey_Ada    : constant Cell := 2;
   Red_Brick   : constant Cell := 3;
   Red_Ada     : constant Cell := 4;
   Color_Stone : constant Cell := 5;
   Color_Ada   : constant Cell := 6;

   type Map_Type is array (Natural range <>, Natural range <>) of Cell;

   type Position is record
      X     : Float;
      Y     : Float;
      Angle : Cos.Degree;
   end record;

   Map : constant Map_Type :=
            --    0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16
           (0 => (3, 3, 4, 3, 3, 3, 4, 3, 4, 3, 4, 3, 4, 3, 3, 1, 1),
            1 => (1, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6),
            2 => (2, 0, 0, 0, 0, 0, 0, 1, 2, 1, 2, 1, 2, 1, 0, 5, 5),
            3 => (1, 0, 0, 0, 3, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5),
            4 => (1, 0, 0, 0, 3, 0, 1, 0, 5, 0, 0, 4, 3, 4, 0, 0, 5),
            5 => (3, 3, 4, 3, 0, 0, 0, 0, 6, 0, 3, 0, 0, 0, 3, 0, 6),
            6 => (4, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 3, 4, 3, 0, 0, 5),
            7 => (3, 0, 1, 2, 1, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5),
            8 => (4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6),
            9 => (0, 1, 1, 2, 1, 1, 2, 1, 1, 2, 1, 1, 2, 1, 1, 1, 5));

   Current : Position := (X     => 2.5,
                          Y     => 3.5,
                          Angle => 900);

   Actual_Height : constant Natural :=
                     (if LCD_Natural_Width > LCD_Natural_Height
                      then LCD_Natural_Height
                      else LCD_Natural_Width);
   Height_Multiplier : constant Float :=
                         Float (Actual_Height) / 1.5;
--     FOV : constant Cos.Degree := 1100;

   procedure Initialize_Tables;

   procedure Draw;

end Raycaster;
