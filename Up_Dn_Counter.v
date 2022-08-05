

/*
// Module: Up_Dn_Counter.v
// Description: Up_Dn_Counter assignment verilog code //
// Owner : Mohamed Ayman Elsayed 
// Date : 2 August 2022
*/

module Up_Dn_Counter (

    input   wire    [4:0]   IN,
    input   wire            Load,
    input   wire            Up,
    input   wire            Down,
    input   wire            CLK,
    output  wire            High,
    output  reg     [4:0]   Counter,
    output  wire            Low

);

reg     [4:0]   Counter_value;

assign High = ( Counter == 5'd31 );
assign Low  = ( Counter == 5'd0  );


always @( posedge CLK )

    begin
        Counter <= Counter_value;
    end

always @(*) 

    begin

        if ( Load )
            begin
                Counter_value = IN;
            end

        else if ( Down && !Low )
            begin
                Counter_value = Counter - 5'd1;
            end

        else if ( Up && !High )
            begin
                Counter_value = Counter + 5'd1;
            end

        else 
            begin
                Counter_value = Counter;
            end

    end

endmodule