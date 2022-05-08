//decodificador de 7 segmentos
module  decodificador_hep (

//variáveis de input
    input wire [3:0] s_ones,
    input wire [3:0] s_tens,
    input wire [3:0] min,

//variáveis de output
    output wire [6:0] s_ones_segs ,
    output wire [6:0] s_tens_segs ,
    output wire [6:0] min_segs    
);
//atribuindo valores ao output
    assign s_ones_segs =(s_ones == 4'b0000)? 7'b1111110: 
                          (s_ones == 4'b0001)? 7'b0110000: 
                          (s_ones == 4'b0010)? 7'b1101101: 
                          (s_ones == 4'b0011)? 7'b1111001: 
                          (s_ones == 4'b0100)? 7'b0110011: 
                          (s_ones == 4'b0101)? 7'b1011011: 
                          (s_ones == 4'b0110)? 7'b1011111: 
                          (s_ones == 4'b0111)? 7'b1110000: 
                          (s_ones == 4'b1000)? 7'b1111111: 
                          (s_ones == 4'b1001)? 7'b1110011: 
                          8'bXXXX_XXXX ;


    assign s_tens_segs =(s_tens == 4'b0000)? 7'b1111110: 
                          (s_tens == 4'b0001)? 7'b0110000: 
                          (s_tens == 4'b0010)? 7'b1101101: 
                          (s_tens == 4'b0011)? 7'b1111001: 
                          (s_tens == 4'b0100)? 7'b0110011: 
                          (s_tens == 4'b0101)? 7'b1011011: 
                          (s_tens == 4'b0110)? 7'b1011111: 
                          (s_tens == 4'b0111)? 7'b1110000: 
                          (s_tens == 4'b1000)? 7'b1111111: 
                          (s_tens == 4'b1001)? 7'b1110011: 
                          8'bXXXX_XXXX ;


    assign min_segs =     (min == 4'b0000)? 7'b1111110: 
                          (min == 4'b0001)? 7'b0110000: 
                          (min == 4'b0010)? 7'b1101101: 
                          (min == 4'b0011)? 7'b1111001: 
                          (min == 4'b0100)? 7'b0110011: 
                          (min == 4'b0101)? 7'b1011011: 
                          (min == 4'b0110)? 7'b1011111: 
                          (min == 4'b0111)? 7'b1110000:
                          (min == 4'b1000)? 7'b1111111: 
                          (min == 4'b1001)? 7'b1110011: 
                          8'bXXXX_XXXX ; 
    
endmodule
