////////////////////////////////////////////////////////////////////////
// Developer Name : Mohsan Naeem 
// Contact info   : mohsannaeem1576@gmail.com
// Module Name    : ahb_tb_top 
// Description    : AHB TB Top to connect the apb master and slave interface
///////////////////////////////////////////////////////////////////////
`timescale 1ps/1fs;
module ahb_tb_top ();
  import uvm_pkg::*;
  import ahb_test_pkg::*;
  logic clk,reset;
  ahb_intf ahb_if(.HCLK(clk),.HRESETn(reset));
  ahb_master_bfm ahb_mst_bfm(ahb_if);
  ahb_slave_bfm  ahb_slv_bfm(ahb_if);
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial begin 
    reset = 0; 
    #10ns
    reset = 1;
  end
  initial begin 
    uvm_config_db#(virtual ahb_master_bfm)::set(null,"uvm_test_top","ahb_mst_bfm",ahb_mst_bfm);
    uvm_config_db#(virtual ahb_slave_bfm)::set(null,"uvm_test_top","ahb_slv_bfm",ahb_slv_bfm);
  end
  initial begin 
    run_test();
  end


endmodule