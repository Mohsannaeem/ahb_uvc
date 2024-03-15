////////////////////////////////////////////////////////////////////////
// Developer Name : Mohsan Naeem 
// Contact info   : mohsannaeem1576@gmail.com
// Module Name    : ahb_slv_agent_config
// Description    : Dummy Agent Config which can be used to create new Agent Config
///////////////////////////////////////////////////////////////////////
class ahb_slv_agent_config extends uvm_component;

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
 virtual ahb_slave_bfm ahb_slv_bfm;
 bit is_active;

/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
	// Provide implementations of virtual methods such as get_type_name and create
	`uvm_component_utils(ahb_slv_agent_config)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
	// Constructor
	function new(string name = "ahb_slv_agent_config", uvm_component parent=null);
		super.new(name, parent);
	endfunction : new

endclass : ahb_slv_agent_config