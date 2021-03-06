

module hdl_top;
`timescale 1ns/10ps

//pragma attribute hdl_top partition_module_xrtl

logic clk,clk_tx,clk_rx;
logic rst;

ethmac_if_pins ethmac_pif (clk,clk_tx,clk_rx,rst);

ethmac DUT_EMAC(ethmac_pif.eth_mp);

//wb_driver_xif wb_drxif(ethmac_pif.wb_host_dr_mp); 
wb_master_driver_if wb_ms_drif(ethmac_pif.wb_slave_mp);

//slave BFM

//slave BFM (monitor) 

//RX BFM


//TX BFM (monitor)





//tbx clkgen
initial begin 
	clk = 0;
	forever begin 
	#15 clk = ~ clk;
	end 
end

 //tbx clkgen
initial begin
	clk_tx = 0;
	forever begin 
	#20 clk_tx = ~ clk_tx;
	end 
end 

 //tbx clkgen 
 initial begin 
 	clk_rx = 0;
	forever begin 
	#20 clk_rx = ~ clk_rx;
	end 
 end 

//tbx clkgen

initial begin 
	rst = 1;
	#90 rst = 0;
end 


//setting virtual interface 
initial begin  //tbx vif_binding_block
import uvm_pkg::*;


//set diver BFM 
uvm_config_db #(virtual wb_master_driver_if)::set(null,"uvm_test_top",$psprintf("%m.WB_DRIVER"),wb_ms_drif);


end 


endmodule 


