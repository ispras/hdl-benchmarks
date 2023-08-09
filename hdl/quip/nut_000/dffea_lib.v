`timescale 1 ps / 1 ps

primitive PRIM_GDFF (q, d, clk, ena, clr, pre, ald, adt, sclr, sload );
  input d,clk,ena,clr,pre,ald,adt,sclr,sload;
  output q;
  reg q;
  initial q = 1'b0;

table
  //d,clk, ena,clr,pre,ald,adt,sclr,sload: q : q'
    ? ?    ?   1   ?   ?   ?   ?    ?    : ? : 0; // aclr
    ? ?    ?   0   1   ?   ?   ?    ?    : ? : 1; // apre
    ? ?    ?   0   0   1   0   ?    ?    : ? : 0; // aload 0
    ? ?    ?   0   0   1   1   ?    ?    : ? : 1; // aload 1

    0 (01) 1   0   0   0   ?   0    0    : ? : 0; // din 0
    1 (01) 1   0   0   0   ?   0    0    : ? : 1; // din 1
    ? (01) 1   0   0   0   ?   1    ?    : ? : 0; // sclr
    ? (01) 1   0   0   0   0   0    1    : ? : 0; // sload 0
    ? (01) 1   0   0   0   1   0    1    : ? : 1; // sload 1

    ? ?    0   0   0   0   ?   ?    ?    : ? : -; // no asy no ena
    * ?    ?   ?   ?   ?   ?   ?    ?    : ? : -; // data edges
    ? (?0) ?   ?   ?   ?   ?   ?    ?    : ? : -; // ignore falling clk
    ? ?    *   ?   ?   ?   ?   ?    ?    : ? : -; // enable edges 
    ? ?    ?   (?0)?   ?   ?   ?    ?    : ? : -; // falling asynchs
    ? ?    ?   ?  (?0) ?   ?   ?    ?    : ? : -;
    ? ?    ?   ?   ?  (?0) ?   ?    ?    : ? : -;
    ? ?    ?   ?   ?   0   *   ?    ?    : ? : -; // ignore adata edges when not aloading
    ? ?    ?   ?   ?   ?   ?   *    ?    : ? : -; // sclr edges
    ? ?    ?   ?   ?   ?   ?   ?    *    : ? : -; // sload edges 
endtable
endprimitive

// Obsolete - use dffeas
//module dffs (d, clk, clrn, prn, sclr, sdata, sload, q );
//  input d,clk,clrn,prn, sclr, sdata, sload;
//  output q;
//  wire q;
//  tri0 aload;
//  tri1 prn, clrn;

//  PRIM_GDFF (q,d,clk,1'b1,!clrn,!prn,1'b0,sdata,sclr,sload);
//endmodule

// Collides with atom library def
//module dffe (d, clk, ena, clrn, prn, q );
//  input d,clk,ena,clrn,prn;
//  output q;
//  wire q;
//  tri0 aload;
//  tri1 prn, clrn, ena;

//  PRIM_GDFF (q,d,clk,ena,!clrn,!prn,1'b0,1'b1,1'b0,1'b0);
//endmodule

// Obsolete - use dffeas
//module dffes (d, clk, ena, clrn, prn, sclr, sdata, sload, q );
//  input d,clk,ena,clrn,prn,sdata,sclr,sload;
//  output q;
//  wire q;
//  tri0 aload;
//  tri1 prn, clrn, ena;

//  PRIM_GDFF (q,d,clk,ena,!clrn,!prn,1'b0,sdata,sclr,sload);
//endmodule

module dffea (d, clk, ena, clrn, prn, aload, adata,q );
  input d,clk,ena,clrn,prn,aload,adata;
  output q;
  wire q;
  tri0 aload;
  tri1 prn, clrn, ena;

  reg stalled_adata;
  initial begin
    stalled_adata = adata;
  end

  always @(adata) begin
    #1 stalled_adata = adata;
  end

  PRIM_GDFF (q,d,clk,ena,!clrn,!prn,aload,stalled_adata,1'b0,1'b0);
endmodule

module dffeas (d, clk, ena, clrn, prn, aload, asdata, sclr, sload, q );
  input d,clk,ena,clrn,prn,aload,asdata,sclr,sload;
  output q;
  wire q;
  tri0 aload;
  tri1 prn, clrn, ena;

  reg stalled_adata;
  initial begin
    stalled_adata = asdata;
  end

  always @(asdata) begin
    #1 stalled_adata = asdata;
  end

  PRIM_GDFF (q,d,clk,ena,!clrn,!prn,aload,stalled_adata,sclr,sload);
endmodule

 // #1 $display ("time %d d=%b clk=%b ena=%b clrn=%b pren=%b aload=%b adat=%b sld=%b sclr=%b out=%b",$time,d,clk,ena,clrn,prn,aload,stalled_adata,sload,sclr,q);
