module Traffic_Controller(light_A,light_B,clk,reset);

    output reg [2:0] light_A;
    output reg [2:0] light_B;
    input clk;
    input reset;

    reg[5:0] states;
    parameter  S0=6'b000001,
               S1=6'b000010,
               S2=6'b000100,
               S3=6'b001000,
               S4=6'b010000,
               S5=6'b100000;


    reg [3:0] ctr;
    parameter SEC6=4'd6,
              SEC1=4'd1;
    
    always @(posedge clk or posedge reset)
                   if(reset==1) 
                    begin
                      states <= S0;
                      ctr <= 0;
                   end 
                 else
                     case(states)
                            S0: if(ctr < SEC6)
                                begin
                                   states <=S0;
                                   ctr <= ctr+1;
                                end 
                              else 
                                begin
                                    states <= S1;
                                    ctr <= 0;
                                end

                             S1: if(ctr < SEC1)
                                 begin
                                    states <= S1;
                                    ctr <= ctr+1;
                                end 
                              else 
                                 begin
                                     states <= S2;
                                     ctr <= 0;
                                end

                             S2: if(ctr < SEC1)
                                 begin
                                    states <= S2;
                                    ctr <= ctr+1;
                                end
                              else 
                                begin
                                     states <= S3;
                                     ctr <= 0;
                                end

                             S3: if(ctr < SEC6)
                                 begin
                                    states <= S3;
                                    ctr <= ctr+1;
                                end 
                              else
                                begin
                                     states <= S4;
                                     ctr <= 0;
                                end

                             S4: if(ctr < SEC1)
                                 begin
                                    states <= S4;
                                    ctr <= ctr+1;
                                end
                              else 
                                begin
                                     states <= S5;
                                     ctr <= 0;
                                end

                             S5: if(ctr < SEC1)
                                 begin
                                    states <= S5;
                                    ctr <= ctr+1;
                                end
                              else 
                                begin
                                     states <= S0;
                                     ctr <= 0;
                                end

                             default states <= S0;

                        endcase
               


               always @(*)
               begin
                   case(states)
                        S0: 
                         begin 
                            light_A <= 3'b001;
                            light_B <= 3'b100; 
                         end

                        S1: 
                         begin 
                            light_A <= 6'b010; 
                            light_B <= 3'b100; 
                         end

                        S2: 
                         begin 
                            light_A <= 6'b100;
                            light_B <= 3'b100; 
                         end

                        S3:
                         begin 
                            light_A <= 6'b100; 
                            light_B <= 3'b001; 
                         end

                        S4: 
                         begin 
                            light_A <= 6'b100;
                            light_B <= 3'b010; 
                         end

                        S5: 
                         begin 
                            light_A <= 6'b100;
                            light_B <= 3'b100;
                         end

                        default 
                          begin 
                             light_A <= 6'b100; 
                             light_B <= 3'b100;
                          end
                    endcase
               end
endmodule 
