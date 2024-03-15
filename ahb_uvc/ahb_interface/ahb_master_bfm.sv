interface ahb_master_bfm (ahb_intf ahb_if);
  task wait_for_reset();
    wait(ahb_if.HRESETn);
  endtask : wait_for_reset
  task init_zeros();
    ahb_if.HADDR      <= 0;
    ahb_if.HBURST     <= 0;
    ahb_if.HMASTLOCK  <= 0;
    ahb_if.HPROT      <= 0;
    ahb_if.HSIZE      <= 0;
    ahb_if.HTRANS     <= 0;
    ahb_if.HWDATA     <= 0;
  endtask : init_zeros
 task access_phase(input logic [31:0] addr,
                   input logic [ 1:0] htrans,     
                   input logic [ 2:0] hburst,     
                   input logic [ 2:0] hsize,      
                   input logic [ 3:0] hprot,      
                   input logic        hmaslock,   
                   input logic        wr_access);
   //Access Phase 
    @(posedge ahb_if.HCLK);
    ahb_if.HADDR      <= addr;
    ahb_if.HWRITE     <= wr_access;
    ahb_if.HTRANS     <= htrans;
    ahb_if.HBURST     <= hburst;
    ahb_if.HSIZE      <= hsize;
    ahb_if.HPROT      <= hprot;
    ahb_if.HMASTLOCK  <= hmaslock;
    wait(ahb_if.HREADYOUT); 
 endtask : access_phase
 task data_phase(input  logic [31:0] wdata,       
                 output logic [31:0] rdata);
   //Data Phase
    @(posedge ahb_if.HCLK);
    wait(ahb_if.HREADYOUT); 
    ahb_if.HWDATA     <= wdata;
    rdata             = ahb_if.HRDATA;
    //TODO handle response here
    $display("Read Data %0h",rdata);
 endtask : data_phase
endinterface