////////////////////////////////////////////////////////////////////////
// Developer Name : Mohsan Naeem 
// Contact info   : mohsannaeem1576@gmail.com
// Module Name    : ahb_test_pkg
// Description    : Base Test which can be used a example uvc
///////////////////////////////////////////////////////////////////////
class ahb_base_test extends uvm_test;
/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
ahb_env               env;	
ahb_env_config        env_cfg;
ahb_incr_burst_write_seq ahb_incr_burst_write_seq_h;
ahb_slv_base_sequence ahb_slv_base_seq;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
// Provide implementations of virtual methods such as get_type_name and create
`uvm_component_utils(ahb_base_test)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
// Constructor
function new(string name = "ahb_base_test", uvm_component parent=null);
	super.new(name, parent);
endfunction : new

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	env = ahb_env::type_id::create("env",this);
	env_cfg=ahb_env_config::type_id::create("env_config",this);
  ahb_incr_burst_write_seq_h = ahb_incr_burst_write_seq::type_id::create("ahb_incr_burst_write_seq_h");
  ahb_slv_base_seq = ahb_slv_base_sequence::type_id::create("ahb_slv_base_seq");
  set_env_config(env_cfg);
endfunction : build_phase

task run_phase(uvm_phase phase);
  phase.raise_objection(this);
	super.run_phase(phase);
	fork
  begin 
    fork
     begin 
      ahb_incr_burst_write_seq_h.start(env.ahb_mst_agnt.ahb_mst_sqr);
     end  
    begin 
     `uvm_info(get_type_name(),"Waiting for time as item done",UVM_MEDIUM);
     ahb_slv_base_seq.start(env.ahb_slv_agnt.ahb_slv_sqr);
    end
   join
  end  
  begin 
    #100ns;
    `uvm_error("AHB Base Test","Watchdog timer timeout");
  end 
  join_any
  `uvm_info(get_type_name(),"AHb_base test phase ready to droped",UVM_MEDIUM);
  phase.drop_objection(this);
endtask : run_phase

function void set_env_config (ahb_env_config env_cfg);
  uvm_config_db#(virtual ahb_master_bfm)::get(this, "", "ahb_mst_bfm",env_cfg.mst_agnt_cfg.ahb_mst_bfm);
  uvm_config_db#(virtual ahb_slave_bfm)::get(this, "", "ahb_slv_bfm",env_cfg.slv_agnt_cfg.ahb_slv_bfm);
  uvm_config_db#(ahb_env_config)::set(this,"env", "env_cfg",env_cfg );
endfunction : set_env_config
endclass : ahb_base_test
