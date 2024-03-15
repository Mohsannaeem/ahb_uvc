////////////////////////////////////////////////////////////////////////
// Developer Name : Mohsan Naeem
// Contact info   : mohsannaeem1576@gmail.com
// Module Name    : ahb_mst_seq_item
// Description    : Dummy seq_item which can be used to create new seq_item
///////////////////////////////////////////////////////////////////////
typedef enum bit [1:0] {IDLE,BUSY,NON_SEQ,SEQ} ahb_trans_e;
typedef enum bit [2:0] {SINGLE,INCR,WRAP_4,INCR_4,WRAP_8,INCR_8,WRAP_16,INCR_16} ahb_burst_e;
typedef enum bit [2:0] {BYTE,HALF_WORD,WORD,DOUBLE_WORD,QUAD_WORD,WORD_8,WORD_16,WORD_32} ahb_size_e;
typedef enum bit {READ,WRITE} ahb_wr_acess_e;
class ahb_mst_seq_item #(parameter ADDR_WIDTH=16,DATA_WIDTH=32) extends uvm_sequence_item;

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  rand bit [ADDR_WIDTH-1:0] address   ;// Required for each transaction
  rand ahb_trans_e          htrans    ;// Required for each transaction to predict next trans
  rand ahb_burst_e          hburst    ;// Required for burst
  rand ahb_size_e           hsize     ;// Required for each transaction
  rand bit [ 3:0]           hprot     ;// Required for protection
  rand bit                  hmaslock  ;// Required for Lock
  rand ahb_wr_acess_e       wr_access ;// Required for each transaction
  rand bit [DATA_WIDTH-1:0] wdata     ;// Required for each transaction
  bit      [DATA_WIDTH-1:0] rdata     ; // Required for Read Data
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
// Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_mst_seq_item)

  constraint htrans_c {
      htrans inside{IDLE,BUSY,NON_SEQ,SEQ};
  }
  constraint hsize_c{
      hsize <= $clog2(DATA_WIDTH);
  }
  constraint hburst_c{
    hburst inside{SINGLE,INCR,WRAP_4,INCR_4,WRAP_8,INCR_8,WRAP_16,INCR_16};
  }
/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
// Constructor
  function new(string name="ahb_mst_seq_item");
    super.new(name);
  endfunction : new

  function void do_copy(uvm_object rhs);
    ahb_mst_seq_item rhs_;
    if(!$cast(rhs_,rhs))
      begin
        `uvm_error("do_copy","Cast Failed");
        return ;
      end
    super.do_copy(rhs_);
    address   = rhs_.address;
    htrans    = rhs_.htrans;
    hburst    = rhs_.hburst;
    hsize     = rhs_.hsize;
    hprot     = rhs_.hprot;
    hmaslock  = rhs_.hmaslock;
    wdata     = rhs_.wdata;
    wr_access = rhs_.wr_access;
    rdata     = rhs_.rdata;
  endfunction
  function bit do_compare(uvm_object rhs, uvm_comparer comparer);
    ahb_mst_seq_item rhs_;
    if(!$cast(rhs,rhs)) begin
      `uvm_error("do_compare","Cast Failed");
      return 0 ;
    end
    return(super.do_compare(rhs,comparer)&&
      (address   == rhs_.address)&&
      (htrans    == rhs_.htrans)&&
      (hburst    == rhs_.hburst)&&
      (hsize     == rhs_.hsize)&&
      (hprot     == rhs_.hprot)&&
      (hmaslock  == rhs_.hmaslock)&&
      (wdata     == rhs_.wdata)&&
      (wr_access == rhs_.wr_access)&&
      (rdata     == rhs_.rdata));
  endfunction
  function string convert2string();
    string str;
    str  =  super.convert2string();
    $sformat(str," %s\n address \t%0h\n htrans \t%0h\n hburst \t%b\n hsize \t%0h\n hprot \t%0b\n hmaslock \t%h\n wdata \t%h\n wr_access \t%h\n rdata \t%h\n",
      str,address, htrans, hburst, hsize , hprot , hmaslock, wdata , wr_access, rdata );
    return str;
  endfunction
  function void do_print(uvm_printer printer);
    $display(convert2string());
  endfunction
  function void do_record(uvm_recorder recorder);
    super.do_record(recorder);
    `uvm_record_field("address",address)
    `uvm_record_field("htrans",htrans)
    `uvm_record_field("hburst",hburst)
    `uvm_record_field("hsize",hsize)
    `uvm_record_field("hprot",hprot)
    `uvm_record_field("hmaslock",hmaslock)
    `uvm_record_field("wdata",wdata)
    `uvm_record_field("wr_access",wr_access)
    `uvm_record_field("rdata",rdata)
  endfunction
endclass : ahb_mst_seq_item