transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/College/EEC180/Labs/Pipeline_processor/synthesis {D:/College/EEC180/Labs/Pipeline_processor/synthesis/Pipeline_Processor.v}
vlog -vlog01compat -work work +incdir+D:/College/EEC180/Labs/Pipeline_processor/hdl {D:/College/EEC180/Labs/Pipeline_processor/hdl/control.v}
vlog -vlog01compat -work work +incdir+D:/College/EEC180/Labs/Pipeline_processor/hdl {D:/College/EEC180/Labs/Pipeline_processor/hdl/ALU_control.v}
vlog -vlog01compat -work work +incdir+D:/College/EEC180/Labs/Pipeline_processor/hdl {D:/College/EEC180/Labs/Pipeline_processor/hdl/ALU.v}
vlog -vlog01compat -work work +incdir+D:/College/EEC180/Labs/Pipeline_processor/hdl {D:/College/EEC180/Labs/Pipeline_processor/hdl/REGISTER.v}
vlog -vlog01compat -work work +incdir+D:/College/EEC180/Labs/Pipeline_processor/hdl {D:/College/EEC180/Labs/Pipeline_processor/hdl/instruction_write_back.v}
vlog -vlog01compat -work work +incdir+D:/College/EEC180/Labs/Pipeline_processor/hdl {D:/College/EEC180/Labs/Pipeline_processor/hdl/instruction_fetch.v}
vlog -vlog01compat -work work +incdir+D:/College/EEC180/Labs/Pipeline_processor/hdl {D:/College/EEC180/Labs/Pipeline_processor/hdl/instruction_execution.v}
vlog -vlog01compat -work work +incdir+D:/College/EEC180/Labs/Pipeline_processor/hdl {D:/College/EEC180/Labs/Pipeline_processor/hdl/instruction_decode.v}
vlog -vlog01compat -work work +incdir+D:/College/EEC180/Labs/Pipeline_processor/hdl {D:/College/EEC180/Labs/Pipeline_processor/hdl/instruction_data_mem.v}
vlog -vlog01compat -work work +incdir+D:/College/EEC180/Labs/Pipeline_processor/hdl {D:/College/EEC180/Labs/Pipeline_processor/hdl/imme_generator.v}
vlog -vlog01compat -work work +incdir+D:/College/EEC180/Labs/Pipeline_processor/ip {D:/College/EEC180/Labs/Pipeline_processor/ip/ins_mem.v}
vlog -vlog01compat -work work +incdir+D:/College/EEC180/Labs/Pipeline_processor/ip {D:/College/EEC180/Labs/Pipeline_processor/ip/d_mem.v}

vlog -vlog01compat -work work +incdir+D:/College/EEC180/Labs/Pipeline_processor/synthesis/../test {D:/College/EEC180/Labs/Pipeline_processor/synthesis/../test/tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run -all
