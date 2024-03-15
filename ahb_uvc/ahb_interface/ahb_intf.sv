////////////////////////////////////////////////////////////////////////
// Developer Name : Mohsan Naeem 
// Contact info   : mohsannaeem1576@gmail.com
// Module Name    : ahb_intf
// Description    : AHB interface which can be used to create new interface
///////////////////////////////////////////////////////////////////////
interface ahb_intf(input HCLK,input HRESETn);
  logic [31:0]  HADDR;
  logic [ 2:0]  HBURST;
  logic         HMASTLOCK;
  logic [ 3:0]  HPROT;
  logic [ 2:0]  HSIZE;
  logic [ 1:0]  HTRANS;
  logic [31:0]  HWDATA;
  logic         HWRITE;
  // AHB Slave Drived Signals
  logic [31:0]  HRDATA;
  logic         HREADYOUT;
  logic         HRESP;
endinterface