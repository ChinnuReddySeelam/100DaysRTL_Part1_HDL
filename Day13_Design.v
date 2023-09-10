module cmos_inverter(
input in, 
output out
);
supply0 gnd;
supply1 vdd;
//pmos(drain,source,gate);
pmos (out, vdd, in);
//nmos(drain,source,gate); 
nmos (out, gnd, in); 
endmodule