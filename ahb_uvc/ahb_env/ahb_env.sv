////////////////////////////////////////////////////////////////////////
// Developer Name : Mohsan Naeem 
// Contact info   : mohsannaeem1576@gmail.com
// Module Name    : ahb_env
// Description    : Dummy Env which can be used to create new env
///////////////////////////////////////////////////////////////////////
class ahb_env extends  uvm_component;

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
	ahb_mst_agent ahb_mst_agnt;
  ahb_slv_agent ahb_slv_agnt;
  ahb_env_config env_cfg;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
	// Provide implementations of virtual methods such as get_type_name and create
	`uvm_component_utils(ahb_env)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
	// Constructor
	function new(string name = "ahb_env", uvm_component parent=null);
		super.new(name, parent);
	endfunction : new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		ahb_mst_agnt=ahb_mst_agent::type_id::create("ahb_mst_agnt",this);
    ahb_slv_agnt=ahb_slv_agent::type_id::create("ahb_slv_agnt",this);
	  if(!uvm_config_db#(ahb_env_config)::get(this, "", "env_cfg",env_cfg))
      `uvm_fatal(get_type_name(),"Unable to get the env config from DB");
    uvm_config_db#(ahb_mst_agent_config)::set(this, "ahb_mst_agnt", "mst_agnt_cfg",env_cfg.mst_agnt_cfg );
    uvm_config_db#(ahb_slv_agent_config)::set(this, "ahb_slv_agnt", "slv_agnt_cfg",env_cfg.slv_agnt_cfg );

  endfunction : build_phase

	function void  connect_phase(uvm_phase phase);
		super.connect_phase(phase);
	endfunction : connect_phase

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
    phase.raise_objection(this);
    phase.drop_objection(this);
	 endtask : run_phase 

endclass : ahb_env