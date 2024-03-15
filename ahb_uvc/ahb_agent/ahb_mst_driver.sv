////////////////////////////////////////////////////////////////////////
// Developer Name : Mohsan Naeem 
// Contact info   : mohsannaeem1576@gmail.com
// Module Name    : ahb_mst_driver
// Description    : Dummy Driver which can be used to create new driver
///////////////////////////////////////////////////////////////////////
class ahb_mst_driver extends  uvm_driver#(ahb_mst_seq_item);
`uvm_component_utils(ahb_mst_driver)

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
virtual ahb_master_bfm ahb_mst_bfm;
ahb_mst_seq_item ahb_mst_item;
semaphore pipeline_sem = new(1);
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
// Constructor
function new(string name="ahb_mst_driver",uvm_component parent=null);
	super.new(name,parent);
endfunction
function void build_phase (uvm_phase phase);
	super.build_phase(phase);
  if(ahb_mst_bfm == null) begin 
  	if(!uvm_config_db#(virtual ahb_master_bfm)::get(this,"","ahb_mst_bfm",ahb_mst_bfm))
      `uvm_fatal(get_type_name(),"Unable to get the ahb_master_bfm interface");
  end  
endfunction : build_phase 
task run_phase(uvm_phase phase);
	super.run_phase(phase);
	ahb_mst_bfm.init_zeros();
  ahb_mst_bfm.wait_for_reset();
  //Thead 1 to process first transaction from pipeline
  fork
    begin
      forever
        begin
          pipeline_sem.get();
          `uvm_info(get_type_name(),"Ready to Recieved the Sequence Item to be driver",UVM_MEDIUM);
          seq_item_port.get(ahb_mst_item);
          `uvm_info(get_type_name(),"Access Phase Start",UVM_MEDIUM);
          ahb_mst_bfm.access_phase(.addr(ahb_mst_item.address),
            .htrans(ahb_mst_item.htrans),
            .hburst(ahb_mst_item.hburst),
            .hsize(ahb_mst_item.hsize),
            .hprot(ahb_mst_item.hprot),
            .hmaslock(ahb_mst_item.hmaslock),
            .wr_access(ahb_mst_item.wr_access));
          // ahb_mst_item.print();
          `uvm_info(get_type_name(),"Access Phase Done",UVM_MEDIUM);
          pipeline_sem.put();
          `uvm_info(get_type_name(),"Data Phase Start",UVM_MEDIUM);
          ahb_mst_bfm.data_phase(.wdata(ahb_mst_item.wdata),
            .rdata(ahb_mst_item.rdata));
          seq_item_port.put(ahb_mst_item);
          `uvm_info(get_type_name(),"Data Phase Done",UVM_MEDIUM);
          `uvm_info(get_type_name(),"Sequence Item Done ",UVM_MEDIUM);
        end //forever ends there
      end
    begin
      forever
        begin
          pipeline_sem.get();
          `uvm_info(get_type_name(),"Thread 2 Ready to  Recieved the Sequence Item to be driver",UVM_MEDIUM);
          seq_item_port.get(ahb_mst_item);
          `uvm_info(get_type_name(),"Thread 2 Access Phase Start",UVM_MEDIUM);
          ahb_mst_bfm.access_phase(.addr(ahb_mst_item.address),
            .htrans(ahb_mst_item.htrans),
            .hburst(ahb_mst_item.hburst),
            .hsize(ahb_mst_item.hsize),
            .hprot(ahb_mst_item.hprot),
            .hmaslock(ahb_mst_item.hmaslock),
            .wr_access(ahb_mst_item.wr_access));
          `uvm_info(get_type_name(),"Thread 2 Access Phase Done",UVM_MEDIUM);
          // ahb_mst_item.print();
          pipeline_sem.put();
          `uvm_info(get_type_name(),"Thread 2 Data Phase Start",UVM_MEDIUM);
          ahb_mst_bfm.data_phase(.wdata(ahb_mst_item.wdata),.rdata(ahb_mst_item.rdata));
          seq_item_port.put(ahb_mst_item);
          `uvm_info(get_type_name(),"Thread 2 Data Phase Done",UVM_MEDIUM);
          `uvm_info(get_type_name(),"Sequence Item Done ",UVM_MEDIUM);
        end
      end 
      join
endtask : run_phase
  
endclass : ahb_mst_driver