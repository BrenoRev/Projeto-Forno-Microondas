`timescale 1ns/1ps
`include "decodificador.v"

module decodificador_tb();

  reg [3:0] units_sec, tens_sec, minutes ;
  wire [6:0] minutes_segs , units_sec_segs , tens_sec_segs ;
  
  
/*
  module  decoder_hep (

//variáveis input
    input wire [3:0] sec_ones,
    input wire [3:0] sec_tens,
    input wire [3:0] min,

//variáveis output
    output wire [6:0] sec_ones_segs ,
    output wire [6:0] sec_tens_segs ,
    output wire [6:0] min_segs    
);
*/

// instancia o módulo dentro da bancada de teste.

  decodificador_hep DUT(
    .s_ones(units_sec), .s_tens(tens_sec), .min(minutes),
    .s_ones_segs(units_sec_segs) , .s_tens_segs(tens_sec_segs),
    .min_segs(minutes_segs)
  );
  initial
    begin
        
      $dumpfile("decodificador_tb.vcd");//Este arquivo conterá nossa simulação em forma de onda
      $dumpvars(0, decodificador_tb);
      
      // atribuir valores a nossas variáveis reg

      units_sec = 0; tens_sec = 0; minutes = 0;
      
      #10 units_sec = 1; tens_sec = 1; minutes = 0;
      #10 units_sec = 1; tens_sec = 1; minutes = 0;
      #10 units_sec = 1; tens_sec = 1; minutes = 0;
      #10 units_sec = 1; tens_sec = 1; minutes = 0;
      #10 units_sec = 1; tens_sec = 1; minutes = 1;
      #10 units_sec = 1; tens_sec = 1; minutes = 1;
      #10 units_sec = 1; tens_sec = 1; minutes = 1;
      #10 units_sec = 1; tens_sec = 1; minutes = 1;
      
      #10 units_sec = 1; tens_sec = 1; minutes = 0;
      #10 units_sec = 1; tens_sec = 1; minutes = 0;
      #10 units_sec = 1; tens_sec = 1; minutes = 0;
      #10 units_sec = 1; tens_sec = 1; minutes = 0;
      #10 units_sec = 1; tens_sec = 1; minutes = 1;
      #10 units_sec = 1; tens_sec = 1; minutes = 1;
      #10 units_sec = 1; tens_sec = 1; minutes = 1;
      #10 units_sec = 1; tens_sec = 1; minutes = 1;
      
      #10 units_sec = 1; tens_sec = 1; minutes = 1;
      #10 units_sec = 1; tens_sec = 1; minutes = 1;
      #10 units_sec = 1; tens_sec = 1; minutes = 1;
      #10 units_sec = 1; tens_sec = 1; minutes = 1;
      #10 units_sec = 1; tens_sec = 1; minutes = 1;
      #10 units_sec = 1; tens_sec = 0; minutes = 1;
      #10 units_sec = 1; tens_sec = 0; minutes = 1;
      #10 units_sec = 1; tens_sec = 0; minutes = 1;
      
      #10 units_sec = 0; tens_sec = 1; minutes = 1;
      #10 units_sec = 0; tens_sec = 1; minutes = 1;
      #10 units_sec = 0; tens_sec = 1; minutes = 1;
      #10 units_sec = 0; tens_sec = 1; minutes = 1;
      #10 units_sec = 0; tens_sec = 1; minutes = 1;
      #10 units_sec = 1; tens_sec = 1; minutes = 1;
      #10 units_sec = 1; tens_sec = 1; minutes = 1;
      #10 units_sec = 1; tens_sec = 1; minutes = 1;
      
      #10 units_sec = 1; tens_sec = 1; minutes = 1;
      #50 units_sec = 0; tens_sec = 1; minutes = 1;
      #5  units_sec = 1; tens_sec = 1; minutes = 1; 
      #50 units_sec = 1; tens_sec = 1; minutes = 1; 
      #50 units_sec = 1; tens_sec = 1; minutes = 1;  

    end

endmodule
