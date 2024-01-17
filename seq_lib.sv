class base_lib extends uvm_sequence;
	`uvm_object_utils(base_lib)
	uvm_phase phase;

	function new(string name="", uvm_component parent=null);
		super.new(name, parent);
	endfunction
	
	task pre_body();
		if(phase != null)begin
			phase.raise_objection(this);
			phase.phase_done.set_drain_time(this, 50);
		end
	endtask

	task post_body();
		if(phase != null) begin
			phase.drop_objection(this);
		end
	endtask
endclass
