with Ada.Text_IO;
with Ada.Integer_Text_IO;
with MatrixMult;

procedure AssignmentMain is
   A, B, Result : MatrixMult.Matrix_Type;

   Reader1_Done : Boolean := False;
   Reader2_Done : Boolean := False;
   Multiplication_Done : Boolean := False;

   task Reader1;
   task body Reader1 is
      Temp : Integer;
   begin
      for I in 1..MatrixMult.SIZE loop
         for J in 1..MatrixMult.SIZE loop
            Ada.Integer_Text_IO.Get(Item => Temp);
            A(I, J) := Temp;
         end loop;
      end loop;
      Reader1_Done := True;
   end Reader1;

   task Reader2;
   task body Reader2 is
      Temp : Integer;
   begin
      while not Reader1_Done loop
         null;
      end loop;
      for I in 1..MatrixMult.SIZE loop
         for J in 1..MatrixMult.SIZE loop
            Ada.Integer_Text_IO.Get(Item => Temp);
            B(I, J) := Temp;
         end loop;
      end loop;
      Reader2_Done := True;
   end Reader2;

   task Printer;
   task body Printer is
   begin
      while not Multiplication_Done loop
         null;
      end loop;
      for I in 1..MatrixMult.SIZE loop
         for J in 1..MatrixMult.SIZE loop
            Ada.Text_IO.Put(Item => Integer'Image(Result(I, J)) & " ");
         end loop;
         Ada.Text_IO.New_Line;
      end loop;
   end Printer;

begin
   while not Reader2_Done loop
      null;
   end loop;  
   MatrixMult.MatMult(A, B, Result);
   Multiplication_Done := True;
end AssignmentMain;


