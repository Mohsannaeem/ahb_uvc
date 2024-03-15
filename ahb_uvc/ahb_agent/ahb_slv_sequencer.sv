////////////////////////////////////////////////////////////////////////
// Developer Name : Mohsan Naeem 
// Contact info   : mohsannaeem1576@gmail.com
// Module Name    : ahb_slv_sequencer
// Description    : Dummy sequencer which can be used to create new sequencer
///////////////////////////////////////////////////////////////////////
class ahb_slv_sequencer extends  uvm_sequencer#(ahb_slv_seq_item);

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
	

/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
	// Provide implementations of virtual methods such as get_type_name and create
	`uvm_component_utils(ahb_slv_sequencer)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
	// Constructor
	function new(string name = "ahb_slv_sequencer", uvm_component parent=null);
		super.new(name, parent);
	endfunction : new

endclass : ahb_slv_sequencer