class counter_agent extends uvm_agent;
`uvm_components_utils(counter_agent)
counter_drv drv;
counter_sqr sqr;
counter_mon mon;
counter_cov cov;
function new(string name, uvm_component parent);
	super.new();
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	drv=counter_drv::type_id::create(drv,this);
	sqr=counter_sqr::type_id::create(sqr,this);
	mon=counter_mon::type_id::create(mon,this);
	cov=counter_cov::type_id::create(cov,this);
endfunction

function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	drv.seq_item_port.connect(sqr.seq_item_export);
	mon.ap_port.connect(cov.analysis_export);
endfunction

endclass
