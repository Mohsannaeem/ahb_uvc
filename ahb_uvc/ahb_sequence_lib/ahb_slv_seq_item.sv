////////////////////////////////////////////////////////////////////////
// Developer Name : Mohsan Naeem 
// Contact info   : mohsannaeem1576@gmail.com
// Module Name    : ahb_slv_seq_item
// Description    : Dummy seq_item which can be used to create new seq_item
///////////////////////////////////////////////////////////////////////
class ahb_slv_seq_item extends uvm_sequence_item;

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  logic [31:0] address; 
  logic [ 2:0] hburst; 
  logic [ 1:0] htrans; 
  logic [ 2:0] hsize; 
  logic [ 3:0] hprot;
  logic        wr_access; 
  logic [31:0] wdata;
  rand logic [31:0] rdata;

/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
	// Provide implementations of virtual methods such as get_type_name and create
	`uvm_object_utils(ahb_slv_seq_item)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
	// Constructor
	function new(string name="ahb_slv_seq_item");
		super.new(name);
	endfunction : new

function void do_copy(uvm_object rhs);
	ahb_slv_seq_item rhs_;
	if(!$cast(rhs_,rhs))
	begin
			`uvm_error("do_copy","Cast Failed");
			return ;
	end
	super.do_copy(rhs_);
  address   <= rhs_.address ;
  hburst    <= rhs_.hburst ;
  htrans    <= rhs_.htrans ;
  hsize     <= rhs_.hsize ;
  hprot     <= rhs_.hprot ;
  wr_access <= rhs_.wr_access ;
  wdata     <= rhs_.wdata ;
	rdata     <= rhs_.rdata ;
endfunction
function bit do_compare(uvm_object rhs, uvm_comparer comparer);
	ahb_slv_seq_item rhs_;
	if(!$cast(rhs_,rhs)) begin
		`uvm_error("do_compare","Cast Failed");
		return 0 ;
	end
	return(super.do_compare(rhs_,comparer) &&
        (address   == rhs_.address) && 
        (hburst    == rhs_.hburst) && 
        (htrans    == rhs_.htrans) && 
        (hsize     == rhs_.hsize) && 
        (hprot     == rhs_.hprot) && 
        (wr_access == rhs_.wr_access) && 
        (wdata     == rhs_.wdata) && 
        (rdata     == rhs_.rdata));
endfunction
function string convert2string();
	string str;
	str  =	super.convert2string();
  $sformatf(str,"%s\n Rdata \t%0h\n",str,rdata);
	$sformatf(str,"%s\n address \t%0h\n hburst \t%0h\n htrans \t%b\n hsize \t%0h\n hprot \t%0b\n wr_access \t%d\n wdata \t%d\n rdata \t%d\n",
						str,address,hburst,htrans,hsize,hprot,wr_access,wdata,rdata);
	return str;
endfunction
function void do_print(uvm_printer printer);
	$display(convert2string());
endfunction
function void do_record(uvm_recorder recorder);
	super.do_record(recorder);
	`uvm_record_field("address",address)
  `uvm_record_field("address",address)
  `uvm_record_field("hburst",hburst)
  `uvm_record_field("htrans",htrans)
  `uvm_record_field("hsize",hsize)
  `uvm_record_field("hprot",hprot)
  `uvm_record_field("wr_access",wr_access)
  `uvm_record_field("wdata",wdata)
  `uvm_record_field("rdata",rdata)
  endfunction
endclass : ahb_slv_seq_item