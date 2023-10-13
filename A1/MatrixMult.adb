package body MatrixMult is
   task type MatrixMult_Task is
      entry Start_Row_Col(A : Matrix_Type; B : Matrix_Type; C : in out Matrix_Type; Row : Integer; Col : Integer);
   end MatrixMult_Task;
   
   task body MatrixMult_Task is
   begin
      accept Start_Row_Col(A : Matrix_Type; B : Matrix_Type; C : in out Matrix_Type; Row : Integer; Col : Integer) do
         C(Row, Col) := 0;
         for K in 1..SIZE loop
            C(Row, Col) := C(Row, Col) + A(Row, K) * B(K, Col);
         end loop;
      end Start_Row_Col;         
   end MatrixMult_Task;
   
   MatrixMults : array (1..SIZE, 1..SIZE) of MatrixMult_Task;

   procedure MatMult(A : in Matrix_Type; B : in Matrix_Type; C : out Matrix_Type) is
   begin
      for I in 1..SIZE loop
         for J in 1..SIZE loop
            MatrixMults(I, J).Start_Row_Col(A, B, C, I, J);
         end loop;
      end loop;
   end MatMult;

end MatrixMult;


