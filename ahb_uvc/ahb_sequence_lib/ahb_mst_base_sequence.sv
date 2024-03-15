////////////////////////////////////////////////////////////////////////
// Developer Name : Mohsan Naeem
// Contact info   : mohsannaeem1576@gmail.com
// Module Name    : ahb_mst_base_sequence
// Description    : Dummy Base Sequence which can be used to create new base  Sequence
///////////////////////////////////////////////////////////////////////
class ahb_mst_base_sequence extends uvm_sequence#(ahb_mst_seq_item);

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_mst_base_sequence)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_mst_base_sequence");
    super.new(name);
  endfunction : new
  task body ();
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
      hburst == SINGLE;
      htrans == NON_SEQ;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_mst_base_sequence

class ahb_write_sequence extends ahb_mst_base_sequence; 
/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_write_sequence)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_write_sequence");
    super.new(name);
  endfunction : new
  task body ();
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
      hburst == SINGLE;
      htrans == NON_SEQ;
      wr_access == WRITE;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_write_sequence

class ahb_read_sequence extends ahb_mst_base_sequence; 

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_read_sequence)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_read_sequence");
    super.new(name);
  endfunction : new
  task body ();
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
      hburst == SINGLE;
      htrans == NON_SEQ;
      wr_access == READ;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_read_sequence
class ahb_idle_write_sequence extends ahb_mst_base_sequence; 
/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_idle_write_sequence)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_idle_write_sequence");
    super.new(name);
  endfunction : new
  task body ();
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
      hburst == SINGLE;
      htrans == IDLE;
      wr_access == WRITE;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_idle_write_sequence

class ahb_idle_read_sequence extends ahb_mst_base_sequence; 

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_idle_read_sequence)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_idle_read_sequence");
    super.new(name);
  endfunction : new
  task body ();
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
      hburst == SINGLE;
      htrans == IDLE;
      wr_access == READ;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_idle_read_sequence

class ahb_byte_write_seq extends ahb_mst_base_sequence; 

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_byte_write_seq)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_byte_write_seq");
    super.new(name);
  endfunction : new
  task body ();
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
                                      hburst    == SINGLE;
                                      htrans    == NON_SEQ;
                                      wr_access == WRITE;
                                      hsize     == BYTE;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_byte_write_seq

class ahb_byte_read_seq extends ahb_mst_base_sequence; 

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_byte_read_seq)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/;
    // Constructor
  function new(string name = "ahb_byte_read_seq");
    super.new(name);
  endfunction : new
  task body ();
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
                                      hburst    == SINGLE;
                                      htrans    == NON_SEQ;
                                      wr_access == READ;
                                      hsize     == BYTE;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_byte_read_seq

class ahb_halfword_write_seq extends ahb_mst_base_sequence; 

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_halfword_write_seq)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_halfword_write_seq");
    super.new(name);
  endfunction : new
  task body ();
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
                                      hburst    == SINGLE;
                                      htrans    == NON_SEQ;
                                      wr_access == WRITE;
                                      hsize     == HALF_WORD;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_halfword_write_seq

class ahb_halfword_read_seq extends ahb_mst_base_sequence; 

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_halfword_read_seq)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_halfword_read_seq");
    super.new(name);
  endfunction : new
  task body ();
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
                                      hburst    == SINGLE;
                                      htrans    == NON_SEQ;
                                      wr_access == READ;
                                      hsize     == HALF_WORD;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_halfword_read_seq

class ahb_world_write_seq extends ahb_mst_base_sequence; 

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_world_write_seq)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_world_write_seq");
    super.new(name);
  endfunction : new
  task body ();
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
                                      hburst    == SINGLE;
                                      htrans    == NON_SEQ;
                                      wr_access == WRITE;
                                      hsize     == WORD;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_world_write_seq

class ahb_world_read_seq extends ahb_mst_base_sequence; 

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_world_read_seq)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_world_read_seq");
    super.new(name);
  endfunction : new
  task body ();
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
                                      hburst    == SINGLE;
                                      htrans    == NON_SEQ;
                                      wr_access == READ;
                                      hsize     == WORD;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_world_read_seq

class ahb_doubleword_write_seq extends ahb_mst_base_sequence; 

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_doubleword_write_seq)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_doubleword_write_seq");
    super.new(name);
  endfunction : new
  task body ();
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
                                      hburst    == SINGLE;
                                      htrans    == NON_SEQ;
                                      wr_access == WRITE;
                                      hsize     == DOUBLE_WORD;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_doubleword_write_seq
class ahb_doubleword_read_seq extends ahb_mst_base_sequence; 

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_doubleword_read_seq)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_doubleword_read_seq");
    super.new(name);
  endfunction : new
  task body ();
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
                                      hburst    == SINGLE;
                                      htrans    == NON_SEQ;
                                      wr_access == READ;
                                      hsize     == DOUBLE_WORD;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_doubleword_read_seq

