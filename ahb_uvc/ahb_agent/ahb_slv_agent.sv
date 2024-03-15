////////////////////////////////////////////////////////////////////////
// Developer Name : Mohsan Naeem 
// Contact info   : mohsannaeem1576@gmail.com
// Module Name    : ahb_slv_agent
// Description    : Dummy Agent which can be used to create new agent
///////////////////////////////////////////////////////////////////////

class ahb_slv_agent extends uvm_agent;
	/****************************************************************/
	//	Factory Registeration 
	/****************************************************************/
	`uvm_component_utils(ahb_slv_agent)
	
	/****************************************************************/
	//	Variable Handlers
	/*******************************M*********************************/
	ahb_slv_driver 				ahb_slv_drv;
	ahb_slv_sequencer			ahb_slv_sqr;
	// ahb_slv_monitor				ahb_slv_mntr;
	ahb_slv_agent_config	slv_agnt_cfg;
	/****************************************************************/
	//	Default Contructor
	/****************************************************************/
	function new(string name="ahb_slv_agent",uvm_component parent =null);
		super.new(name,parent);
	endfunction
	/****************************************************************/
	//	Build phase 
	/****************************************************************/
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		ahb_slv_sqr 	= ahb_slv_sequencer::type_id::create("ahb_slv_sqr",this);
		ahb_slv_drv 	= ahb_slv_driver::type_id::create("ahb_slv_drv",this);
		// ahb_slv_mntr	= ahb_slv_monitor::type_id::create("ahb_slv_mntr",this);
		if(!uvm_config_db#(ahb_slv_agent_config)::get(this, "", "slv_agnt_cfg",slv_agnt_cfg))
       `uvm_fatal(get_type_name(),"Unable to get slave config "); 
		ahb_slv_drv.ahb_slv_bfm =slv_agnt_cfg.ahb_slv_bfm;  
	endfunction: build_phase
	/****************************************************************/
	//	Connect Phase
	/****************************************************************/
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		// if(ahb_slv_agnt_cfg.is_active == 1)
		begin
			ahb_slv_drv.seq_item_port.connect(ahb_slv_sqr.seq_item_export);
		end
	endfunction: connect_phase

endclass : ahb_slv_agent
