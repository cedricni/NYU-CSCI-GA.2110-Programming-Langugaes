package MatrixMult is
   SIZE : Integer := 10;
   type Matrix_Type is array (1..SIZE, 1..SIZE) of Integer;
   procedure MatMult(A, B : in Matrix_Type; C : out Matrix_Type);
end MatrixMult;