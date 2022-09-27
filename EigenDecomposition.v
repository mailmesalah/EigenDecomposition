

module EigenDecomposition(
         input Clock,
         input Reset,
         input [7:0] a,
         input [7:0] b,
         input [7:0] c,
         input [7:0] d,
         output reg [15:0] e 
         );
         
reg [7:0]inputM[15:0];
reg [7:0]tnspsM[15:0];
reg [7:0]outptM[15:0];

   initial      
   begin
      inputM[0]= 8'b00000000;
      inputM[1]= 8'b00000000;
      inputM[2]= 8'b00000000;
      inputM[3]= 8'b00000000;
      inputM[4]= 8'b00000000;
      inputM[5]= 8'b00000000;
      inputM[6]= 8'b00000000;
      inputM[7]= 8'b00000000;
      inputM[8]= 8'b00000000;
      inputM[9]= 8'b00000000;
      inputM[10]= 8'b00000000;
      inputM[11]= 8'b00000000;
      inputM[12]= 8'b00000000;
      inputM[13]= 8'b00000000;
      inputM[14]= 8'b00000000;
      inputM[15]= 8'b00000000;       
   end
   
   always@(posedge Clock)
   begin
      if(Reset==1'b1)                                                                                                                                                                                                                                                                                                                           
      begin
        
      end
      else if(Reset==1'b0)
      begin
          //Shifting in Input Data as first row of Input Matrix and shifting out last row of Input Matrix
         inputM[3]= inputM[7];inputM[2]= inputM[6];inputM[1]= inputM[5];inputM[0]= inputM[4];
         inputM[7]= inputM[11];inputM[6]= inputM[10];inputM[5]= inputM[9];inputM[4]= inputM[8];
         inputM[11]= inputM[15];inputM[10]= inputM[14];inputM[9]= inputM[13];inputM[8]= inputM[12];
         inputM[15]= a;inputM[14]= b;inputM[13]= c;inputM[12]= d;
         
         //Finding Transpose of Input Matrix
         tnspsM[15]= inputM[15];tnspsM[14]= inputM[11];tnspsM[13]= inputM[7];tnspsM[12]= inputM[3];
         tnspsM[11]= inputM[14];tnspsM[10]= inputM[10];tnspsM[9]= inputM[6];tnspsM[8]= inputM[2];
         tnspsM[7]= inputM[13];tnspsM[6]= inputM[9];tnspsM[5]= inputM[5];tnspsM[4]= inputM[1];
         tnspsM[3]= inputM[12];tnspsM[2]= inputM[8];tnspsM[1]= inputM[4];tnspsM[0]= inputM[0];
         
         //Input Matrix X Transpose Matrix
         //1st Row
         outptM[15]= (inputM[15]*tnspsM[15])+(inputM[14]*tnspsM[11])+(inputM[13]*tnspsM[7])+(inputM[12]*tnspsM[3]);
         outptM[14]= (inputM[15]*tnspsM[14])+(inputM[14]*tnspsM[10])+(inputM[13]*tnspsM[6])+(inputM[12]*tnspsM[2]);
         outptM[13]= (inputM[15]*tnspsM[13])+(inputM[14]*tnspsM[9])+(inputM[13]*tnspsM[5])+(inputM[12]*tnspsM[1]);
         outptM[12]= (inputM[15]*tnspsM[12])+(inputM[14]*tnspsM[8])+(inputM[13]*tnspsM[4])+(inputM[12]*tnspsM[0]);
         //2nd Row
         outptM[11]= (inputM[11]*tnspsM[15])+(inputM[10]*tnspsM[11])+(inputM[9]*tnspsM[7])+(inputM[8]*tnspsM[3]);
         outptM[10]= (inputM[11]*tnspsM[14])+(inputM[10]*tnspsM[10])+(inputM[9]*tnspsM[6])+(inputM[8]*tnspsM[2]);
         outptM[9]= (inputM[11]*tnspsM[13])+(inputM[10]*tnspsM[9])+(inputM[9]*tnspsM[5])+(inputM[8]*tnspsM[1]);
         outptM[8]= (inputM[11]*tnspsM[12])+(inputM[10]*tnspsM[8])+(inputM[9]*tnspsM[4])+(inputM[8]*tnspsM[0]);
         //3rd Row
         outptM[7]= (inputM[7]*tnspsM[15])+(inputM[6]*tnspsM[11])+(inputM[5]*tnspsM[7])+(inputM[4]*tnspsM[3]);
         outptM[6]= (inputM[7]*tnspsM[14])+(inputM[6]*tnspsM[10])+(inputM[5]*tnspsM[6])+(inputM[4]*tnspsM[2]);
         outptM[5]= (inputM[7]*tnspsM[13])+(inputM[6]*tnspsM[9])+(inputM[5]*tnspsM[5])+(inputM[4]*tnspsM[1]);
         outptM[4]= (inputM[7]*tnspsM[12])+(inputM[6]*tnspsM[8])+(inputM[5]*tnspsM[4])+(inputM[4]*tnspsM[0]);
         //4rth Row
         outptM[3]= (inputM[3]*tnspsM[15])+(inputM[2]*tnspsM[11])+(inputM[1]*tnspsM[7])+(inputM[0]*tnspsM[3]);
         outptM[2]= (inputM[3]*tnspsM[14])+(inputM[2]*tnspsM[10])+(inputM[1]*tnspsM[6])+(inputM[0]*tnspsM[2]);
         outptM[1]= (inputM[3]*tnspsM[13])+(inputM[2]*tnspsM[9])+(inputM[1]*tnspsM[5])+(inputM[0]*tnspsM[1]);
         outptM[0]= (inputM[3]*tnspsM[12])+(inputM[2]*tnspsM[8])+(inputM[1]*tnspsM[4])+(inputM[0]*tnspsM[0]);
      end
   end
endmodule