class ahb_quadword_write_seq extends ahb_mst_base_sequence; 

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_quadword_write_seq)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_quadword_write_seq");
    super.new(name);
  endfunction : new
  task body ();
    int i;
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
                                      hburst    == SINGLE;
                                      htrans    == NON_SEQ;
                                      wr_access == WRITE;
                                      hsize     == QUAD_WORD;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_quadword_write_seq
class ahb_quadword_read_seq extends ahb_mst_base_sequence; 

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_quadword_read_seq)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_quadword_read_seq");
    super.new(name);
  endfunction : new
  task body ();
    int i;
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
                                      hburst    == SINGLE;
                                      htrans    == NON_SEQ;
                                      wr_access == READ;
                                      hsize     == QUAD_WORD;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_quadword_read_seq
class ahb_word8_write_seq extends ahb_mst_base_sequence; 

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_word8_write_seq)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_word8_write_seq");
    super.new(name);
  endfunction : new
  task body ();
    int i;
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
                                      hburst    == SINGLE;
                                      htrans    == NON_SEQ;
                                      wr_access == WRITE;
                                      hsize     == WORD_8;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_word8_write_seq
class ahb_word8_read_seq extends ahb_mst_base_sequence; 

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_word8_read_seq)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_word8_read_seq");
    super.new(name);
  endfunction : new
  task body ();
    int i;
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
                                      hburst    == SINGLE;
                                      htrans    == NON_SEQ;
                                      wr_access == READ;
                                      hsize     == WORD_8;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_word8_read_seq
class ahb_word16_write_seq extends ahb_mst_base_sequence; 

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_word16_write_seq)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_word16_write_seq");
    super.new(name);
  endfunction : new
  task body ();
    int i;
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
                                      hburst    == SINGLE;
                                      htrans    == NON_SEQ;
                                      wr_access == WRITE;
                                      hsize     == WORD_16;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_word16_write_seq

class ahb_word16_read_seq extends ahb_mst_base_sequence; 

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_word16_read_seq)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_word16_read_seq");
    super.new(name);
  endfunction : new
  task body ();
    int i;
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
                                      hburst    == SINGLE;
                                      htrans    == NON_SEQ;
                                      wr_access == READ;
                                      hsize     == WORD_16;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_word16_read_seq
class ahb_word32_write_seq extends ahb_mst_base_sequence; 

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_word32_write_seq)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_word32_write_seq");
    super.new(name);
  endfunction : new
  task body ();
    int i;
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
                                      hburst    == SINGLE;
                                      htrans    == NON_SEQ;
                                      wr_access == WRITE;
                                      hsize     == WORD_32;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_word32_write_seq
class ahb_word32_read_seq extends ahb_mst_base_sequence; 

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_word32_read_seq)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_word32_read_seq");
    super.new(name);
  endfunction : new
  task body ();
    int i;
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    start_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.randomize() with{
                                      hburst    == SINGLE;
                                      htrans    == NON_SEQ;
                                      wr_access == READ;
                                      hsize     == WORD_32;};
    finish_item(ahb_mst_seq_itm);
    ahb_mst_seq_itm.print();
    if(!ahb_mst_seq_itm.wr_access)
      `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    wait(resp_count != 1);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_word32_read_seq


class ahb_incr_burst_write_seq extends ahb_mst_base_sequence; 

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
  ahb_mst_seq_item ahb_mst_seq_itm;
  int resp_count = 0;
  int no_of_beat = 5;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_object_utils(ahb_incr_burst_write_seq)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
  // Constructor
  function new(string name = "ahb_incr_burst_write_seq");
    super.new(name);
  endfunction : new
  task body ();
    int i;
    ahb_mst_seq_itm=ahb_mst_seq_item #(32,32)::type_id::create("ahb_mst_seq_itm");
    use_response_handler(1);
    for(int i = 0 ;i< no_of_beat ; i++) begin 
      start_item(ahb_mst_seq_itm);
      ahb_mst_seq_itm.randomize() with{
                                        hburst    == INCR;
                                        (i==0) ? (htrans == SEQ) : (htrans == NON_SEQ );
                                        wr_access == WRITE;
                                        hsize     == WORD;};
      finish_item(ahb_mst_seq_itm);
      ahb_mst_seq_itm.print();
      if(!ahb_mst_seq_itm.wr_access)
        `uvm_info(get_type_name(),$sformatf("Read Response %0h",ahb_mst_seq_itm.rdata),UVM_MEDIUM);
    end
    wait(resp_count != no_of_beat);
  endtask : body
  function void response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(),"Recieved the response from driver",UVM_MEDIUM);
    resp_count++;
  endfunction : response_handler
endclass : ahb_incr_burst_write_seq
















