class base_lib extends uvm_sequence;
	`uvm_object_utils(base_lib)
	
	function new(string name="", uvm_component parent=null);
		super.new(name, parent);
	endfunction
	
	task pre_body();
		if(phase != null)begin
			phase.raise_objection
		end
	endtask
endclass
