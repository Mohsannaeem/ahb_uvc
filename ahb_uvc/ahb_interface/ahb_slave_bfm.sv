interface ahb_slave_bfm (ahb_intf ahb_if);
  
  task wait_for_reset();
    wait(ahb_if.HRESETn);
  endtask : wait_for_reset

  task init_zeros();
    ahb_if.HRDATA    <= 0;
    ahb_if.HREADYOUT <= 0;
    ahb_if.HRESP     <= 0;
  endtask : init_zeros
  task address_phase(output bit [31:0] address,
                     output bit [ 1:0] htrans,
                     output bit [ 2:0] hburst,
                     output bit [ 2:0] hsize, 
                     output bit [ 3:0] hprot,
                     output bit        wr_access);
    address   <= ahb_if.HADDR       ;
    htrans    <= ahb_if.HTRANS      ;
    hburst    <= ahb_if.HBURST      ;
    hsize     <= ahb_if.HSIZE       ;
    hprot     <= ahb_if.HPROT       ;
    wr_access <= ahb_if.HWRITE      ;
    @(posedge ahb_if.HCLK);
  endtask : address_phase
  task data_phase(input bit  [31:0] rdata,
                  output bit [31:0] wdata);
    ahb_if.HREADYOUT <=1;
    ahb_if.HRESP     <=0;
    if(ahb_if.HWRITE)
      wdata <= ahb_if.HWDATA;  
    else 
      ahb_if.HRDATA    <=rdata;
  endtask : data_phase
 
  task drive_temp(input bit [31:0] rdata);
    ahb_if.HREADYOUT <=1;
    ahb_if.HRESP     <=0;
    ahb_if.HRDATA    <=rdata;
  endtask : drive_temp
endinterface