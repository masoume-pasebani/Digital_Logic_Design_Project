`include "traffic_controller.v"
module Traffic_Controller_TB();
      reg clk;
      reg reset;
      wire [2:0] light_A;
      wire [2:0] light_B;

      Traffic_Controller T_C(light_A,light_B,clk,reset);
      
     
endmodule
