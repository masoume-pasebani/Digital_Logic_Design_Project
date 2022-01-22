`include "Pasebani_Masoume_99243022_traffic_controller.v"
module Traffic_Controller_TB();
      reg clk;
      reg reset;
      wire [2:0] light_A;
      wire [2:0] light_B;

      Traffic_Controller T_C(light_A,light_B,clk,reset);
      
      initial clk = 1;
      always #(1000000000/2) clk=~clk;
       
      initial begin
      reset =1'b0;
      #1000000000;

      reset =1'b1;
      #1000000000;
      
      reset =1'b0;
      #(1000000000*6);
      
      reset=1'b1;
      #1000000000;
    
      reset=1'b0;
      #(1000000000);

      reset=1'b0;
      #(1000000000);

      $stop;
      end
endmodule
