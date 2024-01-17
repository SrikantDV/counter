class base_test extends uvm_test;
 `uvm_component_utils(base_test)
  count_env env;   

  function new(string name="",uvm_component parent=null);
	super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   env=count_env::type_id::create("env",this);
  endfunction

  function void end_of_elaboration_phase(uvm_phase phase);
    uvm_top.print_topology();
  endfunction
endclass

class count_test extends base test;
  `uvm_component_utils(count_test)
   count_seq seq;
   task run_phase(uvm_phase phase);
	seq=count_seq::type_id::create("seq",this);
	phase.raise_objection(this);
	phase.phase_done.set_drain_time(this,100);
	seq.start(env.agent.sqr);
	phase.drop_objection(this);
   endtask
 endclass

