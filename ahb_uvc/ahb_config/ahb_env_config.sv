////////////////////////////////////////////////////////////////////////
// Developer Name : Mohsan Naeem 
// Contact info   : mohsannaeem1576@gmail.com
// Module Name    : ahb_env_config
// Description    : Dummy config which can be used to create new config
///////////////////////////////////////////////////////////////////////
class ahb_env_config extends  uvm_component;

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
	uvm_cmdline_processor cmpld;
  ahb_mst_agent_config mst_agnt_cfg;
  ahb_slv_agent_config slv_agnt_cfg;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
	// Provide implementations of virtual methods such as get_type_name and create
	`uvm_component_utils(ahb_env_config)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
	// Constructor
	function new(string name = "ahb_env_config", uvm_component parent=null);
		super.new(name, parent);
    mst_agnt_cfg = ahb_mst_agent_config::type_id::create("mst_agnt_cfg",this);
    slv_agnt_cfg = ahb_slv_agent_config::type_id::create("slv_agnt_cfg",this);
	endfunction : new
	function void post_randomize();
		cmpld = uvm_cmdline_processor:: get_inst();
		super.post_randomize();
	endfunction : post_randomize 

endclass : ahb_env_config