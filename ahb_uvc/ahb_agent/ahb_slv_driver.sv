////////////////////////////////////////////////////////////////////////
// Developer Name : Mohsan Naeem 
// Contact info   : mohsannaeem1576@gmail.com
// Module Name    : ahb_slv_driver
// Description    : Dummy Driver which can be used to create new driver
///////////////////////////////////////////////////////////////////////
class ahb_slv_driver extends  uvm_driver#(ahb_slv_seq_item);
`uvm_component_utils(ahb_slv_driver)

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
logic [31:0] wdata;
virtual interface ahb_slave_bfm ahb_slv_bfm;
ahb_slv_seq_item ahb_slv_item;
semaphore pipeline_sem = new(1);
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
// Constructor
function new(string name="ahb_slv_driver",uvm_component parent=null);
	super.new(name,parent);
endfunction
function void build_phase (uvm_phase phase);
	super.build_phase(phase);
  if(ahb_slv_bfm ==null) 
	 if(!uvm_config_db#(virtual ahb_slave_bfm)::get(this,"","ahb_slv_bfm",ahb_slv_bfm))
      `uvm_fatal(get_type_name(),"Unable to get slave_bfm from uvm_config_db")
endfunction : build_phase 
task run_phase(uvm_phase phase);
	super.run_phase(phase);
	ahb_slv_bfm.init_zeros();
  ahb_slv_bfm.wait_for_reset();
	fork
    begin
      forever 
    	begin 
        pipeline_sem.get();
    		seq_item_port.get(ahb_slv_item);
    		ahb_slv_item.print();
        ahb_slv_bfm.address_phase(ahb_slv_item.address,
                                  ahb_slv_item.htrans,
                                  ahb_slv_item.hburst,
                                  ahb_slv_item.hsize,
                                  ahb_slv_item.hprot,
                                  ahb_slv_item.wr_access);
        pipeline_sem.put();
        if(ahb_slv_item.htrans != 2'b00 || ahb_slv_item.htrans != 2'b01)
          ahb_slv_bfm.data_phase(ahb_slv_item.rdata,ahb_slv_item.wdata);
        else
          ahb_slv_bfm.data_phase(32'hDEADCAFE,wdata);    
        seq_item_port.put(ahb_slv_item);
    	end
    end
    begin
      forever 
      begin 
        pipeline_sem.get();
        seq_item_port.get(ahb_slv_item);
        ahb_slv_item.print();
        ahb_slv_bfm.address_phase(ahb_slv_item.address,
                                  ahb_slv_item.htrans,
                                  ahb_slv_item.hburst,
                                  ahb_slv_item.hsize,
                                  ahb_slv_item.hprot,
                                  ahb_slv_item.wr_access);
        pipeline_sem.put();
        if(ahb_slv_item.htrans != 2'b00 || ahb_slv_item.htrans != 2'b01)
          ahb_slv_bfm.data_phase(ahb_slv_item.rdata,ahb_slv_item.wdata);
        else
          ahb_slv_bfm.data_phase(32'hDEADCAFE,wdata);    
        seq_item_port.put(ahb_slv_item);
      end
    end
    join   
endtask : run_phase

endclass : ahb_slv_driver