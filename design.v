// Design for serial parity detector

module parity_dec(x,clk,z);

     input x,clk;
     output reg z;
     reg even_odd;

     parameter EVEN = 0,ODD = 1;

    always @(posedge clk)begin

        case (even_odd)

            EVEN: begin
                z <= x? 1:0;
                even_odd <= x?ODD:EVEN;
            end

            ODD:begin
                z<=x?0:1;    
                even_odd <= x?EVEN:ODD;
            end

        default:even_odd <= EVEN;
    endcase

    end
  
  always @(even_odd)begin
    case(even_odd)
      EVEN:z = 0;
      ODD:z = 1;
    endcase
  end

endmodule
