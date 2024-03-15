////////////////////////////////////////////////////////////////////////
// Developer Name : Mohsan Naeem 
// Contact info   : mohsannaeem1576@gmail.com
// Module Name    : ahb_mst_agent
// Description    : Dummy Agent which can be used to create new agent
///////////////////////////////////////////////////////////////////////

class ahb_mst_agent extends uvm_agent;
	/****************************************************************/
	//	Factory Registeration 
	/****************************************************************/
	`uvm_component_utils(ahb_mst_agent)
	
	/****************************************************************/
	//	Variable Handlers
	/****************************************************************/
	ahb_mst_driver 				ahb_mst_drv;
	ahb_mst_sequencer			ahb_mst_sqr;
	// ahb_mst_monitor				ahb_mst_mntr;
	ahb_mst_agent_config	ahb_mst_agnt_cfg;
	/****************************************************************/
	//	Default Contructor
	/****************************************************************/
	function new(string name="ahb_mst_agent",uvm_component parent =null);
		super.new(name,parent);
	endfunction
	/****************************************************************/
	//	Build phase 
	/****************************************************************/
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		ahb_mst_sqr 	= ahb_mst_sequencer::type_id::create("ahb_mst_sqr",this);
		ahb_mst_drv 	= ahb_mst_driver::type_id::create("ahb_mst_drv",this);
		// ahb_mst_mntr	= ahb_mst_monitor::type_id::create("ahb_mst_mntr",this);
		if(!uvm_config_db#(ahb_mst_agent_config)::get(this, "", "mst_agnt_cfg",ahb_mst_agnt_cfg))
      `uvm_fatal(get_type_name(),"Unable to get agent config from db");
    ahb_mst_drv.ahb_mst_bfm = ahb_mst_agnt_cfg.ahb_mst_bfm;   
	endfunction: build_phase
	/****************************************************************/
	//	Connect Phase
	/****************************************************************/
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		// if(ahb_mst_agnt_cfg.is_active == 1)
		begin
			ahb_mst_drv.seq_item_port.connect(ahb_mst_sqr.seq_item_export);
		end
	endfunction: connect_phase

endclass : ahb_mst_agent
