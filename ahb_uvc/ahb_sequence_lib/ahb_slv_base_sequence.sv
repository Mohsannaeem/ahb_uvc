////////////////////////////////////////////////////////////////////////
// Developer Name : Mohsan Naeem 
// Contact info   : mohsannaeem1576@gmail.com
// Module Name    : ahb_slv_base_sequence
// Description    : Dummy Base Sequence which can be used to create new base  Sequence
///////////////////////////////////////////////////////////////////////
class ahb_slv_base_sequence extends uvm_sequence#(ahb_slv_seq_item);

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
	ahb_slv_seq_item ahb_slv_seq_itm;

/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
	// Provide implementations of virtual methods such as get_type_name and create
	`uvm_object_utils(ahb_slv_base_sequence)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
	// Constructor
	function new(string name = "ahb_slv_base_sequence");
		super.new(name);
	endfunction : new
	task body ();
		ahb_slv_seq_itm=ahb_slv_seq_item::type_id::create("ahb_slv_seq_itm");
		start_item(ahb_slv_seq_itm);
		finish_item(ahb_slv_seq_itm);
	endtask : body

endclass : ahb_slv_base_sequence