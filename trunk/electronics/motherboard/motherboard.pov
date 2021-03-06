//POVRay-File created by 3d41.ulp v1.05
///home/hoeken/Desktop/svn.makerbot.com/trunk/electronics/motherboard/motherboard.brd
//3/21/11 9:20 AM

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare environment = on;

#local cam_x = 0;
#local cam_y = 386;
#local cam_z = -197;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -8;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 45;
#local lgt1_pos_y = 68;
#local lgt1_pos_z = 45;
#local lgt1_intense = 0.847753;
#local lgt2_pos_x = -45;
#local lgt2_pos_y = 68;
#local lgt2_pos_z = 45;
#local lgt2_intense = 0.847753;
#local lgt3_pos_x = 45;
#local lgt3_pos_y = 68;
#local lgt3_pos_z = -30;
#local lgt3_intense = 0.847753;
#local lgt4_pos_x = -45;
#local lgt4_pos_y = 68;
#local lgt4_pos_z = -30;
#local lgt4_intense = 0.847753;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 120.650000;
#declare pcb_y_size = 85.725000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(163);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "tools.inc"
#include "user.inc"

global_settings{charset utf8}

#if(environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-60.325000,0,-42.862500>
}
#end

background{col_bgr}


//Axis uncomment to activate
//object{TOOLS_AXIS_XYZ(100,100,100 //texture{ pigment{rgb<1,0,0>} finish{diffuse 0.8 phong 1}}, //texture{ pigment{rgb<1,1,1>} finish{diffuse 0.8 phong 1}})}

light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro MOTHERBOARD(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<-19.050000,0.000000><101.600000,0.000000>
<101.600000,0.000000><101.600000,85.725000>
<101.600000,85.725000><-19.050000,85.725000>
<-19.050000,85.725000><-19.050000,0.000000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
cylinder{<31.496000,1,3.556000><31.496000,-5,3.556000>1.625600 texture{col_hls}}
cylinder{<42.926000,1,3.556000><42.926000,-5,3.556000>1.625600 texture{col_hls}}
cylinder{<47.371000,1,3.556000><47.371000,-5,3.556000>1.625600 texture{col_hls}}
cylinder{<58.801000,1,3.556000><58.801000,-5,3.556000>1.625600 texture{col_hls}}
cylinder{<63.246000,1,3.556000><63.246000,-5,3.556000>1.625600 texture{col_hls}}
cylinder{<74.676000,1,3.556000><74.676000,-5,3.556000>1.625600 texture{col_hls}}
cylinder{<15.621000,1,3.556000><15.621000,-5,3.556000>1.625600 texture{col_hls}}
cylinder{<27.051000,1,3.556000><27.051000,-5,3.556000>1.625600 texture{col_hls}}
cylinder{<79.375000,1,3.556000><79.375000,-5,3.556000>1.625600 texture{col_hls}}
cylinder{<90.805000,1,3.556000><90.805000,-5,3.556000>1.625600 texture{col_hls}}
cylinder{<3.810000,1,81.915000><3.810000,-5,81.915000>1.500000 texture{col_hls}}
cylinder{<96.810000,1,81.915000><96.810000,-5,81.915000>1.500000 texture{col_hls}}
cylinder{<96.810000,1,3.915000><96.810000,-5,3.915000>1.500000 texture{col_hls}}
cylinder{<3.810000,1,3.915000><3.810000,-5,3.915000>1.500000 texture{col_hls}}
cylinder{<94.230000,1,75.670000><94.230000,-5,75.670000>1.500000 texture{col_hls}}
cylinder{<94.230000,1,28.470000><94.230000,-5,28.470000>1.500000 texture{col_hls}}
//Holes(real)/Board
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_A_AXIS) #declare global_pack_A_AXIS=yes; object {CON_DIS_WS6G()translate<0,0,0> rotate<0,180.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<33.655000,0.000000,81.280000>}#end		//Shrouded Header 6Pin A-AXIS  ML6
#ifndef(pack_B_AXIS) #declare global_pack_B_AXIS=yes; object {CON_DIS_WS6G()translate<0,0,0> rotate<0,180.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<17.145000,0.000000,81.280000>}#end		//Shrouded Header 6Pin B-AXIS  ML6
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<98.377000,0.000000,28.600000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C5 100n 0805
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_DIS_ELKO_3MM5_8MM("100uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<97.010000,0.000000,22.700000>}#end		//Elko 3,5mm Pitch, 8mm  Diameter, 11,5mm High C6 100uF E3,5-8
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_DIS_ELKO_3MM5_8MM("100uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<56.670800,0.000000,45.382200>}#end		//Elko 3,5mm Pitch, 8mm  Diameter, 11,5mm High C9 100uF E3,5-8
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_SMD_SO8("SN75176ASOIC","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<64.643000,0.000000,46.355000>translate<0,0.035000,0> }#end		//SMD IC SO8 Package IC1 SN75176ASOIC SO08
#ifndef(pack_INTERFACE) #declare global_pack_INTERFACE=yes; object {CON_DIS_WS20G()translate<0,0,0> rotate<0,180.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<73.660000,0.000000,41.910000>}#end		//Shrouded Header 20Pin INTERFACE  ML20
#ifndef(pack_JP2) #declare global_pack_JP2=yes; object {PH_1X2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<65.532000,0.000000,37.846000>}#end		//Header 2,54mm Grid 2Pin 1Row (jumper.lib) JP2  1X02
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<29.210000,0.000000,49.530000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R1 10K 0805
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<29.210000,0.000000,46.725000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R4 10K 0805
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_SMD_CHIP_0805("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<7.886700,0.000000,10.134600>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R5 1K 0805
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_SMD_CHIP_0805("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<98.626000,0.000000,16.030000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R8 1K 0805
#ifndef(pack_R14) #declare global_pack_R14=yes; object {RES_SMD_CHIP_0805("222",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<95.070000,0.000000,16.030000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R14 2.2K 0805
#ifndef(pack_R15) #declare global_pack_R15=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<66.560700,0.000000,53.136800>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R15 10K 0805
#ifndef(pack_R16) #declare global_pack_R16=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<63.131700,0.000000,53.213000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R16 10K 0805
#ifndef(pack_R17) #declare global_pack_R17=yes; object {RES_SMD_CHIP_0805("181",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<65.278000,0.000000,40.640000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R17 180 0805
#ifndef(pack_R20) #declare global_pack_R20=yes; object {RES_SMD_CHIP_0805("332",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<24.130000,0.000000,26.035000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R20 3.3K 0805
#ifndef(pack_R21) #declare global_pack_R21=yes; object {RES_SMD_CHIP_0805("332",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<24.130000,0.000000,31.115000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R21 3.3K 0805
#ifndef(pack_R22) #declare global_pack_R22=yes; object {RES_SMD_CHIP_0805("332",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<22.860000,0.000000,40.640000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R22 3.3K 0805
#ifndef(pack_R23) #declare global_pack_R23=yes; object {RES_SMD_CHIP_0805("182",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<27.305000,0.000000,26.035000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R23 1.8K 0805
#ifndef(pack_R24) #declare global_pack_R24=yes; object {RES_SMD_CHIP_0805("182",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<27.305000,0.000000,31.115000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R24 1.8K 0805
#ifndef(pack_R25) #declare global_pack_R25=yes; object {RES_SMD_CHIP_0805("182",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<26.035000,0.000000,40.640000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R25 1.8K 0805
//Parts without Macro (e.g. SMD Solderjumper)				Test point TP1 TPSQTP09R
//Parts without Macro (e.g. SMD Solderjumper)				Test point TP2 TPSQTP09R
//Parts without Macro (e.g. SMD Solderjumper)				Test point TP3 TPSQTP09R
//Parts without Macro (e.g. SMD Solderjumper)				Test point TP4 TPSQTP09R
//Parts without Macro (e.g. SMD Solderjumper)				Test point TP5 TPSQTP09R
//Parts without Macro (e.g. SMD Solderjumper)				Test point TP6 TPSQTP09R
//Parts without Macro (e.g. SMD Solderjumper)				Test point TP7 TPSQTP09R
//Parts without Macro (e.g. SMD Solderjumper)				Test point TP8 TPSQTP09R
//Parts without Macro (e.g. SMD Solderjumper)				Test point TP9 TPSQTP09R
//Parts without Macro (e.g. SMD Solderjumper)				Test point TP10 TPSQTP09R
//Parts without Macro (e.g. SMD Solderjumper)				Test point TP11 TPSQTP09R
//Parts without Macro (e.g. SMD Solderjumper)				Test point TP12 TPSQTP09R
//Parts without Macro (e.g. SMD Solderjumper)				Test point TP13 TPSQTP09R
#ifndef(pack_X_AXIS) #declare global_pack_X_AXIS=yes; object {CON_DIS_WS6G()translate<0,0,0> rotate<0,180.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<83.820000,0.000000,81.280000>}#end		//Shrouded Header 6Pin X-AXIS  ML6
#ifndef(pack_Y_AXIS) #declare global_pack_Y_AXIS=yes; object {CON_DIS_WS6G()translate<0,0,0> rotate<0,180.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<67.310000,0.000000,81.280000>}#end		//Shrouded Header 6Pin Y-AXIS  ML6
#ifndef(pack_Z_AXIS) #declare global_pack_Z_AXIS=yes; object {CON_DIS_WS6G()translate<0,0,0> rotate<0,180.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<50.800000,0.000000,81.280000>}#end		//Shrouded Header 6Pin Z-AXIS  ML6
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<7.874000,0.000000,12.917600>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<7.874000,0.000000,14.717600>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<98.626000,0.000000,13.120000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<98.626000,0.000000,11.320000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<95.070000,0.000000,13.120000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<95.070000,0.000000,11.320000>}
#ifndef(global_pack_A_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<36.195000,0,82.550000> texture{col_thl}}
#ifndef(global_pack_A_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<36.195000,0,80.010000> texture{col_thl}}
#ifndef(global_pack_A_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<33.655000,0,82.550000> texture{col_thl}}
#ifndef(global_pack_A_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<33.655000,0,80.010000> texture{col_thl}}
#ifndef(global_pack_A_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<31.115000,0,82.550000> texture{col_thl}}
#ifndef(global_pack_A_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<31.115000,0,80.010000> texture{col_thl}}
#ifndef(global_pack_B_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<19.685000,0,82.550000> texture{col_thl}}
#ifndef(global_pack_B_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<19.685000,0,80.010000> texture{col_thl}}
#ifndef(global_pack_B_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<17.145000,0,82.550000> texture{col_thl}}
#ifndef(global_pack_B_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<17.145000,0,80.010000> texture{col_thl}}
#ifndef(global_pack_B_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<14.605000,0,82.550000> texture{col_thl}}
#ifndef(global_pack_B_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<14.605000,0,80.010000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<99.277000,0.000000,28.600000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<97.477000,0.000000,28.600000>}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<98.788000,0,22.700000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<95.232000,0,22.700000> texture{col_thl}}
#ifndef(global_pack_C9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<58.448800,0,45.382200> texture{col_thl}}
#ifndef(global_pack_C9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<54.892800,0,45.382200> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.809600,1.200000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<11.366500,0,5.486400> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.809600,1.200000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<11.366500,0,15.646400> texture{col_thl}}
#ifndef(global_pack_E_STOP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<58.166000,0,56.134000> texture{col_thl}}
#ifndef(global_pack_E_STOP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<58.166000,0,58.674000> texture{col_thl}}
#ifndef(global_pack_E_STOP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<58.166000,0,61.214000> texture{col_thl}}
#ifndef(global_pack_E_STOP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<58.166000,0,63.754000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<66.548000,0.000000,48.955000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<65.278000,0.000000,48.955000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<64.008000,0.000000,48.955000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<62.738000,0.000000,48.955000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<62.738000,0.000000,43.755000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<64.008000,0.000000,43.755000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<65.278000,0.000000,43.755000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<66.548000,0.000000,43.755000>}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<72.390000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<74.930000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<72.390000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<74.930000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<72.390000,0,48.260000> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<74.930000,0,48.260000> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<72.390000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<74.930000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<72.390000,0,43.180000> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<74.930000,0,43.180000> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<72.390000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<74.930000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<72.390000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<74.930000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<72.390000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<74.930000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<72.390000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<74.930000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<72.390000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_INTERFACE) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<74.930000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<32.766000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<34.036000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<35.306000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<36.576000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<37.846000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<39.116000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<40.386000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<41.656000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<48.641000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<49.911000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<51.181000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<52.451000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<53.721000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<54.991000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<56.261000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<57.531000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<64.516000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<65.786000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<67.056000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<68.326000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<69.596000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<70.866000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<72.136000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<73.406000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<16.891000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<18.161000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<19.431000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<20.701000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<21.971000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<23.241000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<24.511000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<25.781000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<80.645000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<81.915000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<83.185000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<84.455000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<85.725000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<86.995000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<88.265000,0,9.906000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.498600,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<89.535000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<66.802000,0,37.846000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<64.262000,0,37.846000> texture{col_thl}}
#ifndef(global_pack_PIEZO) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.509600,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<-11.811000,0,82.590000> texture{col_thl}}
#ifndef(global_pack_PIEZO) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.509600,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<-11.811000,0,74.890000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<28.310000,0.000000,49.530000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<30.110000,0.000000,49.530000>}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.540000,1.016000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<39.370000,0,31.115000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.540000,1.016000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<66.040000,0,31.115000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<28.310000,0.000000,46.725000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<30.110000,0.000000,46.725000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<7.886700,0.000000,9.234600>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<7.886700,0.000000,11.034600>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<98.626000,0.000000,16.930000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<98.626000,0.000000,15.130000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<95.070000,0.000000,16.930000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<95.070000,0.000000,15.130000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<66.560700,0.000000,52.236800>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<66.560700,0.000000,54.036800>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<63.131700,0.000000,52.313000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<63.131700,0.000000,54.113000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<64.378000,0.000000,40.640000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<66.178000,0.000000,40.640000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.230000,0.000000,26.035000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.030000,0.000000,26.035000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.230000,0.000000,31.115000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.030000,0.000000,31.115000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<21.960000,0.000000,40.640000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.760000,0.000000,40.640000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<26.405000,0.000000,26.035000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<28.205000,0.000000,26.035000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<26.405000,0.000000,31.115000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<28.205000,0.000000,31.115000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.135000,0.000000,40.640000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<26.935000,0.000000,40.640000>}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<-16.865600,0,8.610600> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<-16.865600,0,4.089400> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.248000,1.498600,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<-14.376400,0,9.855200> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.248000,1.498600,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<-14.376400,0,2.844800> texture{col_thl}}
object{TOOLS_PCB_SMD(0.900000,0.900000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<59.055000,0.000000,73.025000>}
object{TOOLS_PCB_SMD(0.900000,0.900000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<3.810000,0.000000,73.025000>}
object{TOOLS_PCB_SMD(0.900000,0.900000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<11.430000,0.000000,73.025000>}
object{TOOLS_PCB_SMD(0.900000,0.900000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<25.400000,0.000000,73.025000>}
object{TOOLS_PCB_SMD(0.900000,0.900000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<29.210000,0.000000,73.025000>}
object{TOOLS_PCB_SMD(0.900000,0.900000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<41.910000,0.000000,73.025000>}
object{TOOLS_PCB_SMD(0.900000,0.900000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<45.720000,0.000000,73.025000>}
object{TOOLS_PCB_SMD(0.900000,0.900000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<-0.635000,0.000000,73.025000>}
object{TOOLS_PCB_SMD(0.900000,0.900000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<-15.645000,0.000000,67.310000>}
object{TOOLS_PCB_SMD(0.900000,0.900000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<-15.645000,0.000000,12.930000>}
object{TOOLS_PCB_SMD(0.900000,0.900000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<-15.745000,0.000000,16.005000>}
object{TOOLS_PCB_SMD(0.900000,0.900000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<-15.745000,0.000000,64.135000>}
object{TOOLS_PCB_SMD(0.900000,0.900000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<-15.645000,0.000000,70.585000>}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<22.860000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.280000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<83.820000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<25.400000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<38.100000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<40.640000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<43.180000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<45.720000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<48.260000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<50.800000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<53.340000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<55.880000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<60.960000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<63.500000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<66.040000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<68.580000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<71.120000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<73.660000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<76.200000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<78.740000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<11.430000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<50.800000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<48.260000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<45.720000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<43.180000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<40.640000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<38.100000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<35.560000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<33.020000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<29.210000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<26.670000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<24.130000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<21.590000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<19.050000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<16.510000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<55.880000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<58.420000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<60.960000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<63.500000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<66.040000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<68.580000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<71.120000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<73.660000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.280000,0,66.040000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<83.820000,0,66.040000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.280000,0,63.500000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<83.820000,0,63.500000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.280000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<83.820000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.280000,0,58.420000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<83.820000,0,58.420000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.280000,0,55.880000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<83.820000,0,55.880000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.280000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<83.820000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.280000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<83.820000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.280000,0,48.260000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<83.820000,0,48.260000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.280000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<83.820000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.280000,0,43.180000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<83.820000,0,43.180000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.280000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<83.820000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.280000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<83.820000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.280000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<83.820000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.280000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<83.820000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.280000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<83.820000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.280000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<83.820000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<13.970000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<81.280000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<83.820000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<27.940000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<30.480000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<20.320000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.409600,0.800000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<33.020000,0,20.320000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.000000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.690000,0.000000,27.725000>}
object{TOOLS_PCB_SMD(1.000000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.690000,0.000000,30.225000>}
object{TOOLS_PCB_SMD(1.000000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.690000,0.000000,32.725000>}
object{TOOLS_PCB_SMD(1.000000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.690000,0.000000,35.225000>}
object{TOOLS_PCB_SMD(1.000000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.690000,0.000000,37.725000>}
object{TOOLS_PCB_SMD(1.000000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.690000,0.000000,40.225000>}
object{TOOLS_PCB_SMD(1.000000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.690000,0.000000,42.655000>}
object{TOOLS_PCB_SMD(1.000000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.690000,0.000000,44.355000>}
object{TOOLS_PCB_SMD(1.000000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.690000,0.000000,25.225000>}
object{TOOLS_PCB_SMD(0.700000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.690000,0.000000,45.655000>}
object{TOOLS_PCB_SMD(3.000000,2.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<-15.110000,0.000000,48.655000>}
object{TOOLS_PCB_SMD(3.000000,2.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<-15.010000,0.000000,18.655000>}
object{TOOLS_PCB_SMD(0.700000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.690000,0.000000,46.855000>}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<86.360000,0,82.550000> texture{col_thl}}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<86.360000,0,80.010000> texture{col_thl}}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<83.820000,0,82.550000> texture{col_thl}}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<83.820000,0,80.010000> texture{col_thl}}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<81.280000,0,82.550000> texture{col_thl}}
#ifndef(global_pack_X_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<81.280000,0,80.010000> texture{col_thl}}
#ifndef(global_pack_X_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<12.827000,0,56.134000> texture{col_thl}}
#ifndef(global_pack_X_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<12.827000,0,58.674000> texture{col_thl}}
#ifndef(global_pack_X_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<12.827000,0,61.214000> texture{col_thl}}
#ifndef(global_pack_X_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<12.827000,0,63.754000> texture{col_thl}}
#ifndef(global_pack_X_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<3.810000,0,56.134000> texture{col_thl}}
#ifndef(global_pack_X_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<3.810000,0,58.674000> texture{col_thl}}
#ifndef(global_pack_X_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<3.810000,0,61.214000> texture{col_thl}}
#ifndef(global_pack_X_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<3.810000,0,63.754000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<99.270000,0,70.970000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<99.270000,0,66.770000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<99.270000,0,62.570000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<99.270000,0,58.370000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<99.270000,0,54.170000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<99.270000,0,49.970000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<99.270000,0,45.770000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<99.270000,0,41.570000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<99.270000,0,37.370000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<99.270000,0,33.170000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<93.770000,0,70.970000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<93.770000,0,66.770000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<93.770000,0,62.570000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<93.770000,0,58.370000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<93.770000,0,54.170000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<93.770000,0,49.970000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<93.770000,0,45.770000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<93.770000,0,41.570000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<93.770000,0,37.370000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.100000,1.400000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<93.770000,0,33.170000> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<69.850000,0,82.550000> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<69.850000,0,80.010000> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<67.310000,0,82.550000> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<67.310000,0,80.010000> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<64.770000,0,82.550000> texture{col_thl}}
#ifndef(global_pack_Y_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<64.770000,0,80.010000> texture{col_thl}}
#ifndef(global_pack_Y_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<30.861000,0,56.134000> texture{col_thl}}
#ifndef(global_pack_Y_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<30.861000,0,58.674000> texture{col_thl}}
#ifndef(global_pack_Y_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<30.861000,0,61.214000> texture{col_thl}}
#ifndef(global_pack_Y_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<30.861000,0,63.754000> texture{col_thl}}
#ifndef(global_pack_Y_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<21.844000,0,56.134000> texture{col_thl}}
#ifndef(global_pack_Y_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<21.844000,0,58.674000> texture{col_thl}}
#ifndef(global_pack_Y_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<21.844000,0,61.214000> texture{col_thl}}
#ifndef(global_pack_Y_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<21.844000,0,63.754000> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<53.340000,0,82.550000> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<53.340000,0,80.010000> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<50.800000,0,82.550000> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<50.800000,0,80.010000> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<48.260000,0,82.550000> texture{col_thl}}
#ifndef(global_pack_Z_AXIS) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,0.914400,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<48.260000,0,80.010000> texture{col_thl}}
#ifndef(global_pack_Z_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<49.149000,0,56.134000> texture{col_thl}}
#ifndef(global_pack_Z_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<49.149000,0,58.674000> texture{col_thl}}
#ifndef(global_pack_Z_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<49.149000,0,61.214000> texture{col_thl}}
#ifndef(global_pack_Z_MAX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<49.149000,0,63.754000> texture{col_thl}}
#ifndef(global_pack_Z_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<40.132000,0,56.134000> texture{col_thl}}
#ifndef(global_pack_Z_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<40.132000,0,58.674000> texture{col_thl}}
#ifndef(global_pack_Z_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<40.132000,0,61.214000> texture{col_thl}}
#ifndef(global_pack_Z_MIN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<40.132000,0,63.754000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<56.769000,0,36.449000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.219200,0.711200,1,16,1,0) translate<97.332800,0,18.186400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<32.727900,0,49.542700> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<43.878500,0,72.809100> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<44.577000,0,70.231000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<43.815000,0,49.149000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<62.865000,0,34.544000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<62.103000,0,50.800000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<66.116200,0,46.901100> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<70.345300,0,77.127100> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<80.352900,0,75.704700> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<85.471000,0,72.085200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<78.308200,0,75.717400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<65.024000,0,51.066700> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<68.440300,0,56.210200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<64.922400,0,52.730400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<56.388000,0,26.035000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<70.497700,0,26.009600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<32.385000,0,34.074100> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<41.071800,0,38.252400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<36.296600,0,50.660300> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<8.242300,0,52.298600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<35.013900,0,28.536900> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<20.358100,0,23.761700> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<-4.978400,0,5.803900> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<27.686000,0,14.757400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<45.059600,0,16.103600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<60.858400,0,15.976600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<79.070200,0,16.116300> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<87.630000,0,25.908000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<87.591900,0,52.692300> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<89.001600,0,72.110600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<34.366200,0,73.139300> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<53.911500,0,65.874900> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<17.830800,0,72.923400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<-4.851400,0,68.326000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<25.387300,0,82.626200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<42.240200,0,82.969100> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<58.915300,0,83.845400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<75.692000,0,83.629500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<90.881200,0,83.629500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<22.555200,0,79.756000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<39.090600,0,79.121000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<55.981600,0,79.717900> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<72.351900,0,78.549500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<75.933300,0,65.303400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<17.602200,0,40.436800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<16.040100,0,32.727900> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<61.048900,0,27.813000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<45.364400,0,42.189400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<61.722000,0,33.401000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<25.019000,0,29.718000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<15.684500,0,30.226000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<24.206200,0,27.584400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<15.722600,0,27.597100> texture{col_thl}}
object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1,0) translate<18.249900,0,14.782800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<51.308000,0,40.640000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<64.008000,0,27.940000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<-2.540000,0,54.229000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<22.733000,0,46.609000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.508000,1,16,1,0) translate<61.595000,0,59.055000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-16.954500,0.000000,66.890900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-16.954500,0.000000,69.275500>}
box{<0,0,-0.127000><2.384600,0.035000,0.127000> rotate<0,90.000000,0> translate<-16.954500,0.000000,69.275500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-16.865600,-1.535000,4.089400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-16.764000,-1.535000,4.064000>}
box{<0,0,-0.127000><0.104727,0.035000,0.127000> rotate<0,14.035317,0> translate<-16.865600,-1.535000,4.089400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-15.748000,0.000000,16.008000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-15.745000,0.000000,16.005000>}
box{<0,0,-0.127000><0.004243,0.035000,0.127000> rotate<0,44.997030,0> translate<-15.748000,0.000000,16.008000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-15.745000,0.000000,63.865300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-15.745000,0.000000,64.135000>}
box{<0,0,-0.127000><0.269700,0.035000,0.127000> rotate<0,90.000000,0> translate<-15.745000,0.000000,64.135000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-16.954500,0.000000,69.275500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-15.645000,0.000000,70.585000>}
box{<0,0,-0.127000><1.851913,0.035000,0.127000> rotate<0,-44.997030,0> translate<-16.954500,0.000000,69.275500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-15.645000,0.000000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-15.621000,0.000000,67.310000>}
box{<0,0,-0.127000><0.024000,0.035000,0.127000> rotate<0,0.000000,0> translate<-15.645000,0.000000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-16.954500,0.000000,66.890900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-14.693900,0.000000,64.630300>}
box{<0,0,-0.127000><3.196971,0.035000,0.127000> rotate<0,44.997030,0> translate<-16.954500,0.000000,66.890900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-14.693900,0.000000,64.490600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-14.693900,0.000000,64.630300>}
box{<0,0,-0.127000><0.139700,0.035000,0.127000> rotate<0,90.000000,0> translate<-14.693900,0.000000,64.630300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-11.811000,-1.535000,82.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-11.811000,-1.535000,82.677000>}
box{<0,0,-0.127000><0.087000,0.035000,0.127000> rotate<0,90.000000,0> translate<-11.811000,-1.535000,82.677000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-15.745000,0.000000,16.005000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-9.141000,0.000000,16.005000>}
box{<0,0,-0.127000><6.604000,0.035000,0.127000> rotate<0,0.000000,0> translate<-15.745000,0.000000,16.005000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-11.811000,-1.535000,82.677000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-6.223000,-1.535000,77.089000>}
box{<0,0,-0.127000><7.902625,0.035000,0.127000> rotate<0,44.997030,0> translate<-11.811000,-1.535000,82.677000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-15.645000,0.000000,12.930000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-5.332600,0.000000,12.930000>}
box{<0,0,-0.127000><10.312400,0.035000,0.127000> rotate<0,0.000000,0> translate<-15.645000,0.000000,12.930000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-15.621000,0.000000,67.310000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-2.540000,0.000000,54.229000>}
box{<0,0,-0.127000><18.499328,0.035000,0.127000> rotate<0,44.997030,0> translate<-15.621000,0.000000,67.310000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-2.540000,-1.535000,53.263800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-2.540000,-1.535000,54.229000>}
box{<0,0,-0.127000><0.965200,0.035000,0.127000> rotate<0,90.000000,0> translate<-2.540000,-1.535000,54.229000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-0.647700,0.000000,56.210200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-0.647700,0.000000,57.670700>}
box{<0,0,-0.127000><1.460500,0.035000,0.127000> rotate<0,90.000000,0> translate<-0.647700,0.000000,57.670700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-0.647700,0.000000,57.670700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-0.635000,0.000000,57.683400>}
box{<0,0,-0.127000><0.017961,0.035000,0.127000> rotate<0,-44.997030,0> translate<-0.647700,0.000000,57.670700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-0.635000,0.000000,57.683400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-0.635000,0.000000,73.025000>}
box{<0,0,-0.127000><15.341600,0.035000,0.127000> rotate<0,90.000000,0> translate<-0.635000,0.000000,73.025000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-16.764000,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-0.508000,-1.535000,20.320000>}
box{<0,0,-0.127000><22.989456,0.035000,0.127000> rotate<0,-44.997030,0> translate<-16.764000,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-5.332600,0.000000,12.930000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-0.127000,0.000000,18.135600>}
box{<0,0,-0.127000><7.361830,0.035000,0.127000> rotate<0,-44.997030,0> translate<-5.332600,0.000000,12.930000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-2.540000,-1.535000,53.263800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.644900,-1.535000,47.078900>}
box{<0,0,-0.127000><8.746769,0.035000,0.127000> rotate<0,44.997030,0> translate<-2.540000,-1.535000,53.263800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.810000,0.000000,63.754000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.810000,0.000000,73.025000>}
box{<0,0,-0.127000><9.271000,0.035000,0.127000> rotate<0,90.000000,0> translate<3.810000,0.000000,73.025000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-0.647700,0.000000,56.210200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.343400,0.000000,51.219100>}
box{<0,0,-0.127000><7.058481,0.035000,0.127000> rotate<0,44.997030,0> translate<-0.647700,0.000000,56.210200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-9.141000,0.000000,16.005000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.067300,0.000000,30.213300>}
box{<0,0,-0.127000><20.093571,0.035000,0.127000> rotate<0,-44.997030,0> translate<-9.141000,0.000000,16.005000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.810000,-1.535000,63.754000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.588000,-1.535000,65.532000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,-44.997030,0> translate<3.810000,-1.535000,63.754000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-6.223000,-1.535000,77.089000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.715000,-1.535000,77.089000>}
box{<0,0,-0.127000><11.938000,0.035000,0.127000> rotate<0,0.000000,0> translate<-6.223000,-1.535000,77.089000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.343400,0.000000,51.219100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.854700,0.000000,51.219100>}
box{<0,0,-0.127000><1.511300,0.035000,0.127000> rotate<0,0.000000,0> translate<4.343400,0.000000,51.219100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-14.693900,0.000000,64.490600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.124700,0.000000,42.672000>}
box{<0,0,-0.127000><30.856160,0.035000,0.127000> rotate<0,44.997030,0> translate<-14.693900,0.000000,64.490600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.874000,0.000000,12.917600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.886700,0.000000,11.034600>}
box{<0,0,-0.127000><1.883043,0.035000,0.127000> rotate<0,89.607657,0> translate<7.874000,0.000000,12.917600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-0.127000,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.864600,0.000000,18.135600>}
box{<0,0,-0.127000><8.991600,0.035000,0.127000> rotate<0,0.000000,0> translate<-0.127000,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.886700,0.000000,9.234600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.890000,0.000000,9.271000>}
box{<0,0,-0.127000><1.003960,0.035000,0.127000> rotate<0,-2.077658,0> translate<7.886700,0.000000,9.234600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.854700,0.000000,51.219100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.702800,0.000000,47.371000>}
box{<0,0,-0.127000><5.442035,0.035000,0.127000> rotate<0,44.997030,0> translate<5.854700,0.000000,51.219100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.779000,0.000000,66.802000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.779000,0.000000,71.374000>}
box{<0,0,-0.127000><4.572000,0.035000,0.127000> rotate<0,90.000000,0> translate<9.779000,0.000000,71.374000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-15.745000,0.000000,63.865300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.350500,0.000000,37.769800>}
box{<0,0,-0.127000><36.904610,0.035000,0.127000> rotate<0,44.997030,0> translate<-15.745000,0.000000,63.865300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.779000,0.000000,71.374000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.430000,0.000000,73.025000>}
box{<0,0,-0.127000><2.334867,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.779000,0.000000,71.374000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.702800,0.000000,47.371000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.174000,0.000000,47.371000>}
box{<0,0,-0.127000><2.471200,0.035000,0.127000> rotate<0,0.000000,0> translate<9.702800,0.000000,47.371000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.350500,0.000000,37.769800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.645200,0.000000,37.769800>}
box{<0,0,-0.127000><2.294700,0.035000,0.127000> rotate<0,0.000000,0> translate<10.350500,0.000000,37.769800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.124700,0.000000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.673000,0.000000,42.672000>}
box{<0,0,-0.127000><5.548300,0.035000,0.127000> rotate<0,0.000000,0> translate<7.124700,0.000000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.067300,0.000000,30.213300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.678300,0.000000,30.213300>}
box{<0,0,-0.127000><7.611000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.067300,0.000000,30.213300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.678300,0.000000,30.213300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.690000,0.000000,30.225000>}
box{<0,0,-0.127000><0.016546,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.678300,0.000000,30.213300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.645200,0.000000,37.769800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.690000,0.000000,37.725000>}
box{<0,0,-0.127000><0.063357,0.035000,0.127000> rotate<0,44.997030,0> translate<12.645200,0.000000,37.769800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.673000,0.000000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.690000,0.000000,42.655000>}
box{<0,0,-0.127000><0.024042,0.035000,0.127000> rotate<0,44.997030,0> translate<12.673000,0.000000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.174000,0.000000,47.371000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.690000,0.000000,46.855000>}
box{<0,0,-0.127000><0.729734,0.035000,0.127000> rotate<0,44.997030,0> translate<12.174000,0.000000,47.371000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.690000,0.000000,27.725000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.729000,0.000000,27.686000>}
box{<0,0,-0.127000><0.055154,0.035000,0.127000> rotate<0,44.997030,0> translate<12.690000,0.000000,27.725000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.690000,0.000000,37.725000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.734800,0.000000,37.769800>}
box{<0,0,-0.127000><0.063357,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.690000,0.000000,37.725000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<3.810000,0.000000,56.134000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.827000,0.000000,56.134000>}
box{<0,0,-0.254000><9.017000,0.035000,0.254000> rotate<0,0.000000,0> translate<3.810000,0.000000,56.134000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.779000,0.000000,66.802000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.827000,0.000000,63.754000>}
box{<0,0,-0.127000><4.310523,0.035000,0.127000> rotate<0,44.997030,0> translate<9.779000,0.000000,66.802000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.827000,0.000000,63.754000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.827000,0.000000,63.881000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,90.000000,0> translate<12.827000,0.000000,63.881000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.690000,0.000000,35.225000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.926500,0.000000,34.988500>}
box{<0,0,-0.127000><0.334462,0.035000,0.127000> rotate<0,44.997030,0> translate<12.690000,0.000000,35.225000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.366500,-1.535000,15.646400>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<13.131800,-1.535000,17.411700>}
box{<0,0,-0.635000><2.496511,0.035000,0.635000> rotate<0,-44.997030,0> translate<11.366500,-1.535000,15.646400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.715000,-1.535000,77.089000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.182600,-1.535000,84.302600>}
box{<0,0,-0.127000><10.382730,0.035000,0.127000> rotate<0,-44.005918,0> translate<5.715000,-1.535000,77.089000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.366500,-1.535000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<13.665200,-1.535000,7.785100>}
box{<0,0,-0.635000><3.250853,0.035000,0.635000> rotate<0,-44.997030,0> translate<11.366500,-1.535000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.690000,0.000000,46.855000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.365000,0.000000,49.530000>}
box{<0,0,-0.127000><3.783021,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.690000,0.000000,46.855000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.729000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.633700,0.000000,27.686000>}
box{<0,0,-0.127000><2.904700,0.035000,0.127000> rotate<0,0.000000,0> translate<12.729000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.690000,0.000000,30.225000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.683500,0.000000,30.225000>}
box{<0,0,-0.127000><2.993500,0.035000,0.127000> rotate<0,0.000000,0> translate<12.690000,0.000000,30.225000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.683500,0.000000,30.225000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.684500,0.000000,30.226000>}
box{<0,0,-0.127000><0.001414,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.683500,0.000000,30.225000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.864600,0.000000,18.135600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.722600,0.000000,24.993600>}
box{<0,0,-0.127000><9.698677,0.035000,0.127000> rotate<0,-44.997030,0> translate<8.864600,0.000000,18.135600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.633700,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.722600,0.000000,27.597100>}
box{<0,0,-0.127000><0.125724,0.035000,0.127000> rotate<0,44.997030,0> translate<15.633700,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.702200,-1.535000,27.617500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.722600,-1.535000,27.597100>}
box{<0,0,-0.127000><0.028850,0.035000,0.127000> rotate<0,44.997030,0> translate<15.702200,-1.535000,27.617500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.722600,0.000000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.722600,0.000000,27.597100>}
box{<0,0,-0.127000><2.603500,0.035000,0.127000> rotate<0,90.000000,0> translate<15.722600,0.000000,27.597100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.698200,0.000000,30.225000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.722600,0.000000,30.200600>}
box{<0,0,-0.127000><0.034507,0.035000,0.127000> rotate<0,44.997030,0> translate<15.698200,0.000000,30.225000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.684500,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.748000,0.000000,30.226000>}
box{<0,0,-0.127000><0.063500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.684500,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.722600,0.000000,30.200600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.748000,0.000000,30.226000>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.722600,0.000000,30.200600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.887700,-1.535000,79.248000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.887700,-1.535000,81.368900>}
box{<0,0,-0.127000><2.120900,0.035000,0.127000> rotate<0,90.000000,0> translate<15.887700,-1.535000,81.368900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.588000,-1.535000,65.532000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,-1.535000,65.532000>}
box{<0,0,-0.127000><10.414000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.588000,-1.535000,65.532000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.116300,-1.535000,10.452100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.116300,-1.535000,12.700000>}
box{<0,0,-0.127000><2.247900,0.035000,0.127000> rotate<0,90.000000,0> translate<16.116300,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.926500,0.000000,34.988500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.167100,0.000000,34.988500>}
box{<0,0,-0.127000><3.240600,0.035000,0.127000> rotate<0,0.000000,0> translate<12.926500,0.000000,34.988500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.684500,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.192500,-1.535000,29.718000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<15.684500,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.605000,-1.535000,82.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.433800,-1.535000,83.743800>}
box{<0,0,-0.127000><2.183957,0.035000,0.127000> rotate<0,-33.133423,0> translate<14.605000,-1.535000,82.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.702200,-1.535000,27.617500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.562200,-1.535000,27.617500>}
box{<0,0,-0.127000><0.860000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.702200,-1.535000,27.617500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.116300,-1.535000,10.452100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.662400,-1.535000,9.906000>}
box{<0,0,-0.127000><0.772302,0.035000,0.127000> rotate<0,44.997030,0> translate<16.116300,-1.535000,10.452100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.878300,0.000000,9.893300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.878300,0.000000,8.597900>}
box{<0,0,-0.127000><1.295400,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.878300,0.000000,8.597900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.662400,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.891000,-1.535000,9.906000>}
box{<0,0,-0.127000><0.228600,0.035000,0.127000> rotate<0,0.000000,0> translate<16.662400,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.878300,0.000000,9.893300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.891000,0.000000,9.906000>}
box{<0,0,-0.127000><0.017961,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.878300,0.000000,9.893300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.827000,0.000000,63.881000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.891000,0.000000,63.881000>}
box{<0,0,-0.127000><4.064000,0.035000,0.127000> rotate<0,0.000000,0> translate<12.827000,0.000000,63.881000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.887700,-1.535000,81.368900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.145000,-1.535000,82.550000>}
box{<0,0,-0.127000><1.725051,0.035000,0.127000> rotate<0,-43.207238,0> translate<15.887700,-1.535000,81.368900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.246600,0.000000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.246600,0.000000,15.468600>}
box{<0,0,-0.127000><2.006600,0.035000,0.127000> rotate<0,90.000000,0> translate<17.246600,0.000000,15.468600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.167100,0.000000,34.988500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.538700,0.000000,36.360100>}
box{<0,0,-0.127000><1.939735,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.167100,0.000000,34.988500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.538700,0.000000,36.449000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.538700,0.000000,36.360100>}
box{<0,0,-0.127000><0.088900,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.538700,0.000000,36.360100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.890000,0.000000,9.271000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.600000,0.000000,17.981000>}
box{<0,0,-0.127000><12.317800,0.035000,0.127000> rotate<0,-44.997030,0> translate<8.890000,0.000000,9.271000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.538700,0.000000,36.449000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.600000,0.000000,36.449000>}
box{<0,0,-0.127000><0.061300,0.035000,0.127000> rotate<0,0.000000,0> translate<17.538700,0.000000,36.449000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.600000,0.000000,17.981000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.600000,0.000000,36.449000>}
box{<0,0,-0.127000><18.468000,0.035000,0.127000> rotate<0,90.000000,0> translate<17.600000,0.000000,36.449000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.887700,-1.535000,79.248000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.678400,-1.535000,77.724000>}
box{<0,0,-0.127000><2.351421,0.035000,0.127000> rotate<0,40.397238,0> translate<15.887700,-1.535000,79.248000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.878300,0.000000,8.597900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.919700,0.000000,7.556500>}
box{<0,0,-0.127000><1.472762,0.035000,0.127000> rotate<0,44.997030,0> translate<16.878300,0.000000,8.597900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.161000,0.000000,9.055100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.161000,0.000000,12.446000>}
box{<0,0,-0.127000><3.390900,0.035000,0.127000> rotate<0,90.000000,0> translate<18.161000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.246600,0.000000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.161000,0.000000,12.547600>}
box{<0,0,-0.127000><1.293157,0.035000,0.127000> rotate<0,44.997030,0> translate<17.246600,0.000000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.161000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.161000,0.000000,12.547600>}
box{<0,0,-0.127000><0.101600,0.035000,0.127000> rotate<0,90.000000,0> translate<18.161000,0.000000,12.547600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,68.580000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.161000,-1.535000,70.231000>}
box{<0,0,-0.127000><2.334867,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.510000,-1.535000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.116300,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.249900,-1.535000,14.782800>}
box{<0,0,-0.127000><2.981661,0.035000,0.127000> rotate<0,-44.306799,0> translate<16.116300,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.145000,-1.535000,80.010000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.923000,-1.535000,78.232000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,44.997030,0> translate<17.145000,-1.535000,80.010000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,-1.535000,65.532000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,-1.535000,68.580000>}
box{<0,0,-0.127000><4.310523,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.002000,-1.535000,65.532000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.161000,0.000000,9.055100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.126200,0.000000,8.089900>}
box{<0,0,-0.127000><1.364999,0.035000,0.127000> rotate<0,44.997030,0> translate<18.161000,0.000000,9.055100> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<19.431000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<19.431000,0.000000,9.906000>}
box{<0,0,-0.635000><0.889000,0.035000,0.635000> rotate<0,-90.000000,0> translate<19.431000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.246600,0.000000,15.468600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.507200,0.000000,17.729200>}
box{<0,0,-0.127000><3.196971,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.246600,0.000000,15.468600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.249900,0.000000,14.782800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.015200,0.000000,16.535400>}
box{<0,0,-0.127000><2.487547,0.035000,0.127000> rotate<0,-44.790201,0> translate<18.249900,0.000000,14.782800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.433800,-1.535000,83.743800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.281900,-1.535000,83.743800>}
box{<0,0,-0.127000><3.848100,0.035000,0.127000> rotate<0,0.000000,0> translate<16.433800,-1.535000,83.743800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-0.508000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.320000,-1.535000,20.320000>}
box{<0,0,-0.127000><20.828000,0.035000,0.127000> rotate<0,0.000000,0> translate<-0.508000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<19.431000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.383500,0.000000,11.747500>}
box{<0,0,-0.635000><1.347038,0.035000,0.635000> rotate<0,-44.997030,0> translate<19.431000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.015200,0.000000,16.535400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.548600,0.000000,17.068800>}
box{<0,0,-0.127000><0.754342,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.015200,0.000000,16.535400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.383500,0.000000,11.747500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.701000,0.000000,12.065000>}
box{<0,0,-0.635000><0.449013,0.035000,0.635000> rotate<0,-44.997030,0> translate<20.383500,0.000000,11.747500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.701000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.701000,0.000000,12.446000>}
box{<0,0,-0.635000><0.381000,0.035000,0.635000> rotate<0,90.000000,0> translate<20.701000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.734800,0.000000,37.769800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.132800,0.000000,37.769800>}
box{<0,0,-0.127000><8.398000,0.035000,0.127000> rotate<0,0.000000,0> translate<12.734800,0.000000,37.769800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.891000,0.000000,63.881000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,0.000000,68.580000>}
box{<0,0,-0.127000><6.645390,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.891000,0.000000,63.881000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.678400,-1.535000,77.724000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,-1.535000,77.724000>}
box{<0,0,-0.127000><3.911600,0.035000,0.127000> rotate<0,0.000000,0> translate<17.678400,-1.535000,77.724000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.690000,0.000000,45.655000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.779000,0.000000,45.655000>}
box{<0,0,-0.127000><9.089000,0.035000,0.127000> rotate<0,0.000000,0> translate<12.690000,0.000000,45.655000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<12.827000,0.000000,56.134000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.844000,0.000000,56.134000>}
box{<0,0,-0.254000><9.017000,0.035000,0.254000> rotate<0,0.000000,0> translate<12.827000,0.000000,56.134000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.844000,0.000000,63.754000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.844000,0.000000,66.421000>}
box{<0,0,-0.127000><2.667000,0.035000,0.127000> rotate<0,90.000000,0> translate<21.844000,0.000000,66.421000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.971000,-1.535000,9.410700>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.971000,-1.535000,9.906000>}
box{<0,0,-0.635000><0.495300,0.035000,0.635000> rotate<0,90.000000,0> translate<21.971000,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.383500,0.000000,11.747500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.971000,0.000000,10.160000>}
box{<0,0,-0.635000><2.245064,0.035000,0.635000> rotate<0,44.997030,0> translate<20.383500,0.000000,11.747500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.971000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.971000,0.000000,10.160000>}
box{<0,0,-0.635000><0.254000,0.035000,0.635000> rotate<0,90.000000,0> translate<21.971000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.923000,-1.535000,78.232000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.971000,-1.535000,78.232000>}
box{<0,0,-0.127000><3.048000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.923000,-1.535000,78.232000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.644900,-1.535000,47.078900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.263100,-1.535000,47.078900>}
box{<0,0,-0.127000><18.618200,0.035000,0.127000> rotate<0,0.000000,0> translate<3.644900,-1.535000,47.078900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.779000,0.000000,45.655000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.733000,0.000000,46.609000>}
box{<0,0,-0.127000><1.349160,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.779000,0.000000,45.655000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.263100,-1.535000,47.078900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.733000,-1.535000,46.609000>}
box{<0,0,-0.127000><0.664539,0.035000,0.127000> rotate<0,44.997030,0> translate<22.263100,-1.535000,47.078900> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<13.665200,-1.535000,7.785100>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<23.596600,-1.535000,7.785100>}
box{<0,0,-0.635000><9.931400,0.035000,0.635000> rotate<0,0.000000,0> translate<13.665200,-1.535000,7.785100> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.971000,-1.535000,9.410700>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<23.596600,-1.535000,7.785100>}
box{<0,0,-0.635000><2.298946,0.035000,0.635000> rotate<0,44.997030,0> translate<21.971000,-1.535000,9.410700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.132800,0.000000,37.769800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.760000,0.000000,40.397000>}
box{<0,0,-0.127000><3.715422,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.132800,0.000000,37.769800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.760000,0.000000,40.397000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.760000,0.000000,40.640000>}
box{<0,0,-0.127000><0.243000,0.035000,0.127000> rotate<0,90.000000,0> translate<23.760000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,68.707000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,68.580000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.130000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.844000,0.000000,66.421000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,68.707000>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.844000,0.000000,66.421000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,68.707000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,71.755000>}
box{<0,0,-0.127000><3.048000,0.035000,0.127000> rotate<0,90.000000,0> translate<24.130000,0.000000,71.755000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.562200,-1.535000,27.617500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.201200,-1.535000,27.579400>}
box{<0,0,-0.127000><7.639095,0.035000,0.127000> rotate<0,0.285745,0> translate<16.562200,-1.535000,27.617500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.201200,-1.535000,27.579400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206200,-1.535000,27.584400>}
box{<0,0,-0.127000><0.007071,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.201200,-1.535000,27.579400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.019000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.019000,0.000000,26.035000>}
box{<0,0,-0.127000><0.635000,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.019000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.206200,0.000000,27.584400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.019000,0.000000,26.670000>}
box{<0,0,-0.127000><1.223426,0.035000,0.127000> rotate<0,48.363269,0> translate<24.206200,0.000000,27.584400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.192500,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.019000,-1.535000,29.718000>}
box{<0,0,-0.127000><8.826500,0.035000,0.127000> rotate<0,0.000000,0> translate<16.192500,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.019000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.019000,0.000000,31.115000>}
box{<0,0,-0.127000><1.397000,0.035000,0.127000> rotate<0,90.000000,0> translate<25.019000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.019000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.030000,0.000000,26.035000>}
box{<0,0,-0.127000><0.011000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.019000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.019000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.030000,0.000000,31.115000>}
box{<0,0,-0.127000><0.011000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.019000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.760000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.135000,0.000000,40.640000>}
box{<0,0,-0.127000><1.375000,0.035000,0.127000> rotate<0,0.000000,0> translate<23.760000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,71.755000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,73.025000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.130000,0.000000,71.755000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.030000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.405000,0.000000,26.035000>}
box{<0,0,-0.127000><1.375000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.030000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.030000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.405000,0.000000,31.115000>}
box{<0,0,-0.127000><1.375000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.030000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.161000,-1.535000,70.231000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,-1.535000,70.231000>}
box{<0,0,-0.127000><8.382000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.161000,-1.535000,70.231000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,0.000000,68.707000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,0.000000,68.580000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.670000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,0.000000,68.707000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,0.000000,70.485000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,90.000000,0> translate<26.670000,0.000000,70.485000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,69.176900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,67.868800>}
box{<0,0,-0.127000><1.308100,0.035000,0.127000> rotate<0,-90.000000,0> translate<27.940000,-1.535000,67.868800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.543000,-1.535000,70.231000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,69.176900>}
box{<0,0,-0.127000><1.750067,0.035000,0.127000> rotate<0,37.033769,0> translate<26.543000,-1.535000,70.231000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.733000,0.000000,46.609000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.194000,0.000000,46.609000>}
box{<0,0,-0.127000><5.461000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.733000,0.000000,46.609000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.194000,0.000000,46.609000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.310000,0.000000,46.725000>}
box{<0,0,-0.127000><0.164049,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.194000,0.000000,46.609000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.365000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.310000,0.000000,49.530000>}
box{<0,0,-0.127000><12.945000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.365000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.310000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.321000,0.000000,49.530000>}
box{<0,0,-0.127000><0.011000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.310000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.321000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.321000,0.000000,50.292000>}
box{<0,0,-0.127000><0.762000,0.035000,0.127000> rotate<0,90.000000,0> translate<28.321000,0.000000,50.292000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.126200,0.000000,8.089900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.359100,0.000000,8.089900>}
box{<0,0,-0.127000><9.232900,0.035000,0.127000> rotate<0,0.000000,0> translate<19.126200,0.000000,8.089900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.919700,0.000000,7.556500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.930600,0.000000,7.556500>}
box{<0,0,-0.127000><11.010900,0.035000,0.127000> rotate<0,0.000000,0> translate<17.919700,0.000000,7.556500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.184600,-1.535000,79.438500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.184600,-1.535000,81.495900>}
box{<0,0,-0.127000><2.057400,0.035000,0.127000> rotate<0,90.000000,0> translate<29.184600,-1.535000,81.495900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,0.000000,70.485000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,0.000000,73.025000>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.670000,0.000000,70.485000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.184600,-1.535000,81.495900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.362400,-1.535000,81.673700>}
box{<0,0,-0.127000><0.251447,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.184600,-1.535000,81.495900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.362400,-1.535000,81.673700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.387800,-1.535000,81.673700>}
box{<0,0,-0.127000><0.025400,0.035000,0.127000> rotate<0,0.000000,0> translate<29.362400,-1.535000,81.673700> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<23.596600,-1.535000,7.785100>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<29.464000,-1.535000,7.785100>}
box{<0,0,-0.635000><5.867400,0.035000,0.635000> rotate<0,0.000000,0> translate<23.596600,-1.535000,7.785100> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<29.464000,-1.535000,7.785100>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<29.565600,-1.535000,7.886700>}
box{<0,0,-0.635000><0.143684,0.035000,0.635000> rotate<0,-44.997030,0> translate<29.464000,-1.535000,7.785100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.321000,0.000000,50.292000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.591000,0.000000,51.562000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.321000,0.000000,50.292000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.387800,-1.535000,81.673700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.213300,-1.535000,82.499200>}
box{<0,0,-0.127000><1.167433,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.387800,-1.535000,81.673700> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.110000,0.000000,46.725000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.226000,0.000000,46.736000>}
box{<0,0,-0.254000><0.116520,0.035000,0.254000> rotate<0,-5.416665,0> translate<30.110000,0.000000,46.725000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.226000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.226000,0.000000,46.736000>}
box{<0,0,-0.254000><2.794000,0.035000,0.254000> rotate<0,-90.000000,0> translate<30.226000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.110000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.226000,0.000000,49.530000>}
box{<0,0,-0.254000><0.116000,0.035000,0.254000> rotate<0,0.000000,0> translate<30.110000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.110000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.226000,0.000000,49.657000>}
box{<0,0,-0.254000><0.172003,0.035000,0.254000> rotate<0,-47.588726,0> translate<30.110000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,67.868800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.238700,-1.535000,65.544700>}
box{<0,0,-0.127000><3.268863,0.035000,0.127000> rotate<0,45.311818,0> translate<27.940000,-1.535000,67.868800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.327600,-1.535000,69.126100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.327600,-1.535000,68.046600>}
box{<0,0,-0.127000><1.079500,0.035000,0.127000> rotate<0,-90.000000,0> translate<30.327600,-1.535000,68.046600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,-1.535000,77.724000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.327600,-1.535000,69.126100>}
box{<0,0,-0.127000><12.258448,0.035000,0.127000> rotate<0,44.535346,0> translate<21.590000,-1.535000,77.724000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.340300,0.000000,49.542700>}
box{<0,0,-0.203200><0.115003,0.035000,0.203200> rotate<0,-6.339773,0> translate<30.226000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607000,0.000000,68.580000>}
box{<0,0,-0.127000><1.397000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.210000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.861000,-1.535000,56.134000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.861000,-1.535000,51.409600>}
box{<0,0,-0.203200><4.724400,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.861000,-1.535000,51.409600> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<21.844000,0.000000,56.134000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.861000,0.000000,56.134000>}
box{<0,0,-0.254000><9.017000,0.035000,0.254000> rotate<0,0.000000,0> translate<21.844000,0.000000,56.134000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,0.000000,68.707000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.861000,0.000000,64.516000>}
box{<0,0,-0.127000><5.926969,0.035000,0.127000> rotate<0,44.997030,0> translate<26.670000,0.000000,68.707000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.861000,0.000000,63.754000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.861000,0.000000,64.516000>}
box{<0,0,-0.127000><0.762000,0.035000,0.127000> rotate<0,90.000000,0> translate<30.861000,0.000000,64.516000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.861000,-1.535000,69.342000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.861000,-1.535000,68.326000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,-90.000000,0> translate<30.861000,-1.535000,68.326000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.971000,-1.535000,78.232000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.861000,-1.535000,69.342000>}
box{<0,0,-0.127000><12.572359,0.035000,0.127000> rotate<0,44.997030,0> translate<21.971000,-1.535000,78.232000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.213300,-1.535000,82.499200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.064200,-1.535000,82.499200>}
box{<0,0,-0.127000><0.850900,0.035000,0.127000> rotate<0,0.000000,0> translate<30.213300,-1.535000,82.499200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.064200,-1.535000,82.499200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.115000,-1.535000,82.550000>}
box{<0,0,-0.127000><0.071842,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.064200,-1.535000,82.499200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.930600,0.000000,7.556500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.280100,0.000000,9.906000>}
box{<0,0,-0.127000><3.322695,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.930600,0.000000,7.556500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.369000,-1.535000,72.390000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.369000,-1.535000,68.707000>}
box{<0,0,-0.127000><3.683000,0.035000,0.127000> rotate<0,-90.000000,0> translate<31.369000,-1.535000,68.707000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.281900,-1.535000,83.743800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.369000,-1.535000,72.390000>}
box{<0,0,-0.127000><15.869233,0.035000,0.127000> rotate<0,45.677888,0> translate<20.281900,-1.535000,83.743800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<13.131800,-1.535000,17.411700>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<31.432500,-1.535000,17.411700>}
box{<0,0,-0.635000><18.300700,0.035000,0.635000> rotate<0,0.000000,0> translate<13.131800,-1.535000,17.411700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.184600,-1.535000,79.438500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.877000,-1.535000,76.746100>}
box{<0,0,-0.127000><3.807629,0.035000,0.127000> rotate<0,44.997030,0> translate<29.184600,-1.535000,79.438500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.327600,-1.535000,68.046600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.940500,-1.535000,66.306700>}
box{<0,0,-0.127000><2.372488,0.035000,0.127000> rotate<0,47.166145,0> translate<30.327600,-1.535000,68.046600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.359100,0.000000,8.089900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.991300,0.000000,11.722100>}
box{<0,0,-0.127000><5.136707,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.359100,0.000000,8.089900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.182600,-1.535000,84.302600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.132500,-1.535000,84.302600>}
box{<0,0,-0.127000><18.949900,0.035000,0.127000> rotate<0,0.000000,0> translate<13.182600,-1.535000,84.302600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.607000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.258000,0.000000,70.231000>}
box{<0,0,-0.127000><2.334867,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.607000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.861000,-1.535000,68.326000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.270700,-1.535000,66.840100>}
box{<0,0,-0.127000><2.048207,0.035000,0.127000> rotate<0,46.504366,0> translate<30.861000,-1.535000,68.326000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.238700,-1.535000,65.544700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,65.532000>}
box{<0,0,-0.127000><2.146338,0.035000,0.127000> rotate<0,0.339002,0> translate<30.238700,-1.535000,65.544700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.369000,-1.535000,68.707000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.537400,-1.535000,67.398900>}
box{<0,0,-0.127000><1.753934,0.035000,0.127000> rotate<0,48.225465,0> translate<31.369000,-1.535000,68.707000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.340300,0.000000,49.542700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.727900,0.000000,49.542700>}
box{<0,0,-0.203200><2.387600,0.035000,0.203200> rotate<0,0.000000,0> translate<30.340300,0.000000,49.542700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.861000,-1.535000,51.409600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.727900,-1.535000,49.542700>}
box{<0,0,-0.203200><2.640195,0.035000,0.203200> rotate<0,44.997030,0> translate<30.861000,-1.535000,51.409600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.280100,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.766000,0.000000,9.906000>}
box{<0,0,-0.127000><1.485900,0.035000,0.127000> rotate<0,0.000000,0> translate<31.280100,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<31.432500,-1.535000,17.411700>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<33.020000,-1.535000,18.999200>}
box{<0,0,-0.635000><2.245064,0.035000,0.635000> rotate<0,-44.997030,0> translate<31.432500,-1.535000,17.411700> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<33.020000,-1.535000,18.999200>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<33.020000,-1.535000,20.320000>}
box{<0,0,-0.635000><1.320800,0.035000,0.635000> rotate<0,90.000000,0> translate<33.020000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.991300,0.000000,11.722100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.312100,0.000000,11.722100>}
box{<0,0,-0.127000><1.320800,0.035000,0.127000> rotate<0,0.000000,0> translate<31.991300,0.000000,11.722100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.132500,-1.535000,84.302600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.535100,-1.535000,84.297000>}
box{<0,0,-0.127000><1.402611,0.035000,0.127000> rotate<0,0.228742,0> translate<32.132500,-1.535000,84.302600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.312100,0.000000,11.722100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.036000,0.000000,12.446000>}
box{<0,0,-0.127000><1.023749,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.312100,0.000000,11.722100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.947100,-1.535000,12.534900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.036000,-1.535000,12.446000>}
box{<0,0,-0.127000><0.125724,0.035000,0.127000> rotate<0,44.997030,0> translate<33.947100,-1.535000,12.534900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.766000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.544000,0.000000,8.128000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,44.997030,0> translate<32.766000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.537400,-1.535000,67.398900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.569400,-1.535000,67.398900>}
box{<0,0,-0.127000><2.032000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.537400,-1.535000,67.398900> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<29.565600,-1.535000,7.886700>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<34.645600,-1.535000,7.886700>}
box{<0,0,-0.635000><5.080000,0.035000,0.635000> rotate<0,0.000000,0> translate<29.565600,-1.535000,7.886700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,-1.535000,68.580000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.671000,-1.535000,70.231000>}
box{<0,0,-0.127000><2.334867,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.020000,-1.535000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<35.306000,-1.535000,10.541000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<35.306000,-1.535000,9.906000>}
box{<0,0,-0.635000><0.635000,0.035000,0.635000> rotate<0,-90.000000,0> translate<35.306000,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<34.645600,-1.535000,7.886700>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<35.331400,-1.535000,8.572500>}
box{<0,0,-0.635000><0.969868,0.035000,0.635000> rotate<0,-44.997030,0> translate<34.645600,-1.535000,7.886700> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<35.331400,-1.535000,8.572500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<35.331400,-1.535000,10.579100>}
box{<0,0,-0.635000><2.006600,0.035000,0.635000> rotate<0,90.000000,0> translate<35.331400,-1.535000,10.579100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.569400,-1.535000,67.398900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.560000,-1.535000,68.580000>}
box{<0,0,-0.127000><1.541521,0.035000,0.127000> rotate<0,-50.009813,0> translate<34.569400,-1.535000,67.398900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.947100,-1.535000,12.534900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.572700,-1.535000,14.160500>}
box{<0,0,-0.127000><2.298946,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.947100,-1.535000,12.534900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.655000,-1.535000,82.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.623500,-1.535000,83.781900>}
box{<0,0,-0.127000><2.322191,0.035000,0.127000> rotate<0,-32.036484,0> translate<33.655000,-1.535000,82.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.572700,-1.535000,14.160500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.814000,-1.535000,14.160500>}
box{<0,0,-0.127000><0.241300,0.035000,0.127000> rotate<0,0.000000,0> translate<35.572700,-1.535000,14.160500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.814000,-1.535000,14.160500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.915600,-1.535000,14.262100>}
box{<0,0,-0.127000><0.143684,0.035000,0.127000> rotate<0,-44.997030,0> translate<35.814000,-1.535000,14.160500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.655000,-1.535000,80.010000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.941000,-1.535000,77.724000>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,44.997030,0> translate<33.655000,-1.535000,80.010000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.205000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.195000,0.000000,31.115000>}
box{<0,0,-0.127000><7.990000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.205000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<35.306000,-1.535000,10.541000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.385500,-1.535000,11.620500>}
box{<0,0,-0.635000><1.526644,0.035000,0.635000> rotate<0,-44.997030,0> translate<35.306000,-1.535000,10.541000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.270700,-1.535000,66.840100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.461700,-1.535000,66.840100>}
box{<0,0,-0.127000><4.191000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.270700,-1.535000,66.840100> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<35.331400,-1.535000,10.579100>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.576000,-1.535000,11.823700>}
box{<0,0,-0.635000><1.760130,0.035000,0.635000> rotate<0,-44.997030,0> translate<35.331400,-1.535000,10.579100> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.576000,-1.535000,11.823700>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.576000,-1.535000,12.446000>}
box{<0,0,-0.635000><0.622300,0.035000,0.635000> rotate<0,90.000000,0> translate<36.576000,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.576000,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.576000,-1.535000,12.700000>}
box{<0,0,-0.635000><0.254000,0.035000,0.635000> rotate<0,90.000000,0> translate<36.576000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.385500,-1.535000,11.620500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.703000,-1.535000,11.938000>}
box{<0,0,-0.635000><0.449013,0.035000,0.635000> rotate<0,-44.997030,0> translate<36.385500,-1.535000,11.620500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.703000,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.703000,-1.535000,11.938000>}
box{<0,0,-0.635000><0.254000,0.035000,0.635000> rotate<0,-90.000000,0> translate<36.703000,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.576000,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.703000,-1.535000,12.192000>}
box{<0,0,-0.635000><0.283981,0.035000,0.635000> rotate<0,63.430762,0> translate<36.576000,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.623500,-1.535000,83.781900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.020500,-1.535000,83.781900>}
box{<0,0,-0.127000><1.397000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.623500,-1.535000,83.781900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.465000,-1.535000,60.452000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.465000,-1.535000,55.499000>}
box{<0,0,-0.127000><4.953000,0.035000,0.127000> rotate<0,-90.000000,0> translate<37.465000,-1.535000,55.499000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,65.532000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.465000,-1.535000,60.452000>}
box{<0,0,-0.127000><7.184205,0.035000,0.127000> rotate<0,44.997030,0> translate<32.385000,-1.535000,65.532000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<37.846000,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<37.846000,-1.535000,9.652000>}
box{<0,0,-0.635000><0.254000,0.035000,0.635000> rotate<0,-90.000000,0> translate<37.846000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<37.846000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<37.846000,-1.535000,9.906000>}
box{<0,0,-0.635000><0.254000,0.035000,0.635000> rotate<0,-90.000000,0> translate<37.846000,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.385500,-1.535000,11.620500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<37.846000,-1.535000,10.160000>}
box{<0,0,-0.635000><2.065459,0.035000,0.635000> rotate<0,44.997030,0> translate<36.385500,-1.535000,11.620500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.461700,-1.535000,66.840100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,-1.535000,68.580000>}
box{<0,0,-0.127000><2.389828,0.035000,0.127000> rotate<0,-46.719579,0> translate<36.461700,-1.535000,66.840100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.195000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.481000,0.000000,33.401000>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.195000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.940500,-1.535000,66.306700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.493700,-1.535000,66.306700>}
box{<0,0,-0.127000><6.553200,0.035000,0.127000> rotate<0,0.000000,0> translate<31.940500,-1.535000,66.306700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.471600,0.000000,70.180200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.471600,0.000000,64.211200>}
box{<0,0,-0.127000><5.969000,0.035000,0.127000> rotate<0,-90.000000,0> translate<39.471600,0.000000,64.211200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.258000,0.000000,70.231000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.471600,0.000000,70.180200>}
box{<0,0,-0.127000><7.213779,0.035000,0.127000> rotate<0,0.403458,0> translate<32.258000,0.000000,70.231000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<37.846000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<39.624000,-1.535000,7.874000>}
box{<0,0,-0.635000><2.514472,0.035000,0.635000> rotate<0,44.997030,0> translate<37.846000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.471600,0.000000,70.180200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.624000,0.000000,70.739000>}
box{<0,0,-0.127000><0.579209,0.035000,0.127000> rotate<0,-74.739948,0> translate<39.471600,0.000000,70.180200> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<30.861000,0.000000,56.134000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<40.132000,0.000000,56.134000>}
box{<0,0,-0.254000><9.271000,0.035000,0.254000> rotate<0,0.000000,0> translate<30.861000,0.000000,56.134000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.471600,0.000000,64.211200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.132000,0.000000,63.754000>}
box{<0,0,-0.127000><0.803219,0.035000,0.127000> rotate<0,34.692864,0> translate<39.471600,0.000000,64.211200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.493700,-1.535000,66.306700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.640000,-1.535000,68.580000>}
box{<0,0,-0.127000><3.126419,0.035000,0.127000> rotate<0,-46.642899,0> translate<38.493700,-1.535000,66.306700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.877000,-1.535000,76.746100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.808400,-1.535000,76.746100>}
box{<0,0,-0.127000><9.931400,0.035000,0.127000> rotate<0,0.000000,0> translate<31.877000,-1.535000,76.746100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.624000,0.000000,70.739000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.910000,0.000000,73.025000>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,-44.997030,0> translate<39.624000,0.000000,70.739000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.020500,-1.535000,83.781900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.926000,-1.535000,78.232000>}
box{<0,0,-0.127000><8.104093,0.035000,0.127000> rotate<0,43.219136,0> translate<37.020500,-1.535000,83.781900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.205400,0.000000,68.605400>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,-44.997030,0> translate<43.180000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.205400,0.000000,70.789800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.205400,0.000000,68.605400>}
box{<0,0,-0.127000><2.184400,0.035000,0.127000> rotate<0,-90.000000,0> translate<43.205400,0.000000,68.605400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.465000,-1.535000,55.499000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.815000,-1.535000,49.149000>}
box{<0,0,-0.127000><8.980256,0.035000,0.127000> rotate<0,44.997030,0> translate<37.465000,-1.535000,55.499000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.205400,0.000000,70.789800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.878500,0.000000,71.462900>}
box{<0,0,-0.127000><0.951907,0.035000,0.127000> rotate<0,-44.997030,0> translate<43.205400,0.000000,70.789800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.878500,0.000000,72.809100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.878500,0.000000,71.462900>}
box{<0,0,-0.127000><1.346200,0.035000,0.127000> rotate<0,-90.000000,0> translate<43.878500,0.000000,71.462900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.878500,-1.535000,74.676000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.878500,-1.535000,72.809100>}
box{<0,0,-0.127000><1.866900,0.035000,0.127000> rotate<0,-90.000000,0> translate<43.878500,-1.535000,72.809100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.808400,-1.535000,76.746100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.878500,-1.535000,74.676000>}
box{<0,0,-0.127000><2.927563,0.035000,0.127000> rotate<0,44.997030,0> translate<41.808400,-1.535000,76.746100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.941000,-1.535000,77.724000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.069000,-1.535000,77.724000>}
box{<0,0,-0.127000><8.128000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.941000,-1.535000,77.724000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.671000,-1.535000,70.231000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.577000,-1.535000,70.231000>}
box{<0,0,-0.127000><9.906000,0.035000,0.127000> rotate<0,0.000000,0> translate<34.671000,-1.535000,70.231000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.602400,0.000000,70.129400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.602400,0.000000,67.970400>}
box{<0,0,-0.127000><2.159000,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.602400,0.000000,67.970400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.577000,0.000000,70.231000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.602400,0.000000,70.129400>}
box{<0,0,-0.127000><0.104727,0.035000,0.127000> rotate<0,75.958743,0> translate<44.577000,0.000000,70.231000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.602400,0.000000,70.129400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.704000,0.000000,72.009000>}
box{<0,0,-0.127000><1.882344,0.035000,0.127000> rotate<0,-86.900206,0> translate<44.602400,0.000000,70.129400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.690000,0.000000,42.655000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.898800,0.000000,42.655000>}
box{<0,0,-0.127000><32.208800,0.035000,0.127000> rotate<0,0.000000,0> translate<12.690000,0.000000,42.655000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.898800,0.000000,42.655000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.364400,0.000000,42.189400>}
box{<0,0,-0.127000><0.658458,0.035000,0.127000> rotate<0,44.997030,0> translate<44.898800,0.000000,42.655000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.704000,0.000000,72.009000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.720000,0.000000,73.025000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.704000,0.000000,72.009000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.544000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.482000,0.000000,8.128000>}
box{<0,0,-0.127000><11.938000,0.035000,0.127000> rotate<0,0.000000,0> translate<34.544000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.720000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.371000,0.000000,70.231000>}
box{<0,0,-0.127000><2.334867,0.035000,0.127000> rotate<0,-44.997030,0> translate<45.720000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.482000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.133000,0.000000,9.779000>}
box{<0,0,-0.127000><2.334867,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.482000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.145700,-1.535000,14.262100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.145700,-1.535000,14.211300>}
box{<0,0,-0.127000><0.050800,0.035000,0.127000> rotate<0,-90.000000,0> translate<48.145700,-1.535000,14.211300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.915600,-1.535000,14.262100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.145700,-1.535000,14.262100>}
box{<0,0,-0.127000><12.230100,0.035000,0.127000> rotate<0,0.000000,0> translate<35.915600,-1.535000,14.262100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.815000,0.000000,49.149000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,0.000000,49.149000>}
box{<0,0,-0.127000><4.445000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.815000,0.000000,49.149000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.133000,0.000000,9.779000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.641000,0.000000,9.779000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,0.000000,0> translate<48.133000,0.000000,9.779000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.641000,0.000000,9.779000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.641000,0.000000,9.906000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,90.000000,0> translate<48.641000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.926000,-1.535000,78.232000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.768000,-1.535000,78.232000>}
box{<0,0,-0.127000><5.842000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.926000,-1.535000,78.232000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.602400,0.000000,67.970400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.022000,0.000000,63.754000>}
box{<0,0,-0.127000><6.108264,0.035000,0.127000> rotate<0,43.649232,0> translate<44.602400,0.000000,67.970400> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<40.132000,0.000000,56.134000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<49.149000,0.000000,56.134000>}
box{<0,0,-0.254000><9.017000,0.035000,0.254000> rotate<0,0.000000,0> translate<40.132000,0.000000,56.134000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.022000,0.000000,63.754000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.149000,0.000000,63.754000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,0.000000,0> translate<49.022000,0.000000,63.754000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<39.624000,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<49.403000,-1.535000,7.874000>}
box{<0,0,-0.635000><9.779000,0.035000,0.635000> rotate<0,0.000000,0> translate<39.624000,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,-1.535000,82.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.542700,-1.535000,81.292700>}
box{<0,0,-0.127000><1.796141,0.035000,0.127000> rotate<0,44.424129,0> translate<48.260000,-1.535000,82.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.542700,-1.535000,79.590900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.542700,-1.535000,81.292700>}
box{<0,0,-0.127000><1.701800,0.035000,0.127000> rotate<0,90.000000,0> translate<49.542700,-1.535000,81.292700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.145700,-1.535000,14.211300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.911000,-1.535000,12.446000>}
box{<0,0,-0.127000><2.496511,0.035000,0.127000> rotate<0,44.997030,0> translate<48.145700,-1.535000,14.211300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.872900,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.911000,-1.535000,12.446000>}
box{<0,0,-0.127000><0.038100,0.035000,0.127000> rotate<0,0.000000,0> translate<49.872900,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.542700,-1.535000,79.590900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.380900,-1.535000,78.701900>}
box{<0,0,-0.127000><1.221843,0.035000,0.127000> rotate<0,46.681603,0> translate<49.542700,-1.535000,79.590900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.641000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.419000,0.000000,8.128000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,44.997030,0> translate<48.641000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.380900,-1.535000,78.701900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825400,-1.535000,78.701900>}
box{<0,0,-0.127000><0.444500,0.035000,0.127000> rotate<0,0.000000,0> translate<50.380900,-1.535000,78.701900> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<49.403000,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<51.181000,-1.535000,9.652000>}
box{<0,0,-0.635000><2.514472,0.035000,0.635000> rotate<0,-44.997030,0> translate<49.403000,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<51.181000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<51.181000,-1.535000,9.906000>}
box{<0,0,-0.635000><0.254000,0.035000,0.635000> rotate<0,90.000000,0> translate<51.181000,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<51.181000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<51.181000,0.000000,10.795000>}
box{<0,0,-0.635000><0.889000,0.035000,0.635000> rotate<0,90.000000,0> translate<51.181000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.935000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.308000,0.000000,40.640000>}
box{<0,0,-0.127000><24.373000,0.035000,0.127000> rotate<0,0.000000,0> translate<26.935000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.911000,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.689000,-1.535000,14.224000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,-44.997030,0> translate<49.911000,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<51.181000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.133500,0.000000,11.747500>}
box{<0,0,-0.635000><1.347038,0.035000,0.635000> rotate<0,-44.997030,0> translate<51.181000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.133500,0.000000,11.747500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.451000,0.000000,12.065000>}
box{<0,0,-0.635000><0.449013,0.035000,0.635000> rotate<0,-44.997030,0> translate<52.133500,0.000000,11.747500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.451000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.451000,0.000000,12.446000>}
box{<0,0,-0.635000><0.381000,0.035000,0.635000> rotate<0,90.000000,0> translate<52.451000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.733000,-1.535000,46.609000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.578000,-1.535000,46.609000>}
box{<0,0,-0.127000><29.845000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.733000,-1.535000,46.609000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,-1.535000,80.010000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.578000,-1.535000,78.232000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,44.997030,0> translate<50.800000,-1.535000,80.010000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,0.000000,82.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.578000,0.000000,84.328000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,-44.997030,0> translate<50.800000,0.000000,82.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.578000,-1.535000,46.609000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.200300,-1.535000,47.231300>}
box{<0,0,-0.127000><0.880065,0.035000,0.127000> rotate<0,-44.997030,0> translate<52.578000,-1.535000,46.609000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.069000,-1.535000,77.724000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.213000,-1.535000,68.580000>}
box{<0,0,-0.127000><12.931569,0.035000,0.127000> rotate<0,44.997030,0> translate<44.069000,-1.535000,77.724000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<53.721000,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<53.721000,-1.535000,9.652000>}
box{<0,0,-0.635000><0.254000,0.035000,0.635000> rotate<0,-90.000000,0> translate<53.721000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<53.721000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<53.721000,0.000000,9.906000>}
box{<0,0,-0.635000><0.254000,0.035000,0.635000> rotate<0,-90.000000,0> translate<53.721000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<52.133500,0.000000,11.747500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<53.721000,0.000000,10.160000>}
box{<0,0,-0.635000><2.245064,0.035000,0.635000> rotate<0,44.997030,0> translate<52.133500,0.000000,11.747500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.578000,-1.535000,78.232000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.848000,-1.535000,78.232000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<52.578000,-1.535000,78.232000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.548600,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.483000,0.000000,17.068800>}
box{<0,0,-0.127000><33.934400,0.035000,0.127000> rotate<0,0.000000,0> translate<20.548600,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.483000,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.495700,0.000000,17.056100>}
box{<0,0,-0.127000><0.017961,0.035000,0.127000> rotate<0,44.997030,0> translate<54.483000,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.535100,-1.535000,84.297000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.794100,-1.535000,84.297000>}
box{<0,0,-0.127000><21.259000,0.035000,0.127000> rotate<0,0.000000,0> translate<33.535100,-1.535000,84.297000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<53.721000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<55.499000,-1.535000,7.874000>}
box{<0,0,-0.635000><2.514472,0.035000,0.635000> rotate<0,44.997030,0> translate<53.721000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.200300,-1.535000,47.231300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.753000,-1.535000,47.231300>}
box{<0,0,-0.127000><2.552700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.200300,-1.535000,47.231300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.213000,-1.535000,68.580000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,68.580000>}
box{<0,0,-0.127000><2.667000,0.035000,0.127000> rotate<0,0.000000,0> translate<53.213000,-1.535000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.205000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.388000,0.000000,26.035000>}
box{<0,0,-0.127000><28.183000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.205000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.578000,0.000000,84.328000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.426100,0.000000,84.328000>}
box{<0,0,-0.127000><3.848100,0.035000,0.127000> rotate<0,0.000000,0> translate<52.578000,0.000000,84.328000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.600000,0.000000,36.449000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.769000,0.000000,36.449000>}
box{<0,0,-0.127000><39.169000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.600000,0.000000,36.449000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.769000,-1.535000,46.215300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.769000,-1.535000,44.107100>}
box{<0,0,-0.127000><2.108200,0.035000,0.127000> rotate<0,-90.000000,0> translate<56.769000,-1.535000,44.107100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.753000,-1.535000,47.231300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.769000,-1.535000,46.215300>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,44.997030,0> translate<55.753000,-1.535000,47.231300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.591000,0.000000,51.562000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,0.000000,51.562000>}
box{<0,0,-0.127000><27.559000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.591000,0.000000,51.562000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.507200,0.000000,17.729200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.251600,0.000000,17.729200>}
box{<0,0,-0.127000><37.744400,0.035000,0.127000> rotate<0,0.000000,0> translate<19.507200,0.000000,17.729200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.251600,0.000000,70.218300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.251600,0.000000,64.503300>}
box{<0,0,-0.127000><5.715000,0.035000,0.127000> rotate<0,-90.000000,0> translate<57.251600,0.000000,64.503300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.371000,0.000000,70.231000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.251600,0.000000,70.218300>}
box{<0,0,-0.127000><9.880608,0.035000,0.127000> rotate<0,0.073640,0> translate<47.371000,0.000000,70.231000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.769000,-1.535000,44.107100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.365900,-1.535000,43.510200>}
box{<0,0,-0.127000><0.844144,0.035000,0.127000> rotate<0,44.997030,0> translate<56.769000,-1.535000,44.107100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.251600,0.000000,70.218300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.404000,0.000000,71.374000>}
box{<0,0,-0.127000><1.165705,0.035000,0.127000> rotate<0,-82.482412,0> translate<57.251600,0.000000,70.218300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.251600,0.000000,17.729200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.531000,0.000000,18.008600>}
box{<0,0,-0.127000><0.395131,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.251600,0.000000,17.729200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.531000,0.000000,18.008600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.531000,0.000000,28.409900>}
box{<0,0,-0.127000><10.401300,0.035000,0.127000> rotate<0,90.000000,0> translate<57.531000,0.000000,28.409900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.365900,-1.535000,43.510200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.531000,-1.535000,43.510200>}
box{<0,0,-0.127000><0.165100,0.035000,0.127000> rotate<0,0.000000,0> translate<57.365900,-1.535000,43.510200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.531000,-1.535000,43.510200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.556400,-1.535000,43.484800>}
box{<0,0,-0.127000><0.035921,0.035000,0.127000> rotate<0,44.997030,0> translate<57.531000,-1.535000,43.510200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.531000,0.000000,28.409900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.632600,0.000000,28.511500>}
box{<0,0,-0.127000><0.143684,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.531000,0.000000,28.409900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.632600,0.000000,28.511500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.632600,0.000000,28.524200>}
box{<0,0,-0.127000><0.012700,0.035000,0.127000> rotate<0,90.000000,0> translate<57.632600,0.000000,28.524200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.495700,0.000000,17.056100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.810400,0.000000,17.056100>}
box{<0,0,-0.127000><3.314700,0.035000,0.127000> rotate<0,0.000000,0> translate<54.495700,0.000000,17.056100> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<49.149000,0.000000,56.134000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<58.166000,0.000000,56.134000>}
box{<0,0,-0.254000><9.017000,0.035000,0.254000> rotate<0,0.000000,0> translate<49.149000,0.000000,56.134000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.251600,0.000000,64.503300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.166000,0.000000,63.754000>}
box{<0,0,-0.127000><1.182192,0.035000,0.127000> rotate<0,39.330119,0> translate<57.251600,0.000000,64.503300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.810400,0.000000,17.056100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.267600,0.000000,17.513300>}
box{<0,0,-0.127000><0.646578,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.810400,0.000000,17.056100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.267600,0.000000,17.513300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.267600,0.000000,28.041600>}
box{<0,0,-0.127000><10.528300,0.035000,0.127000> rotate<0,90.000000,0> translate<58.267600,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.768000,-1.535000,78.232000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,68.580000>}
box{<0,0,-0.127000><13.649989,0.035000,0.127000> rotate<0,44.997030,0> translate<48.768000,-1.535000,78.232000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<58.293000,0.000000,45.538000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<58.448800,0.000000,45.382200>}
box{<0,0,-0.254000><0.220334,0.035000,0.254000> rotate<0,44.997030,0> translate<58.293000,0.000000,45.538000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.448800,-1.535000,55.851200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.448800,-1.535000,45.382200>}
box{<0,0,-0.304800><10.469000,0.035000,0.304800> rotate<0,-90.000000,0> translate<58.448800,-1.535000,45.382200> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<58.166000,-1.535000,56.134000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<58.448800,-1.535000,55.851200>}
box{<0,0,-0.254000><0.399940,0.035000,0.254000> rotate<0,44.997030,0> translate<58.166000,-1.535000,56.134000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<58.448800,0.000000,45.382200>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<58.945800,0.000000,45.382200>}
box{<0,0,-0.254000><0.497000,0.035000,0.254000> rotate<0,0.000000,0> translate<58.448800,0.000000,45.382200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.404000,0.000000,71.374000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.055000,0.000000,73.025000>}
box{<0,0,-0.127000><2.334867,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.404000,0.000000,71.374000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<58.945800,0.000000,45.382200>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<59.245500,0.000000,45.681900>}
box{<0,0,-0.254000><0.423840,0.035000,0.254000> rotate<0,-44.997030,0> translate<58.945800,0.000000,45.382200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.267600,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.309000,0.000000,29.083000>}
box{<0,0,-0.127000><1.472762,0.035000,0.127000> rotate<0,-44.997030,0> translate<58.267600,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.556400,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.410600,-1.535000,43.484800>}
box{<0,0,-0.127000><1.854200,0.035000,0.127000> rotate<0,0.000000,0> translate<57.556400,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.364400,-1.535000,42.189400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.740800,-1.535000,27.813000>}
box{<0,0,-0.127000><20.331300,0.035000,0.127000> rotate<0,44.997030,0> translate<45.364400,-1.535000,42.189400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.410600,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.756800,-1.535000,44.831000>}
box{<0,0,-0.127000><1.903814,0.035000,0.127000> rotate<0,-44.997030,0> translate<59.410600,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.756800,-1.535000,44.831000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.756800,-1.535000,54.635400>}
box{<0,0,-0.127000><9.804400,0.035000,0.127000> rotate<0,90.000000,0> translate<60.756800,-1.535000,54.635400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.825400,-1.535000,78.701900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.960000,-1.535000,68.580000>}
box{<0,0,-0.127000><14.323511,0.035000,0.127000> rotate<0,44.961110,0> translate<50.825400,-1.535000,78.701900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.740800,-1.535000,27.813000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.048900,-1.535000,27.813000>}
box{<0,0,-0.127000><1.308100,0.035000,0.127000> rotate<0,0.000000,0> translate<59.740800,-1.535000,27.813000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.632600,0.000000,28.524200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.163200,0.000000,32.054800>}
box{<0,0,-0.127000><4.993022,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.632600,0.000000,28.524200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.309000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.544200,0.000000,31.330900>}
box{<0,0,-0.127000><3.170043,0.035000,0.127000> rotate<0,-45.159330,0> translate<59.309000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.756800,-1.535000,54.635400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.595000,-1.535000,55.473600>}
box{<0,0,-0.127000><1.185394,0.035000,0.127000> rotate<0,-44.997030,0> translate<60.756800,-1.535000,54.635400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.595000,-1.535000,55.473600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.595000,-1.535000,59.055000>}
box{<0,0,-0.127000><3.581400,0.035000,0.127000> rotate<0,90.000000,0> translate<61.595000,-1.535000,59.055000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.481000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.722000,0.000000,33.401000>}
box{<0,0,-0.127000><23.241000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.481000,0.000000,33.401000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.103000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.103000,-1.535000,57.658000>}
box{<0,0,-0.127000><6.858000,0.035000,0.127000> rotate<0,90.000000,0> translate<62.103000,-1.535000,57.658000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.163200,0.000000,32.054800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.242700,0.000000,32.054800>}
box{<0,0,-0.127000><1.079500,0.035000,0.127000> rotate<0,0.000000,0> translate<61.163200,0.000000,32.054800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.419000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.357000,0.000000,8.128000>}
box{<0,0,-0.127000><11.938000,0.035000,0.127000> rotate<0,0.000000,0> translate<50.419000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.544200,0.000000,31.330900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.484000,0.000000,31.330900>}
box{<0,0,-0.127000><0.939800,0.035000,0.127000> rotate<0,0.000000,0> translate<61.544200,0.000000,31.330900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.426100,0.000000,84.328000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.585600,0.000000,78.168500>}
box{<0,0,-0.127000><8.710848,0.035000,0.127000> rotate<0,44.997030,0> translate<56.426100,0.000000,84.328000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.048900,0.000000,27.813000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.598300,0.000000,29.362400>}
box{<0,0,-0.127000><2.191182,0.035000,0.127000> rotate<0,-44.997030,0> translate<61.048900,0.000000,27.813000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<59.245500,0.000000,45.681900>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<62.699900,0.000000,45.681900>}
box{<0,0,-0.254000><3.454400,0.035000,0.254000> rotate<0,0.000000,0> translate<59.245500,0.000000,45.681900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.103000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.738000,0.000000,50.165000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,44.997030,0> translate<62.103000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.738000,0.000000,48.955000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.738000,0.000000,50.165000>}
box{<0,0,-0.127000><1.210000,0.035000,0.127000> rotate<0,90.000000,0> translate<62.738000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,0.000000,49.149000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.865000,0.000000,34.544000>}
box{<0,0,-0.127000><20.654589,0.035000,0.127000> rotate<0,44.997030,0> translate<48.260000,0.000000,49.149000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.103000,-1.535000,57.658000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.373000,-1.535000,58.928000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<62.103000,-1.535000,57.658000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.373000,-1.535000,58.928000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.373000,-1.535000,65.786000>}
box{<0,0,-0.127000><6.858000,0.035000,0.127000> rotate<0,90.000000,0> translate<63.373000,-1.535000,65.786000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,0.000000,51.181000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,0.000000,49.530000>}
box{<0,0,-0.127000><1.651000,0.035000,0.127000> rotate<0,-90.000000,0> translate<63.500000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.131700,0.000000,52.313000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,0.000000,51.181000>}
box{<0,0,-0.127000><1.190407,0.035000,0.127000> rotate<0,71.972778,0> translate<63.131700,0.000000,52.313000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.848000,-1.535000,78.232000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,-1.535000,68.580000>}
box{<0,0,-0.127000><13.649989,0.035000,0.127000> rotate<0,44.997030,0> translate<53.848000,-1.535000,78.232000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.689000,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.627000,-1.535000,14.224000>}
box{<0,0,-0.127000><11.938000,0.035000,0.127000> rotate<0,0.000000,0> translate<51.689000,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.881000,-1.535000,50.673000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.881000,-1.535000,63.754000>}
box{<0,0,-0.127000><13.081000,0.035000,0.127000> rotate<0,90.000000,0> translate<63.881000,-1.535000,63.754000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.308000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.008000,-1.535000,27.940000>}
box{<0,0,-0.127000><17.960512,0.035000,0.127000> rotate<0,44.997030,0> translate<51.308000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.008000,0.000000,41.021000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.008000,0.000000,43.755000>}
box{<0,0,-0.127000><2.734000,0.035000,0.127000> rotate<0,90.000000,0> translate<64.008000,0.000000,43.755000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.008000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.008000,0.000000,48.955000>}
box{<0,0,-0.127000><0.067000,0.035000,0.127000> rotate<0,-90.000000,0> translate<64.008000,0.000000,48.955000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.008000,0.000000,49.022000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<63.500000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.357000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.135000,0.000000,9.906000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,-44.997030,0> translate<62.357000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.242700,0.000000,32.054800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.262000,0.000000,34.074100>}
box{<0,0,-0.127000><2.855721,0.035000,0.127000> rotate<0,-44.997030,0> translate<62.242700,0.000000,32.054800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.262000,0.000000,34.074100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.262000,0.000000,37.846000>}
box{<0,0,-0.127000><3.771900,0.035000,0.127000> rotate<0,90.000000,0> translate<64.262000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.262000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.262000,0.000000,40.640000>}
box{<0,0,-0.127000><2.794000,0.035000,0.127000> rotate<0,90.000000,0> translate<64.262000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.262000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.378000,0.000000,40.640000>}
box{<0,0,-0.127000><0.116000,0.035000,0.127000> rotate<0,0.000000,0> translate<64.262000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.008000,0.000000,41.021000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.389000,0.000000,40.640000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,44.997030,0> translate<64.008000,0.000000,41.021000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.378000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.389000,0.000000,40.640000>}
box{<0,0,-0.127000><0.011000,0.035000,0.127000> rotate<0,0.000000,0> translate<64.378000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.135000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.516000,0.000000,9.906000>}
box{<0,0,-0.127000><0.381000,0.035000,0.127000> rotate<0,0.000000,0> translate<64.135000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.598300,0.000000,29.362400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.731900,0.000000,29.362400>}
box{<0,0,-0.127000><2.133600,0.035000,0.127000> rotate<0,0.000000,0> translate<62.598300,0.000000,29.362400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,0.000000,51.181000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.922400,0.000000,52.730400>}
box{<0,0,-0.127000><2.103298,0.035000,0.127000> rotate<0,-47.443917,0> translate<63.500000,0.000000,51.181000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<55.499000,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<65.278000,-1.535000,7.874000>}
box{<0,0,-0.635000><9.779000,0.035000,0.635000> rotate<0,0.000000,0> translate<55.499000,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.278000,0.000000,42.037000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.278000,0.000000,43.755000>}
box{<0,0,-0.127000><1.718000,0.035000,0.127000> rotate<0,90.000000,0> translate<65.278000,0.000000,43.755000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.278000,0.000000,48.955000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.278000,0.000000,49.911000>}
box{<0,0,-0.127000><0.956000,0.035000,0.127000> rotate<0,90.000000,0> translate<65.278000,0.000000,49.911000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.731900,0.000000,29.362400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.392300,0.000000,28.702000>}
box{<0,0,-0.127000><0.933947,0.035000,0.127000> rotate<0,44.997030,0> translate<64.731900,0.000000,29.362400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.627000,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.405000,-1.535000,12.446000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,44.997030,0> translate<63.627000,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.405000,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.786000,-1.535000,12.446000>}
box{<0,0,-0.127000><0.381000,0.035000,0.127000> rotate<0,0.000000,0> translate<65.405000,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.135000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.913000,0.000000,8.128000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,44.997030,0> translate<64.135000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<66.040000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<66.040000,0.000000,31.115000>}
box{<0,0,-0.254000><2.413000,0.035000,0.254000> rotate<0,-90.000000,0> translate<66.040000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.278000,0.000000,49.911000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.040000,0.000000,50.673000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<65.278000,0.000000,49.911000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.024000,0.000000,51.066700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.040000,0.000000,51.816000>}
box{<0,0,-0.127000><1.262421,0.035000,0.127000> rotate<0,-36.406372,0> translate<65.024000,0.000000,51.066700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.373000,-1.535000,65.786000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.040000,-1.535000,68.453000>}
box{<0,0,-0.127000><3.771708,0.035000,0.127000> rotate<0,-44.997030,0> translate<63.373000,-1.535000,65.786000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.040000,-1.535000,68.453000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.040000,-1.535000,68.580000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,90.000000,0> translate<66.040000,-1.535000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.278000,0.000000,42.037000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.167000,0.000000,41.148000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,44.997030,0> translate<65.278000,0.000000,42.037000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.167000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.167000,0.000000,41.148000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,90.000000,0> translate<66.167000,0.000000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.881000,-1.535000,50.673000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.167000,-1.535000,48.387000>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,44.997030,0> translate<63.881000,-1.535000,50.673000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.116200,-1.535000,46.901100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.167000,-1.535000,48.387000>}
box{<0,0,-0.127000><1.486768,0.035000,0.127000> rotate<0,-88.036122,0> translate<66.116200,-1.535000,46.901100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.167000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.178000,0.000000,40.640000>}
box{<0,0,-0.127000><0.011000,0.035000,0.127000> rotate<0,0.000000,0> translate<66.167000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.178000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.294000,0.000000,40.640000>}
box{<0,0,-0.127000><0.116000,0.035000,0.127000> rotate<0,0.000000,0> translate<66.178000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.294000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.294000,0.000000,40.640000>}
box{<0,0,-0.127000><2.286000,0.035000,0.127000> rotate<0,90.000000,0> translate<66.294000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.116200,0.000000,46.901100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.548000,0.000000,47.498000>}
box{<0,0,-0.127000><0.736709,0.035000,0.127000> rotate<0,-54.114291,0> translate<66.116200,0.000000,46.901100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.548000,0.000000,47.498000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.548000,0.000000,48.955000>}
box{<0,0,-0.127000><1.457000,0.035000,0.127000> rotate<0,90.000000,0> translate<66.548000,0.000000,48.955000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.770000,-1.535000,82.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.548000,-1.535000,84.328000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,-44.997030,0> translate<64.770000,-1.535000,82.550000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<66.548000,0.000000,43.755000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<66.560700,0.000000,45.326300>}
box{<0,0,-0.254000><1.571351,0.035000,0.254000> rotate<0,-89.531009,0> translate<66.548000,0.000000,43.755000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.040000,0.000000,50.673000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.560700,0.000000,52.236800>}
box{<0,0,-0.127000><1.648211,0.035000,0.127000> rotate<0,-71.579015,0> translate<66.040000,0.000000,50.673000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.040000,0.000000,51.816000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.560700,0.000000,52.236800>}
box{<0,0,-0.127000><0.669478,0.035000,0.127000> rotate<0,-38.940594,0> translate<66.040000,0.000000,51.816000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<66.382900,0.000000,54.025800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<66.560700,0.000000,54.036800>}
box{<0,0,-0.254000><0.178140,0.035000,0.254000> rotate<0,-3.539987,0> translate<66.382900,0.000000,54.025800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.484000,0.000000,31.330900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.675000,0.000000,35.509200>}
box{<0,0,-0.127000><5.917996,0.035000,0.127000> rotate<0,-44.910092,0> translate<62.484000,0.000000,31.330900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.675000,0.000000,35.509200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.675000,0.000000,37.846000>}
box{<0,0,-0.127000><2.336800,0.035000,0.127000> rotate<0,90.000000,0> translate<66.675000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<66.548000,0.000000,43.755000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<66.675000,0.000000,43.561000>}
box{<0,0,-0.254000><0.231873,0.035000,0.254000> rotate<0,56.785923,0> translate<66.548000,0.000000,43.755000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.294000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.802000,0.000000,37.846000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<66.294000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.675000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.802000,0.000000,37.846000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,0.000000,0> translate<66.675000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<62.699900,0.000000,45.681900>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<66.967100,0.000000,45.669200>}
box{<0,0,-0.254000><4.267219,0.035000,0.254000> rotate<0,0.170511,0> translate<62.699900,0.000000,45.681900> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<66.560700,0.000000,45.326300>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<66.967100,0.000000,45.669200>}
box{<0,0,-0.254000><0.531734,0.035000,0.254000> rotate<0,-40.153349,0> translate<66.560700,0.000000,45.326300> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<65.278000,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<67.056000,-1.535000,9.652000>}
box{<0,0,-0.635000><2.514472,0.035000,0.635000> rotate<0,-44.997030,0> translate<65.278000,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<67.056000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<67.056000,-1.535000,9.906000>}
box{<0,0,-0.635000><0.254000,0.035000,0.635000> rotate<0,90.000000,0> translate<67.056000,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<67.056000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<67.056000,0.000000,10.795000>}
box{<0,0,-0.635000><0.889000,0.035000,0.635000> rotate<0,90.000000,0> translate<67.056000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.722000,-1.535000,33.401000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.056000,-1.535000,33.401000>}
box{<0,0,-0.127000><5.334000,0.035000,0.127000> rotate<0,0.000000,0> translate<61.722000,-1.535000,33.401000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.769000,-1.535000,36.449000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.081400,-1.535000,46.228000>}
box{<0,0,-0.127000><14.211771,0.035000,0.127000> rotate<0,-43.476361,0> translate<56.769000,-1.535000,36.449000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.068700,-1.535000,50.482500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.081400,-1.535000,46.228000>}
box{<0,0,-0.127000><4.254519,0.035000,0.127000> rotate<0,89.823040,0> translate<67.068700,-1.535000,50.482500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.405000,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.183000,-1.535000,14.224000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,-44.997030,0> translate<65.405000,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.310000,-1.535000,77.470000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.310000,-1.535000,80.010000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,90.000000,0> translate<67.310000,-1.535000,80.010000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<67.056000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.008500,0.000000,11.747500>}
box{<0,0,-0.635000><1.347038,0.035000,0.635000> rotate<0,-44.997030,0> translate<67.056000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<66.040000,-1.535000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<68.072000,-1.535000,31.115000>}
box{<0,0,-0.254000><2.032000,0.035000,0.254000> rotate<0,0.000000,0> translate<66.040000,-1.535000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<66.382900,0.000000,54.025800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<68.287900,0.000000,54.025800>}
box{<0,0,-0.254000><1.905000,0.035000,0.254000> rotate<0,0.000000,0> translate<66.382900,0.000000,54.025800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.008500,0.000000,11.747500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.326000,0.000000,12.065000>}
box{<0,0,-0.635000><0.449013,0.035000,0.635000> rotate<0,-44.997030,0> translate<68.008500,0.000000,11.747500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.326000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.326000,0.000000,12.446000>}
box{<0,0,-0.635000><0.381000,0.035000,0.635000> rotate<0,90.000000,0> translate<68.326000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<66.560700,0.000000,45.326300>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<68.364100,0.000000,46.951900>}
box{<0,0,-0.254000><2.427926,0.035000,0.254000> rotate<0,-42.028992,0> translate<66.560700,0.000000,45.326300> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<68.287900,0.000000,54.025800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<68.364100,0.000000,46.951900>}
box{<0,0,-0.254000><7.074310,0.035000,0.254000> rotate<0,89.376935,0> translate<68.287900,0.000000,54.025800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.922400,-1.535000,52.730400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.440300,-1.535000,56.210200>}
box{<0,0,-0.127000><4.948194,0.035000,0.127000> rotate<0,-44.685099,0> translate<64.922400,-1.535000,52.730400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.310000,-1.535000,82.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.465700,-1.535000,83.769200>}
box{<0,0,-0.127000><1.679908,0.035000,0.127000> rotate<0,-46.528537,0> translate<67.310000,-1.535000,82.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.881000,-1.535000,63.754000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.580000,-1.535000,68.453000>}
box{<0,0,-0.127000><6.645390,0.035000,0.127000> rotate<0,-44.997030,0> translate<63.881000,-1.535000,63.754000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.580000,-1.535000,68.453000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.580000,-1.535000,68.580000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,90.000000,0> translate<68.580000,-1.535000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<66.040000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<68.707000,0.000000,36.195000>}
box{<0,0,-0.254000><3.771708,0.035000,0.254000> rotate<0,-44.997030,0> translate<66.040000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<68.707000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<68.707000,0.000000,36.195000>}
box{<0,0,-0.254000><5.334000,0.035000,0.254000> rotate<0,-90.000000,0> translate<68.707000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<66.675000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<68.707000,0.000000,41.529000>}
box{<0,0,-0.254000><2.873682,0.035000,0.254000> rotate<0,44.997030,0> translate<66.675000,0.000000,43.561000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.865000,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.342000,-1.535000,34.544000>}
box{<0,0,-0.127000><6.477000,0.035000,0.127000> rotate<0,0.000000,0> translate<62.865000,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.585600,0.000000,78.168500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.443600,0.000000,78.168500>}
box{<0,0,-0.127000><6.858000,0.035000,0.127000> rotate<0,0.000000,0> translate<62.585600,0.000000,78.168500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.596000,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.596000,-1.535000,9.652000>}
box{<0,0,-0.635000><0.254000,0.035000,0.635000> rotate<0,-90.000000,0> translate<69.596000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.596000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.596000,0.000000,9.906000>}
box{<0,0,-0.635000><0.254000,0.035000,0.635000> rotate<0,-90.000000,0> translate<69.596000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.008500,0.000000,11.747500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.596000,0.000000,10.160000>}
box{<0,0,-0.635000><2.245064,0.035000,0.635000> rotate<0,44.997030,0> translate<68.008500,0.000000,11.747500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.850000,-1.535000,68.872100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.850000,-1.535000,67.246500>}
box{<0,0,-0.127000><1.625600,0.035000,0.127000> rotate<0,-90.000000,0> translate<69.850000,-1.535000,67.246500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.794100,-1.535000,84.297000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.850000,-1.535000,68.872100>}
box{<0,0,-0.127000><21.554760,0.035000,0.127000> rotate<0,45.690572,0> translate<54.794100,-1.535000,84.297000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.345300,-1.535000,77.127100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.345300,-1.535000,76.974700>}
box{<0,0,-0.127000><0.152400,0.035000,0.127000> rotate<0,-90.000000,0> translate<70.345300,-1.535000,76.974700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.345300,0.000000,77.266800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.345300,0.000000,77.127100>}
box{<0,0,-0.127000><0.139700,0.035000,0.127000> rotate<0,-90.000000,0> translate<70.345300,0.000000,77.127100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.443600,0.000000,78.168500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.345300,0.000000,77.266800>}
box{<0,0,-0.127000><1.275196,0.035000,0.127000> rotate<0,44.997030,0> translate<69.443600,0.000000,78.168500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.465700,-1.535000,83.769200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.434200,-1.535000,83.756500>}
box{<0,0,-0.127000><1.968541,0.035000,0.127000> rotate<0,0.369621,0> translate<68.465700,-1.535000,83.769200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.388000,-1.535000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.497700,-1.535000,26.009600>}
box{<0,0,-0.127000><14.109723,0.035000,0.127000> rotate<0,0.103136,0> translate<56.388000,-1.535000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.434200,-1.535000,83.756500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.612000,-1.535000,83.756500>}
box{<0,0,-0.127000><0.177800,0.035000,0.127000> rotate<0,0.000000,0> translate<70.434200,-1.535000,83.756500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.548000,-1.535000,84.328000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.005700,-1.535000,84.328000>}
box{<0,0,-0.127000><4.457700,0.035000,0.127000> rotate<0,0.000000,0> translate<66.548000,-1.535000,84.328000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.595000,0.000000,59.055000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.120000,0.000000,68.580000>}
box{<0,0,-0.127000><13.470384,0.035000,0.127000> rotate<0,-44.997030,0> translate<61.595000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.596000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<71.374000,-1.535000,7.874000>}
box{<0,0,-0.635000><2.514472,0.035000,0.635000> rotate<0,44.997030,0> translate<69.596000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.342000,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.716900,-1.535000,31.750000>}
box{<0,0,-0.127000><3.666959,0.035000,0.127000> rotate<0,49.632188,0> translate<69.342000,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<68.287900,0.000000,54.025800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<71.716900,0.000000,54.013100>}
box{<0,0,-0.254000><3.429024,0.035000,0.254000> rotate<0,0.212192,0> translate<68.287900,0.000000,54.025800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.068700,-1.535000,50.482500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.161400,-1.535000,56.070500>}
box{<0,0,-0.127000><7.560512,0.035000,0.127000> rotate<0,-47.651951,0> translate<67.068700,-1.535000,50.482500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.056000,-1.535000,33.401000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.263000,-1.535000,28.194000>}
box{<0,0,-0.127000><7.363810,0.035000,0.127000> rotate<0,44.997030,0> translate<67.056000,-1.535000,33.401000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.161400,-1.535000,56.070500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.364600,-1.535000,56.261000>}
box{<0,0,-0.127000><0.278533,0.035000,0.127000> rotate<0,-43.149542,0> translate<72.161400,-1.535000,56.070500> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<71.716900,0.000000,54.013100>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<72.390000,0.000000,53.340000>}
box{<0,0,-0.254000><0.951907,0.035000,0.254000> rotate<0,44.997030,0> translate<71.716900,0.000000,54.013100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.913000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.898000,0.000000,8.128000>}
box{<0,0,-0.127000><6.985000,0.035000,0.127000> rotate<0,0.000000,0> translate<65.913000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.024000,-1.535000,51.066700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.113900,-1.535000,58.889900>}
box{<0,0,-0.127000><11.253841,0.035000,0.127000> rotate<0,-44.036919,0> translate<65.024000,-1.535000,51.066700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.716900,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.240900,-1.535000,31.750000>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,0.000000,0> translate<71.716900,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.390000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.533000,0.000000,36.804600>}
box{<0,0,-0.127000><1.689816,0.035000,0.127000> rotate<0,-47.433518,0> translate<72.390000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.390000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.545700,0.000000,34.239200>}
box{<0,0,-0.127000><1.679908,0.035000,0.127000> rotate<0,-46.528537,0> translate<72.390000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.390000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.545700,0.000000,39.357300>}
box{<0,0,-0.127000><1.707760,0.035000,0.127000> rotate<0,-47.407901,0> translate<72.390000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.390000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.545700,0.000000,47.002700>}
box{<0,0,-0.127000><1.726546,0.035000,0.127000> rotate<0,-47.978295,0> translate<72.390000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.390000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.558400,0.000000,41.910000>}
box{<0,0,-0.127000><1.725705,0.035000,0.127000> rotate<0,-47.382817,0> translate<72.390000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.390000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.571100,0.000000,49.542700>}
box{<0,0,-0.127000><1.743650,0.035000,0.127000> rotate<0,-47.358249,0> translate<72.390000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.390000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.571100,-1.535000,49.542700>}
box{<0,0,-0.127000><1.725051,0.035000,0.127000> rotate<0,46.786823,0> translate<72.390000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.390000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.583800,0.000000,44.424600>}
box{<0,0,-0.127000><1.724583,0.035000,0.127000> rotate<0,-46.190441,0> translate<72.390000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,0.000000,51.562000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.660000,0.000000,68.072000>}
box{<0,0,-0.127000><23.348666,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.150000,0.000000,51.562000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.660000,0.000000,68.072000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.660000,0.000000,68.580000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,90.000000,0> translate<73.660000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.612000,-1.535000,83.756500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.761600,-1.535000,80.606900>}
box{<0,0,-0.127000><4.454207,0.035000,0.127000> rotate<0,44.997030,0> translate<70.612000,-1.535000,83.756500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.761600,-1.535000,75.628500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.761600,-1.535000,80.606900>}
box{<0,0,-0.127000><4.978400,0.035000,0.127000> rotate<0,90.000000,0> translate<73.761600,-1.535000,80.606900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.183000,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.168000,-1.535000,14.224000>}
box{<0,0,-0.127000><6.985000,0.035000,0.127000> rotate<0,0.000000,0> translate<67.183000,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.390000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.168000,-1.535000,28.702000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,44.997030,0> translate<72.390000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.898000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.676000,0.000000,9.906000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,-44.997030,0> translate<72.898000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.240900,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.930000,-1.535000,30.480000>}
box{<0,0,-0.127000><2.113282,0.035000,0.127000> rotate<0,36.936325,0> translate<73.240900,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.082400,-1.535000,80.251300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.082400,-1.535000,77.076300>}
box{<0,0,-0.127000><3.175000,0.035000,0.127000> rotate<0,-90.000000,0> translate<75.082400,-1.535000,77.076300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.005700,-1.535000,84.328000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.082400,-1.535000,80.251300>}
box{<0,0,-0.127000><5.765324,0.035000,0.127000> rotate<0,44.997030,0> translate<71.005700,-1.535000,84.328000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.168000,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.565000,-1.535000,28.702000>}
box{<0,0,-0.127000><1.397000,0.035000,0.127000> rotate<0,0.000000,0> translate<74.168000,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<68.072000,-1.535000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<75.692000,-1.535000,23.495000>}
box{<0,0,-0.254000><10.776307,0.035000,0.254000> rotate<0,44.997030,0> translate<68.072000,-1.535000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.364600,-1.535000,56.261000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.844400,-1.535000,56.261000>}
box{<0,0,-0.127000><3.479800,0.035000,0.127000> rotate<0,0.000000,0> translate<72.364600,-1.535000,56.261000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.168000,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.946000,-1.535000,12.446000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,44.997030,0> translate<74.168000,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.571100,-1.535000,49.542700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.174600,-1.535000,49.542700>}
box{<0,0,-0.127000><2.603500,0.035000,0.127000> rotate<0,0.000000,0> translate<73.571100,-1.535000,49.542700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.392300,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.276200,0.000000,28.702000>}
box{<0,0,-0.127000><10.883900,0.035000,0.127000> rotate<0,0.000000,0> translate<65.392300,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.440300,0.000000,56.210200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.403200,0.000000,56.261000>}
box{<0,0,-0.127000><7.963062,0.035000,0.127000> rotate<0,-0.365494,0> translate<68.440300,0.000000,56.210200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.761600,-1.535000,75.628500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.479400,-1.535000,72.910700>}
box{<0,0,-0.127000><3.843550,0.035000,0.127000> rotate<0,44.997030,0> translate<73.761600,-1.535000,75.628500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.479400,-1.535000,72.898000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.479400,-1.535000,72.910700>}
box{<0,0,-0.127000><0.012700,0.035000,0.127000> rotate<0,90.000000,0> translate<76.479400,-1.535000,72.910700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.113900,-1.535000,58.889900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.470000,-1.535000,58.889900>}
box{<0,0,-0.127000><4.356100,0.035000,0.127000> rotate<0,0.000000,0> translate<73.113900,-1.535000,58.889900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.844400,-1.535000,56.261000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.482700,-1.535000,54.622700>}
box{<0,0,-0.127000><2.316906,0.035000,0.127000> rotate<0,44.997030,0> translate<75.844400,-1.535000,56.261000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.276200,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.054200,0.000000,30.480000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,-44.997030,0> translate<76.276200,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.308200,-1.535000,75.717400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.308200,-1.535000,81.851500>}
box{<0,0,-0.127000><6.134100,0.035000,0.127000> rotate<0,90.000000,0> translate<78.308200,-1.535000,81.851500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.082400,-1.535000,77.076300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.409800,-1.535000,73.748900>}
box{<0,0,-0.127000><4.705654,0.035000,0.127000> rotate<0,44.997030,0> translate<75.082400,-1.535000,77.076300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.174600,-1.535000,49.542700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.486000,-1.535000,52.044600>}
box{<0,0,-0.127000><3.406182,0.035000,0.127000> rotate<0,-47.263341,0> translate<76.174600,-1.535000,49.542700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.308200,0.000000,75.717400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.994000,0.000000,75.031600>}
box{<0,0,-0.127000><0.969868,0.035000,0.127000> rotate<0,44.997030,0> translate<78.308200,0.000000,75.717400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.994000,0.000000,60.706000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.994000,0.000000,75.031600>}
box{<0,0,-0.127000><14.325600,0.035000,0.127000> rotate<0,90.000000,0> translate<78.994000,0.000000,75.031600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.565000,-1.535000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.146400,-1.535000,31.750000>}
box{<0,0,-0.127000><4.702843,0.035000,0.127000> rotate<0,-40.397238,0> translate<75.565000,-1.535000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.403200,0.000000,56.261000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.260700,0.000000,53.390800>}
box{<0,0,-0.127000><4.050105,0.035000,0.127000> rotate<0,45.124063,0> translate<76.403200,0.000000,56.261000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.263000,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.425800,-1.535000,28.194000>}
box{<0,0,-0.127000><7.162800,0.035000,0.127000> rotate<0,0.000000,0> translate<72.263000,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.497700,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.502000,0.000000,26.035000>}
box{<0,0,-0.127000><9.004336,0.035000,0.127000> rotate<0,-0.161613,0> translate<70.497700,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.502000,0.000000,62.738000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.502000,0.000000,74.853800>}
box{<0,0,-0.127000><12.115800,0.035000,0.127000> rotate<0,90.000000,0> translate<79.502000,0.000000,74.853800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.514700,-1.535000,76.542900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.514700,-1.535000,80.784700>}
box{<0,0,-0.127000><4.241800,0.035000,0.127000> rotate<0,90.000000,0> translate<79.514700,-1.535000,80.784700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.502000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.149700,0.000000,26.657300>}
box{<0,0,-0.127000><0.898205,0.035000,0.127000> rotate<0,-43.851343,0> translate<79.502000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.425800,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.327500,-1.535000,29.210000>}
box{<0,0,-0.127000><1.358425,0.035000,0.127000> rotate<0,-48.407750,0> translate<79.425800,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.502000,0.000000,74.853800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.352900,0.000000,75.704700>}
box{<0,0,-0.127000><1.203354,0.035000,0.127000> rotate<0,-44.997030,0> translate<79.502000,0.000000,74.853800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.514700,-1.535000,76.542900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.352900,-1.535000,75.704700>}
box{<0,0,-0.127000><1.185394,0.035000,0.127000> rotate<0,44.997030,0> translate<79.514700,-1.535000,76.542900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.308200,-1.535000,81.851500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.378300,-1.535000,83.921600>}
box{<0,0,-0.127000><2.927563,0.035000,0.127000> rotate<0,-44.997030,0> translate<78.308200,-1.535000,81.851500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.470000,-1.535000,58.889900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.479900,-1.535000,55.880000>}
box{<0,0,-0.127000><4.256641,0.035000,0.127000> rotate<0,44.997030,0> translate<77.470000,-1.535000,58.889900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.850000,-1.535000,67.246500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.581500,-1.535000,57.150000>}
box{<0,0,-0.127000><14.734463,0.035000,0.127000> rotate<0,43.250864,0> translate<69.850000,-1.535000,67.246500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.676000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.645000,0.000000,9.906000>}
box{<0,0,-0.127000><5.969000,0.035000,0.127000> rotate<0,0.000000,0> translate<74.676000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<76.479400,-1.535000,72.898000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.229200,-1.535000,72.898000>}
box{<0,0,-0.127000><4.749800,0.035000,0.127000> rotate<0,0.000000,0> translate<76.479400,-1.535000,72.898000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.409800,-1.535000,73.748900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.229200,-1.535000,73.748900>}
box{<0,0,-0.127000><2.819400,0.035000,0.127000> rotate<0,0.000000,0> translate<78.409800,-1.535000,73.748900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.008000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.280000,0.000000,27.940000>}
box{<0,0,-0.127000><17.272000,0.035000,0.127000> rotate<0,0.000000,0> translate<64.008000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.054200,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.280000,0.000000,30.480000>}
box{<0,0,-0.127000><3.225800,0.035000,0.127000> rotate<0,0.000000,0> translate<78.054200,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.930000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.280000,0.000000,33.020000>}
box{<0,0,-0.127000><6.350000,0.035000,0.127000> rotate<0,0.000000,0> translate<74.930000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.930000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.280000,0.000000,35.560000>}
box{<0,0,-0.127000><6.350000,0.035000,0.127000> rotate<0,0.000000,0> translate<74.930000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.930000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.280000,0.000000,38.100000>}
box{<0,0,-0.127000><6.350000,0.035000,0.127000> rotate<0,0.000000,0> translate<74.930000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.930000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.280000,0.000000,40.640000>}
box{<0,0,-0.127000><6.350000,0.035000,0.127000> rotate<0,0.000000,0> translate<74.930000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.930000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.280000,0.000000,43.180000>}
box{<0,0,-0.127000><6.350000,0.035000,0.127000> rotate<0,0.000000,0> translate<74.930000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.930000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.280000,0.000000,45.720000>}
box{<0,0,-0.127000><6.350000,0.035000,0.127000> rotate<0,0.000000,0> translate<74.930000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.930000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.280000,0.000000,48.260000>}
box{<0,0,-0.127000><6.350000,0.035000,0.127000> rotate<0,0.000000,0> translate<74.930000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.930000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.280000,0.000000,50.800000>}
box{<0,0,-0.127000><6.350000,0.035000,0.127000> rotate<0,0.000000,0> translate<74.930000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.260700,0.000000,53.390800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.280000,0.000000,53.340000>}
box{<0,0,-0.127000><2.019939,0.035000,0.127000> rotate<0,1.441004,0> translate<79.260700,0.000000,53.390800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.479900,-1.535000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.280000,-1.535000,55.880000>}
box{<0,0,-0.127000><0.800100,0.035000,0.127000> rotate<0,0.000000,0> translate<80.479900,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.994000,0.000000,60.706000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.280000,0.000000,58.420000>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,44.997030,0> translate<78.994000,0.000000,60.706000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.502000,0.000000,62.738000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.280000,0.000000,60.960000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,44.997030,0> translate<79.502000,0.000000,62.738000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.310000,-1.535000,77.470000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.280000,-1.535000,63.500000>}
box{<0,0,-0.127000><19.756563,0.035000,0.127000> rotate<0,44.997030,0> translate<67.310000,-1.535000,77.470000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.345300,-1.535000,76.974700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.280000,-1.535000,66.040000>}
box{<0,0,-0.127000><15.464001,0.035000,0.127000> rotate<0,44.997030,0> translate<70.345300,-1.535000,76.974700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.514700,-1.535000,80.784700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.280000,-1.535000,82.550000>}
box{<0,0,-0.127000><2.496511,0.035000,0.127000> rotate<0,-44.997030,0> translate<79.514700,-1.535000,80.784700> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<71.374000,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<81.407000,-1.535000,7.874000>}
box{<0,0,-0.635000><10.033000,0.035000,0.635000> rotate<0,0.000000,0> translate<71.374000,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.946000,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.915000,-1.535000,12.446000>}
box{<0,0,-0.127000><5.969000,0.035000,0.127000> rotate<0,0.000000,0> translate<75.946000,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.571100,0.000000,49.542700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.181700,0.000000,49.542700>}
box{<0,0,-0.127000><8.610600,0.035000,0.127000> rotate<0,0.000000,0> translate<73.571100,0.000000,49.542700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.545700,0.000000,39.357300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.232500,0.000000,39.357300>}
box{<0,0,-0.127000><8.686800,0.035000,0.127000> rotate<0,0.000000,0> translate<73.545700,0.000000,39.357300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<79.146400,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.245200,-1.535000,31.750000>}
box{<0,0,-0.127000><3.098800,0.035000,0.127000> rotate<0,0.000000,0> translate<79.146400,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.533000,0.000000,36.804600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.283300,0.000000,36.804600>}
box{<0,0,-0.127000><8.750300,0.035000,0.127000> rotate<0,0.000000,0> translate<73.533000,0.000000,36.804600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.545700,0.000000,34.239200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.296000,0.000000,34.239200>}
box{<0,0,-0.127000><8.750300,0.035000,0.127000> rotate<0,0.000000,0> translate<73.545700,0.000000,34.239200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.558400,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.296000,0.000000,41.910000>}
box{<0,0,-0.127000><8.737600,0.035000,0.127000> rotate<0,0.000000,0> translate<73.558400,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.583800,0.000000,44.424600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.296000,0.000000,44.424600>}
box{<0,0,-0.127000><8.712200,0.035000,0.127000> rotate<0,0.000000,0> translate<73.583800,0.000000,44.424600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.545700,0.000000,47.002700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.296000,0.000000,47.002700>}
box{<0,0,-0.127000><8.750300,0.035000,0.127000> rotate<0,0.000000,0> translate<73.545700,0.000000,47.002700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.327500,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.308700,-1.535000,29.210000>}
box{<0,0,-0.127000><1.981200,0.035000,0.127000> rotate<0,0.000000,0> translate<80.327500,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<78.486000,-1.535000,52.044600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.435700,-1.535000,52.044600>}
box{<0,0,-0.127000><3.949700,0.035000,0.127000> rotate<0,0.000000,0> translate<78.486000,-1.535000,52.044600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.378300,-1.535000,83.921600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.448400,-1.535000,83.921600>}
box{<0,0,-0.127000><2.070100,0.035000,0.127000> rotate<0,0.000000,0> translate<80.378300,-1.535000,83.921600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.149700,0.000000,26.657300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.499200,0.000000,26.657300>}
box{<0,0,-0.127000><2.349500,0.035000,0.127000> rotate<0,0.000000,0> translate<80.149700,0.000000,26.657300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.229200,-1.535000,72.898000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.524600,-1.535000,71.602600>}
box{<0,0,-0.127000><1.831972,0.035000,0.127000> rotate<0,44.997030,0> translate<81.229200,-1.535000,72.898000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.524600,-1.535000,64.998600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.524600,-1.535000,71.602600>}
box{<0,0,-0.127000><6.604000,0.035000,0.127000> rotate<0,90.000000,0> translate<82.524600,-1.535000,71.602600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<80.581500,-1.535000,57.150000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.575400,-1.535000,57.150000>}
box{<0,0,-0.127000><1.993900,0.035000,0.127000> rotate<0,0.000000,0> translate<80.581500,-1.535000,57.150000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<81.407000,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<83.185000,-1.535000,9.652000>}
box{<0,0,-0.635000><2.514472,0.035000,0.635000> rotate<0,-44.997030,0> translate<81.407000,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<83.185000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<83.185000,-1.535000,9.906000>}
box{<0,0,-0.635000><0.254000,0.035000,0.635000> rotate<0,90.000000,0> translate<83.185000,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<83.185000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<83.185000,0.000000,10.795000>}
box{<0,0,-0.635000><0.889000,0.035000,0.635000> rotate<0,90.000000,0> translate<83.185000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.308700,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.693000,-1.535000,30.480000>}
box{<0,0,-0.127000><1.878613,0.035000,0.127000> rotate<0,-42.531434,0> translate<82.308700,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.499200,0.000000,26.657300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.743800,0.000000,27.876500>}
box{<0,0,-0.127000><1.742262,0.035000,0.127000> rotate<0,-44.406412,0> translate<82.499200,0.000000,26.657300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.743800,0.000000,27.876500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.820000,0.000000,27.940000>}
box{<0,0,-0.127000><0.099190,0.035000,0.127000> rotate<0,-39.802944,0> translate<83.743800,0.000000,27.876500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.693000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.820000,-1.535000,30.480000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,0.000000,0> translate<83.693000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.245200,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.820000,-1.535000,33.020000>}
box{<0,0,-0.127000><2.023090,0.035000,0.127000> rotate<0,-38.881930,0> translate<82.245200,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.296000,0.000000,34.239200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.820000,0.000000,35.560000>}
box{<0,0,-0.127000><2.016702,0.035000,0.127000> rotate<0,-40.911683,0> translate<82.296000,0.000000,34.239200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.283300,0.000000,36.804600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.820000,0.000000,38.100000>}
box{<0,0,-0.127000><2.009853,0.035000,0.127000> rotate<0,-40.127410,0> translate<82.283300,0.000000,36.804600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.232500,0.000000,39.357300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.820000,0.000000,40.640000>}
box{<0,0,-0.127000><2.040950,0.035000,0.127000> rotate<0,-38.935641,0> translate<82.232500,0.000000,39.357300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.296000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.820000,0.000000,43.180000>}
box{<0,0,-0.127000><1.983803,0.035000,0.127000> rotate<0,-39.802944,0> translate<82.296000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.296000,0.000000,44.424600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.820000,0.000000,45.720000>}
box{<0,0,-0.127000><2.000159,0.035000,0.127000> rotate<0,-40.361873,0> translate<82.296000,0.000000,44.424600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.296000,0.000000,47.002700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.820000,0.000000,48.260000>}
box{<0,0,-0.127000><1.975697,0.035000,0.127000> rotate<0,-39.520023,0> translate<82.296000,0.000000,47.002700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.181700,0.000000,49.542700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.820000,0.000000,50.800000>}
box{<0,0,-0.127000><2.065147,0.035000,0.127000> rotate<0,-37.501667,0> translate<82.181700,0.000000,49.542700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.435700,-1.535000,52.044600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.820000,-1.535000,53.340000>}
box{<0,0,-0.127000><1.895876,0.035000,0.127000> rotate<0,-43.097045,0> translate<82.435700,-1.535000,52.044600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.575400,-1.535000,57.150000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.820000,-1.535000,55.880000>}
box{<0,0,-0.127000><1.778181,0.035000,0.127000> rotate<0,45.575718,0> translate<82.575400,-1.535000,57.150000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.524600,-1.535000,64.998600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.820000,-1.535000,63.500000>}
box{<0,0,-0.127000><1.980874,0.035000,0.127000> rotate<0,49.156398,0> translate<82.524600,-1.535000,64.998600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<82.448400,-1.535000,83.921600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.820000,-1.535000,82.550000>}
box{<0,0,-0.127000><1.939735,0.035000,0.127000> rotate<0,44.997030,0> translate<82.448400,-1.535000,83.921600> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<83.185000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<84.137500,0.000000,11.747500>}
box{<0,0,-0.635000><1.347038,0.035000,0.635000> rotate<0,-44.997030,0> translate<83.185000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<77.482700,-1.535000,54.622700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<84.353400,-1.535000,54.622700>}
box{<0,0,-0.127000><6.870700,0.035000,0.127000> rotate<0,0.000000,0> translate<77.482700,-1.535000,54.622700> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<84.429600,0.000000,12.674600>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<84.429600,0.000000,11.404600>}
box{<0,0,-0.635000><1.270000,0.035000,0.635000> rotate<0,-90.000000,0> translate<84.429600,0.000000,11.404600> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<84.137500,0.000000,11.747500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<84.455000,0.000000,12.065000>}
box{<0,0,-0.635000><0.449013,0.035000,0.635000> rotate<0,-44.997030,0> translate<84.137500,0.000000,11.747500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<84.455000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<84.455000,0.000000,12.446000>}
box{<0,0,-0.635000><0.381000,0.035000,0.635000> rotate<0,90.000000,0> translate<84.455000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<84.455000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<84.582000,0.000000,12.700000>}
box{<0,0,-0.635000><0.283981,0.035000,0.635000> rotate<0,-63.430762,0> translate<84.455000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<84.429600,0.000000,12.674600>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<84.582000,0.000000,12.827000>}
box{<0,0,-0.635000><0.215526,0.035000,0.635000> rotate<0,-44.997030,0> translate<84.429600,0.000000,12.674600> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<84.582000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<84.582000,0.000000,12.827000>}
box{<0,0,-0.635000><0.127000,0.035000,0.635000> rotate<0,90.000000,0> translate<84.582000,0.000000,12.827000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<84.353400,-1.535000,54.622700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.471000,-1.535000,56.007000>}
box{<0,0,-0.127000><1.779134,0.035000,0.127000> rotate<0,-51.081322,0> translate<84.353400,-1.535000,54.622700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.471000,-1.535000,56.007000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.471000,-1.535000,57.785000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,90.000000,0> translate<85.471000,-1.535000,57.785000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.820000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.471000,0.000000,62.611000>}
box{<0,0,-0.127000><2.334867,0.035000,0.127000> rotate<0,-44.997030,0> translate<83.820000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.820000,-1.535000,66.040000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.471000,-1.535000,67.691000>}
box{<0,0,-0.127000><2.334867,0.035000,0.127000> rotate<0,-44.997030,0> translate<83.820000,-1.535000,66.040000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.471000,-1.535000,69.507100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.471000,-1.535000,67.691000>}
box{<0,0,-0.127000><1.816100,0.035000,0.127000> rotate<0,-90.000000,0> translate<85.471000,-1.535000,67.691000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<81.229200,-1.535000,73.748900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.471000,-1.535000,69.507100>}
box{<0,0,-0.127000><5.998811,0.035000,0.127000> rotate<0,44.997030,0> translate<81.229200,-1.535000,73.748900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.471000,0.000000,62.611000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.471000,0.000000,72.085200>}
box{<0,0,-0.127000><9.474200,0.035000,0.127000> rotate<0,90.000000,0> translate<85.471000,0.000000,72.085200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<83.820000,-1.535000,80.010000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.471000,-1.535000,78.359000>}
box{<0,0,-0.127000><2.334867,0.035000,0.127000> rotate<0,44.997030,0> translate<83.820000,-1.535000,80.010000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.471000,-1.535000,72.085200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.471000,-1.535000,78.359000>}
box{<0,0,-0.127000><6.273800,0.035000,0.127000> rotate<0,90.000000,0> translate<85.471000,-1.535000,78.359000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<85.712300,0.000000,10.121900>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<85.712300,0.000000,8.204200>}
box{<0,0,-0.635000><1.917700,0.035000,0.635000> rotate<0,-90.000000,0> translate<85.712300,0.000000,8.204200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<84.429600,0.000000,11.404600>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<85.712300,0.000000,10.121900>}
box{<0,0,-0.635000><1.814012,0.035000,0.635000> rotate<0,44.997030,0> translate<84.429600,0.000000,11.404600> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<85.725000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<85.725000,0.000000,9.906000>}
box{<0,0,-0.635000><0.254000,0.035000,0.635000> rotate<0,-90.000000,0> translate<85.725000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<84.137500,0.000000,11.747500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<85.725000,0.000000,10.160000>}
box{<0,0,-0.635000><2.245064,0.035000,0.635000> rotate<0,44.997030,0> translate<84.137500,0.000000,11.747500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<85.712300,0.000000,8.204200>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<86.690200,0.000000,7.226300>}
box{<0,0,-0.635000><1.382959,0.035000,0.635000> rotate<0,44.997030,0> translate<85.712300,0.000000,8.204200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<86.690200,0.000000,7.226300>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<89.166700,0.000000,7.226300>}
box{<0,0,-0.635000><2.476500,0.035000,0.635000> rotate<0,0.000000,0> translate<86.690200,0.000000,7.226300> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<75.692000,-1.535000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<90.830400,-1.535000,23.495000>}
box{<0,0,-0.254000><15.138400,0.035000,0.254000> rotate<0,0.000000,0> translate<75.692000,-1.535000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<90.830400,-1.535000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<90.830400,-1.535000,29.895800>}
box{<0,0,-0.254000><6.400800,0.035000,0.254000> rotate<0,90.000000,0> translate<90.830400,-1.535000,29.895800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<90.830400,-1.535000,29.895800>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<90.906600,-1.535000,29.972000>}
box{<0,0,-0.254000><0.107763,0.035000,0.254000> rotate<0,-44.997030,0> translate<90.830400,-1.535000,29.895800> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<90.906600,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<90.906600,-1.535000,30.200600>}
box{<0,0,-0.254000><0.228600,0.035000,0.254000> rotate<0,90.000000,0> translate<90.906600,-1.535000,30.200600> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<90.830400,-1.535000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<91.440000,-1.535000,23.495000>}
box{<0,0,-0.254000><0.609600,0.035000,0.254000> rotate<0,0.000000,0> translate<90.830400,-1.535000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<91.440000,-1.535000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<91.567000,-1.535000,23.622000>}
box{<0,0,-0.254000><0.179605,0.035000,0.254000> rotate<0,-44.997030,0> translate<91.440000,-1.535000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<85.471000,-1.535000,57.785000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.329000,-1.535000,64.643000>}
box{<0,0,-0.127000><9.698677,0.035000,0.127000> rotate<0,-44.997030,0> translate<85.471000,-1.535000,57.785000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<89.166700,0.000000,7.226300>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<92.544900,0.000000,10.604500>}
box{<0,0,-0.635000><4.777496,0.035000,0.635000> rotate<0,-44.997030,0> translate<89.166700,0.000000,7.226300> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<92.544900,0.000000,10.604500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<92.544900,0.000000,16.129000>}
box{<0,0,-0.635000><5.524500,0.035000,0.635000> rotate<0,90.000000,0> translate<92.544900,0.000000,16.129000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<92.544900,0.000000,16.129000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<93.345900,0.000000,16.930000>}
box{<0,0,-0.635000><1.132785,0.035000,0.635000> rotate<0,-44.997030,0> translate<92.544900,0.000000,16.129000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<93.726000,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<93.770000,-1.535000,37.370000>}
box{<0,0,-0.254000><0.226318,0.035000,0.254000> rotate<0,78.784167,0> translate<93.726000,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<90.906600,-1.535000,30.200600>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<93.853000,-1.535000,33.147000>}
box{<0,0,-0.254000><4.166839,0.035000,0.254000> rotate<0,-44.997030,0> translate<90.906600,-1.535000,30.200600> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<93.770000,-1.535000,33.170000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<93.853000,-1.535000,33.147000>}
box{<0,0,-0.254000><0.086128,0.035000,0.254000> rotate<0,15.487479,0> translate<93.770000,-1.535000,33.170000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<93.770000,-1.535000,33.170000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<93.853000,-1.535000,33.401000>}
box{<0,0,-0.254000><0.245459,0.035000,0.254000> rotate<0,-70.231628,0> translate<93.770000,-1.535000,33.170000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<93.770000,-1.535000,37.370000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<93.853000,-1.535000,37.338000>}
box{<0,0,-0.254000><0.088955,0.035000,0.254000> rotate<0,21.082363,0> translate<93.770000,-1.535000,37.370000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<93.853000,-1.535000,33.401000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<93.853000,-1.535000,37.338000>}
box{<0,0,-0.254000><3.937000,0.035000,0.254000> rotate<0,90.000000,0> translate<93.853000,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<93.345900,0.000000,16.930000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<95.070000,0.000000,16.930000>}
box{<0,0,-0.635000><1.724100,0.035000,0.635000> rotate<0,0.000000,0> translate<93.345900,0.000000,16.930000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.070000,0.000000,13.120000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.123000,0.000000,13.208000>}
box{<0,0,-0.127000><0.102728,0.035000,0.127000> rotate<0,-58.936701,0> translate<95.070000,0.000000,13.120000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.070000,0.000000,15.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.123000,0.000000,15.113000>}
box{<0,0,-0.127000><0.055660,0.035000,0.127000> rotate<0,17.782715,0> translate<95.070000,0.000000,15.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.123000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.123000,0.000000,15.113000>}
box{<0,0,-0.127000><1.905000,0.035000,0.127000> rotate<0,90.000000,0> translate<95.123000,0.000000,15.113000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<95.070000,0.000000,16.930000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<95.123000,0.000000,17.018000>}
box{<0,0,-0.635000><0.102728,0.035000,0.635000> rotate<0,-58.936701,0> translate<95.070000,0.000000,16.930000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<95.123000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<95.123000,0.000000,18.669000>}
box{<0,0,-0.635000><1.651000,0.035000,0.635000> rotate<0,90.000000,0> translate<95.123000,0.000000,18.669000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<92.329000,-1.535000,64.643000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.123000,-1.535000,64.643000>}
box{<0,0,-0.127000><2.794000,0.035000,0.127000> rotate<0,0.000000,0> translate<92.329000,-1.535000,64.643000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<93.726000,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<96.012000,-1.535000,39.878000>}
box{<0,0,-0.254000><3.232892,0.035000,0.254000> rotate<0,-44.997030,0> translate<93.726000,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<96.012000,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<96.012000,-1.535000,46.228000>}
box{<0,0,-0.254000><6.350000,0.035000,0.254000> rotate<0,90.000000,0> translate<96.012000,-1.535000,46.228000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<97.028000,0.000000,52.705000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<97.028000,0.000000,56.134000>}
box{<0,0,-0.254000><3.429000,0.035000,0.254000> rotate<0,90.000000,0> translate<97.028000,0.000000,56.134000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<91.567000,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<97.155000,-1.535000,18.034000>}
box{<0,0,-0.254000><7.902625,0.035000,0.254000> rotate<0,44.997030,0> translate<91.567000,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<95.123000,-1.535000,64.643000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<97.155000,-1.535000,66.675000>}
box{<0,0,-0.127000><2.873682,0.035000,0.127000> rotate<0,-44.997030,0> translate<95.123000,-1.535000,64.643000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<97.155000,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<97.332800,-1.535000,18.186400>}
box{<0,0,-0.254000><0.234176,0.035000,0.254000> rotate<0,-40.598615,0> translate<97.155000,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<97.332800,0.000000,18.186400>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<98.552000,0.000000,17.018000>}
box{<0,0,-0.254000><1.688670,0.035000,0.254000> rotate<0,43.778235,0> translate<97.332800,0.000000,18.186400> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<98.552000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<98.626000,0.000000,16.930000>}
box{<0,0,-0.254000><0.114978,0.035000,0.254000> rotate<0,49.935920,0> translate<98.552000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.626000,0.000000,13.120000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,0.000000,13.208000>}
box{<0,0,-0.127000><0.102728,0.035000,0.127000> rotate<0,-58.936701,0> translate<98.626000,0.000000,13.120000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,0.000000,13.208000>}
box{<0,0,-0.127000><1.905000,0.035000,0.127000> rotate<0,-90.000000,0> translate<98.679000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.626000,0.000000,15.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<98.679000,0.000000,15.113000>}
box{<0,0,-0.127000><0.055660,0.035000,0.127000> rotate<0,17.782715,0> translate<98.626000,0.000000,15.130000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<95.123000,0.000000,18.669000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<98.679000,0.000000,22.225000>}
box{<0,0,-0.635000><5.028943,0.035000,0.635000> rotate<0,-44.997030,0> translate<95.123000,0.000000,18.669000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<98.679000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<98.679000,0.000000,22.606000>}
box{<0,0,-0.635000><0.381000,0.035000,0.635000> rotate<0,90.000000,0> translate<98.679000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<98.679000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<98.788000,0.000000,22.700000>}
box{<0,0,-0.635000><0.143934,0.035000,0.635000> rotate<0,-40.771311,0> translate<98.679000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<98.679000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<98.788000,0.000000,22.700000>}
box{<0,0,-0.635000><0.307002,0.035000,0.635000> rotate<0,69.199109,0> translate<98.679000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<98.679000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<99.187000,0.000000,23.495000>}
box{<0,0,-0.635000><0.718420,0.035000,0.635000> rotate<0,-44.997030,0> translate<98.679000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<99.187000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<99.187000,0.000000,28.321000>}
box{<0,0,-0.635000><4.826000,0.035000,0.635000> rotate<0,90.000000,0> translate<99.187000,0.000000,28.321000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<99.187000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<99.187000,0.000000,33.147000>}
box{<0,0,-0.635000><4.445000,0.035000,0.635000> rotate<0,90.000000,0> translate<99.187000,0.000000,33.147000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<96.012000,-1.535000,46.228000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<99.187000,-1.535000,49.403000>}
box{<0,0,-0.254000><4.490128,0.035000,0.254000> rotate<0,-44.997030,0> translate<96.012000,-1.535000,46.228000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<99.187000,-1.535000,49.403000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<99.187000,-1.535000,49.911000>}
box{<0,0,-0.254000><0.508000,0.035000,0.254000> rotate<0,90.000000,0> translate<99.187000,-1.535000,49.911000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<97.028000,0.000000,52.705000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<99.187000,0.000000,50.546000>}
box{<0,0,-0.254000><3.053287,0.035000,0.254000> rotate<0,44.997030,0> translate<97.028000,0.000000,52.705000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<99.187000,0.000000,50.038000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<99.187000,0.000000,50.546000>}
box{<0,0,-0.254000><0.508000,0.035000,0.254000> rotate<0,90.000000,0> translate<99.187000,0.000000,50.546000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<97.028000,0.000000,56.134000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<99.187000,0.000000,58.293000>}
box{<0,0,-0.254000><3.053287,0.035000,0.254000> rotate<0,-44.997030,0> translate<97.028000,0.000000,56.134000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<97.155000,-1.535000,66.675000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<99.187000,-1.535000,66.675000>}
box{<0,0,-0.127000><2.032000,0.035000,0.127000> rotate<0,0.000000,0> translate<97.155000,-1.535000,66.675000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<99.187000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<99.270000,0.000000,33.170000>}
box{<0,0,-0.635000><0.086128,0.035000,0.635000> rotate<0,-15.487479,0> translate<99.187000,0.000000,33.147000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<99.187000,-1.535000,49.911000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<99.270000,-1.535000,49.970000>}
box{<0,0,-0.254000><0.101833,0.035000,0.254000> rotate<0,-35.404529,0> translate<99.187000,-1.535000,49.911000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<99.187000,0.000000,50.038000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<99.270000,0.000000,49.970000>}
box{<0,0,-0.254000><0.107299,0.035000,0.254000> rotate<0,39.324382,0> translate<99.187000,0.000000,50.038000> }
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<99.187000,0.000000,58.293000>}
cylinder{<0,0,0><0,0.035000,0>0.254000 translate<99.270000,0.000000,58.370000>}
box{<0,0,-0.254000><0.113217,0.035000,0.254000> rotate<0,-42.849586,0> translate<99.187000,0.000000,58.293000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<99.187000,-1.535000,66.675000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<99.270000,-1.535000,66.770000>}
box{<0,0,-0.127000><0.126151,0.035000,0.127000> rotate<0,-48.853577,0> translate<99.187000,-1.535000,66.675000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<99.187000,0.000000,28.321000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<99.277000,0.000000,28.600000>}
box{<0,0,-0.635000><0.293157,0.035000,0.635000> rotate<0,-72.116544,0> translate<99.187000,0.000000,28.321000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<99.187000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<99.277000,0.000000,28.600000>}
box{<0,0,-0.635000><0.136029,0.035000,0.635000> rotate<0,48.573129,0> translate<99.187000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<99.270000,0.000000,66.770000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<99.314000,0.000000,66.802000>}
box{<0,0,-0.127000><0.054406,0.035000,0.127000> rotate<0,-36.024996,0> translate<99.270000,0.000000,66.770000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<99.270000,0.000000,70.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<99.314000,0.000000,70.866000>}
box{<0,0,-0.127000><0.112925,0.035000,0.127000> rotate<0,67.063473,0> translate<99.270000,0.000000,70.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<99.314000,0.000000,66.802000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<99.314000,0.000000,70.866000>}
box{<0,0,-0.127000><4.064000,0.035000,0.127000> rotate<0,90.000000,0> translate<99.314000,0.000000,70.866000> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-20.320000,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-20.320000,0.000000,86.360000>}
box{<0,0,-0.203200><86.360000,0.035000,0.203200> rotate<0,90.000000,0> translate<-20.320000,0.000000,86.360000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-20.320000,-1.535000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-20.320000,-1.535000,86.360000>}
box{<0,0,-0.203200><86.360000,0.035000,0.203200> rotate<0,90.000000,0> translate<-20.320000,-1.535000,86.360000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-20.320000,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<101.600000,0.000000,0.000000>}
box{<0,0,-0.203200><121.920000,0.035000,0.203200> rotate<0,0.000000,0> translate<-20.320000,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-20.320000,-1.535000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<101.600000,-1.535000,0.000000>}
box{<0,0,-0.203200><121.920000,0.035000,0.203200> rotate<0,0.000000,0> translate<-20.320000,-1.535000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-20.320000,0.000000,86.360000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<101.600000,0.000000,86.360000>}
box{<0,0,-0.203200><121.920000,0.035000,0.203200> rotate<0,0.000000,0> translate<-20.320000,0.000000,86.360000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-20.320000,-1.535000,86.360000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<101.600000,-1.535000,86.360000>}
box{<0,0,-0.203200><121.920000,0.035000,0.203200> rotate<0,0.000000,0> translate<-20.320000,-1.535000,86.360000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<101.600000,0.000000,86.360000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<101.600000,0.000000,0.000000>}
box{<0,0,-0.203200><86.360000,0.035000,0.203200> rotate<0,-90.000000,0> translate<101.600000,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<101.600000,-1.535000,86.360000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<101.600000,-1.535000,0.000000>}
box{<0,0,-0.203200><86.360000,0.035000,0.203200> rotate<0,-90.000000,0> translate<101.600000,-1.535000,0.000000> }
texture{col_pol}
}
#end
union{
cylinder{<36.195000,0.038000,82.550000><36.195000,-1.538000,82.550000>0.457200}
cylinder{<36.195000,0.038000,80.010000><36.195000,-1.538000,80.010000>0.457200}
cylinder{<33.655000,0.038000,82.550000><33.655000,-1.538000,82.550000>0.457200}
cylinder{<33.655000,0.038000,80.010000><33.655000,-1.538000,80.010000>0.457200}
cylinder{<31.115000,0.038000,82.550000><31.115000,-1.538000,82.550000>0.457200}
cylinder{<31.115000,0.038000,80.010000><31.115000,-1.538000,80.010000>0.457200}
cylinder{<19.685000,0.038000,82.550000><19.685000,-1.538000,82.550000>0.457200}
cylinder{<19.685000,0.038000,80.010000><19.685000,-1.538000,80.010000>0.457200}
cylinder{<17.145000,0.038000,82.550000><17.145000,-1.538000,82.550000>0.457200}
cylinder{<17.145000,0.038000,80.010000><17.145000,-1.538000,80.010000>0.457200}
cylinder{<14.605000,0.038000,82.550000><14.605000,-1.538000,82.550000>0.457200}
cylinder{<14.605000,0.038000,80.010000><14.605000,-1.538000,80.010000>0.457200}
cylinder{<98.788000,0.038000,22.700000><98.788000,-1.538000,22.700000>0.406400}
cylinder{<95.232000,0.038000,22.700000><95.232000,-1.538000,22.700000>0.406400}
cylinder{<58.448800,0.038000,45.382200><58.448800,-1.538000,45.382200>0.406400}
cylinder{<54.892800,0.038000,45.382200><54.892800,-1.538000,45.382200>0.406400}
cylinder{<11.366500,0.038000,5.486400><11.366500,-1.538000,5.486400>0.600000}
cylinder{<11.366500,0.038000,15.646400><11.366500,-1.538000,15.646400>0.600000}
cylinder{<58.166000,0.038000,56.134000><58.166000,-1.538000,56.134000>0.508000}
cylinder{<58.166000,0.038000,58.674000><58.166000,-1.538000,58.674000>0.508000}
cylinder{<58.166000,0.038000,61.214000><58.166000,-1.538000,61.214000>0.508000}
cylinder{<58.166000,0.038000,63.754000><58.166000,-1.538000,63.754000>0.508000}
cylinder{<72.390000,0.038000,53.340000><72.390000,-1.538000,53.340000>0.457200}
cylinder{<74.930000,0.038000,53.340000><74.930000,-1.538000,53.340000>0.457200}
cylinder{<72.390000,0.038000,50.800000><72.390000,-1.538000,50.800000>0.457200}
cylinder{<74.930000,0.038000,50.800000><74.930000,-1.538000,50.800000>0.457200}
cylinder{<72.390000,0.038000,48.260000><72.390000,-1.538000,48.260000>0.457200}
cylinder{<74.930000,0.038000,48.260000><74.930000,-1.538000,48.260000>0.457200}
cylinder{<72.390000,0.038000,45.720000><72.390000,-1.538000,45.720000>0.457200}
cylinder{<74.930000,0.038000,45.720000><74.930000,-1.538000,45.720000>0.457200}
cylinder{<72.390000,0.038000,43.180000><72.390000,-1.538000,43.180000>0.457200}
cylinder{<74.930000,0.038000,43.180000><74.930000,-1.538000,43.180000>0.457200}
cylinder{<72.390000,0.038000,40.640000><72.390000,-1.538000,40.640000>0.457200}
cylinder{<74.930000,0.038000,40.640000><74.930000,-1.538000,40.640000>0.457200}
cylinder{<72.390000,0.038000,38.100000><72.390000,-1.538000,38.100000>0.457200}
cylinder{<74.930000,0.038000,38.100000><74.930000,-1.538000,38.100000>0.457200}
cylinder{<72.390000,0.038000,35.560000><72.390000,-1.538000,35.560000>0.457200}
cylinder{<74.930000,0.038000,35.560000><74.930000,-1.538000,35.560000>0.457200}
cylinder{<72.390000,0.038000,33.020000><72.390000,-1.538000,33.020000>0.457200}
cylinder{<74.930000,0.038000,33.020000><74.930000,-1.538000,33.020000>0.457200}
cylinder{<72.390000,0.038000,30.480000><72.390000,-1.538000,30.480000>0.457200}
cylinder{<74.930000,0.038000,30.480000><74.930000,-1.538000,30.480000>0.457200}
cylinder{<32.766000,0.038000,9.906000><32.766000,-1.538000,9.906000>0.444500}
cylinder{<34.036000,0.038000,12.446000><34.036000,-1.538000,12.446000>0.444500}
cylinder{<35.306000,0.038000,9.906000><35.306000,-1.538000,9.906000>0.444500}
cylinder{<36.576000,0.038000,12.446000><36.576000,-1.538000,12.446000>0.444500}
cylinder{<37.846000,0.038000,9.906000><37.846000,-1.538000,9.906000>0.444500}
cylinder{<39.116000,0.038000,12.446000><39.116000,-1.538000,12.446000>0.444500}
cylinder{<40.386000,0.038000,9.906000><40.386000,-1.538000,9.906000>0.444500}
cylinder{<41.656000,0.038000,12.446000><41.656000,-1.538000,12.446000>0.444500}
cylinder{<48.641000,0.038000,9.906000><48.641000,-1.538000,9.906000>0.444500}
cylinder{<49.911000,0.038000,12.446000><49.911000,-1.538000,12.446000>0.444500}
cylinder{<51.181000,0.038000,9.906000><51.181000,-1.538000,9.906000>0.444500}
cylinder{<52.451000,0.038000,12.446000><52.451000,-1.538000,12.446000>0.444500}
cylinder{<53.721000,0.038000,9.906000><53.721000,-1.538000,9.906000>0.444500}
cylinder{<54.991000,0.038000,12.446000><54.991000,-1.538000,12.446000>0.444500}
cylinder{<56.261000,0.038000,9.906000><56.261000,-1.538000,9.906000>0.444500}
cylinder{<57.531000,0.038000,12.446000><57.531000,-1.538000,12.446000>0.444500}
cylinder{<64.516000,0.038000,9.906000><64.516000,-1.538000,9.906000>0.444500}
cylinder{<65.786000,0.038000,12.446000><65.786000,-1.538000,12.446000>0.444500}
cylinder{<67.056000,0.038000,9.906000><67.056000,-1.538000,9.906000>0.444500}
cylinder{<68.326000,0.038000,12.446000><68.326000,-1.538000,12.446000>0.444500}
cylinder{<69.596000,0.038000,9.906000><69.596000,-1.538000,9.906000>0.444500}
cylinder{<70.866000,0.038000,12.446000><70.866000,-1.538000,12.446000>0.444500}
cylinder{<72.136000,0.038000,9.906000><72.136000,-1.538000,9.906000>0.444500}
cylinder{<73.406000,0.038000,12.446000><73.406000,-1.538000,12.446000>0.444500}
cylinder{<16.891000,0.038000,9.906000><16.891000,-1.538000,9.906000>0.444500}
cylinder{<18.161000,0.038000,12.446000><18.161000,-1.538000,12.446000>0.444500}
cylinder{<19.431000,0.038000,9.906000><19.431000,-1.538000,9.906000>0.444500}
cylinder{<20.701000,0.038000,12.446000><20.701000,-1.538000,12.446000>0.444500}
cylinder{<21.971000,0.038000,9.906000><21.971000,-1.538000,9.906000>0.444500}
cylinder{<23.241000,0.038000,12.446000><23.241000,-1.538000,12.446000>0.444500}
cylinder{<24.511000,0.038000,9.906000><24.511000,-1.538000,9.906000>0.444500}
cylinder{<25.781000,0.038000,12.446000><25.781000,-1.538000,12.446000>0.444500}
cylinder{<80.645000,0.038000,9.906000><80.645000,-1.538000,9.906000>0.444500}
cylinder{<81.915000,0.038000,12.446000><81.915000,-1.538000,12.446000>0.444500}
cylinder{<83.185000,0.038000,9.906000><83.185000,-1.538000,9.906000>0.444500}
cylinder{<84.455000,0.038000,12.446000><84.455000,-1.538000,12.446000>0.444500}
cylinder{<85.725000,0.038000,9.906000><85.725000,-1.538000,9.906000>0.444500}
cylinder{<86.995000,0.038000,12.446000><86.995000,-1.538000,12.446000>0.444500}
cylinder{<88.265000,0.038000,9.906000><88.265000,-1.538000,9.906000>0.444500}
cylinder{<89.535000,0.038000,12.446000><89.535000,-1.538000,12.446000>0.444500}
cylinder{<66.802000,0.038000,37.846000><66.802000,-1.538000,37.846000>0.508000}
cylinder{<64.262000,0.038000,37.846000><64.262000,-1.538000,37.846000>0.508000}
cylinder{<-11.811000,0.038000,82.590000><-11.811000,-1.538000,82.590000>0.450000}
cylinder{<-11.811000,0.038000,74.890000><-11.811000,-1.538000,74.890000>0.450000}
cylinder{<39.370000,0.038000,31.115000><39.370000,-1.538000,31.115000>0.508000}
cylinder{<66.040000,0.038000,31.115000><66.040000,-1.538000,31.115000>0.508000}
cylinder{<-16.865600,0.038000,8.610600><-16.865600,-1.538000,8.610600>0.508000}
cylinder{<-16.865600,0.038000,4.089400><-16.865600,-1.538000,4.089400>0.508000}
cylinder{<-14.376400,0.038000,9.855200><-14.376400,-1.538000,9.855200>0.749300}
cylinder{<-14.376400,0.038000,2.844800><-14.376400,-1.538000,2.844800>0.749300}
cylinder{<22.860000,0.038000,20.320000><22.860000,-1.538000,20.320000>0.400000}
cylinder{<81.280000,0.038000,68.580000><81.280000,-1.538000,68.580000>0.400000}
cylinder{<83.820000,0.038000,68.580000><83.820000,-1.538000,68.580000>0.400000}
cylinder{<25.400000,0.038000,20.320000><25.400000,-1.538000,20.320000>0.400000}
cylinder{<38.100000,0.038000,20.320000><38.100000,-1.538000,20.320000>0.400000}
cylinder{<40.640000,0.038000,20.320000><40.640000,-1.538000,20.320000>0.400000}
cylinder{<43.180000,0.038000,20.320000><43.180000,-1.538000,20.320000>0.400000}
cylinder{<45.720000,0.038000,20.320000><45.720000,-1.538000,20.320000>0.400000}
cylinder{<48.260000,0.038000,20.320000><48.260000,-1.538000,20.320000>0.400000}
cylinder{<50.800000,0.038000,20.320000><50.800000,-1.538000,20.320000>0.400000}
cylinder{<53.340000,0.038000,20.320000><53.340000,-1.538000,20.320000>0.400000}
cylinder{<55.880000,0.038000,20.320000><55.880000,-1.538000,20.320000>0.400000}
cylinder{<60.960000,0.038000,20.320000><60.960000,-1.538000,20.320000>0.400000}
cylinder{<63.500000,0.038000,20.320000><63.500000,-1.538000,20.320000>0.400000}
cylinder{<66.040000,0.038000,20.320000><66.040000,-1.538000,20.320000>0.400000}
cylinder{<68.580000,0.038000,20.320000><68.580000,-1.538000,20.320000>0.400000}
cylinder{<71.120000,0.038000,20.320000><71.120000,-1.538000,20.320000>0.400000}
cylinder{<73.660000,0.038000,20.320000><73.660000,-1.538000,20.320000>0.400000}
cylinder{<76.200000,0.038000,20.320000><76.200000,-1.538000,20.320000>0.400000}
cylinder{<78.740000,0.038000,20.320000><78.740000,-1.538000,20.320000>0.400000}
cylinder{<11.430000,0.038000,68.580000><11.430000,-1.538000,68.580000>0.400000}
cylinder{<50.800000,0.038000,68.580000><50.800000,-1.538000,68.580000>0.400000}
cylinder{<48.260000,0.038000,68.580000><48.260000,-1.538000,68.580000>0.400000}
cylinder{<45.720000,0.038000,68.580000><45.720000,-1.538000,68.580000>0.400000}
cylinder{<43.180000,0.038000,68.580000><43.180000,-1.538000,68.580000>0.400000}
cylinder{<40.640000,0.038000,68.580000><40.640000,-1.538000,68.580000>0.400000}
cylinder{<38.100000,0.038000,68.580000><38.100000,-1.538000,68.580000>0.400000}
cylinder{<35.560000,0.038000,68.580000><35.560000,-1.538000,68.580000>0.400000}
cylinder{<33.020000,0.038000,68.580000><33.020000,-1.538000,68.580000>0.400000}
cylinder{<29.210000,0.038000,68.580000><29.210000,-1.538000,68.580000>0.400000}
cylinder{<26.670000,0.038000,68.580000><26.670000,-1.538000,68.580000>0.400000}
cylinder{<24.130000,0.038000,68.580000><24.130000,-1.538000,68.580000>0.400000}
cylinder{<21.590000,0.038000,68.580000><21.590000,-1.538000,68.580000>0.400000}
cylinder{<19.050000,0.038000,68.580000><19.050000,-1.538000,68.580000>0.400000}
cylinder{<16.510000,0.038000,68.580000><16.510000,-1.538000,68.580000>0.400000}
cylinder{<55.880000,0.038000,68.580000><55.880000,-1.538000,68.580000>0.400000}
cylinder{<58.420000,0.038000,68.580000><58.420000,-1.538000,68.580000>0.400000}
cylinder{<60.960000,0.038000,68.580000><60.960000,-1.538000,68.580000>0.400000}
cylinder{<63.500000,0.038000,68.580000><63.500000,-1.538000,68.580000>0.400000}
cylinder{<66.040000,0.038000,68.580000><66.040000,-1.538000,68.580000>0.400000}
cylinder{<68.580000,0.038000,68.580000><68.580000,-1.538000,68.580000>0.400000}
cylinder{<71.120000,0.038000,68.580000><71.120000,-1.538000,68.580000>0.400000}
cylinder{<73.660000,0.038000,68.580000><73.660000,-1.538000,68.580000>0.400000}
cylinder{<81.280000,0.038000,66.040000><81.280000,-1.538000,66.040000>0.400000}
cylinder{<83.820000,0.038000,66.040000><83.820000,-1.538000,66.040000>0.400000}
cylinder{<81.280000,0.038000,63.500000><81.280000,-1.538000,63.500000>0.400000}
cylinder{<83.820000,0.038000,63.500000><83.820000,-1.538000,63.500000>0.400000}
cylinder{<81.280000,0.038000,60.960000><81.280000,-1.538000,60.960000>0.400000}
cylinder{<83.820000,0.038000,60.960000><83.820000,-1.538000,60.960000>0.400000}
cylinder{<81.280000,0.038000,58.420000><81.280000,-1.538000,58.420000>0.400000}
cylinder{<83.820000,0.038000,58.420000><83.820000,-1.538000,58.420000>0.400000}
cylinder{<81.280000,0.038000,55.880000><81.280000,-1.538000,55.880000>0.400000}
cylinder{<83.820000,0.038000,55.880000><83.820000,-1.538000,55.880000>0.400000}
cylinder{<81.280000,0.038000,53.340000><81.280000,-1.538000,53.340000>0.400000}
cylinder{<83.820000,0.038000,53.340000><83.820000,-1.538000,53.340000>0.400000}
cylinder{<81.280000,0.038000,50.800000><81.280000,-1.538000,50.800000>0.400000}
cylinder{<83.820000,0.038000,50.800000><83.820000,-1.538000,50.800000>0.400000}
cylinder{<81.280000,0.038000,48.260000><81.280000,-1.538000,48.260000>0.400000}
cylinder{<83.820000,0.038000,48.260000><83.820000,-1.538000,48.260000>0.400000}
cylinder{<81.280000,0.038000,45.720000><81.280000,-1.538000,45.720000>0.400000}
cylinder{<83.820000,0.038000,45.720000><83.820000,-1.538000,45.720000>0.400000}
cylinder{<81.280000,0.038000,43.180000><81.280000,-1.538000,43.180000>0.400000}
cylinder{<83.820000,0.038000,43.180000><83.820000,-1.538000,43.180000>0.400000}
cylinder{<81.280000,0.038000,40.640000><81.280000,-1.538000,40.640000>0.400000}
cylinder{<83.820000,0.038000,40.640000><83.820000,-1.538000,40.640000>0.400000}
cylinder{<81.280000,0.038000,38.100000><81.280000,-1.538000,38.100000>0.400000}
cylinder{<83.820000,0.038000,38.100000><83.820000,-1.538000,38.100000>0.400000}
cylinder{<81.280000,0.038000,35.560000><81.280000,-1.538000,35.560000>0.400000}
cylinder{<83.820000,0.038000,35.560000><83.820000,-1.538000,35.560000>0.400000}
cylinder{<81.280000,0.038000,33.020000><81.280000,-1.538000,33.020000>0.400000}
cylinder{<83.820000,0.038000,33.020000><83.820000,-1.538000,33.020000>0.400000}
cylinder{<81.280000,0.038000,30.480000><81.280000,-1.538000,30.480000>0.400000}
cylinder{<83.820000,0.038000,30.480000><83.820000,-1.538000,30.480000>0.400000}
cylinder{<81.280000,0.038000,27.940000><81.280000,-1.538000,27.940000>0.400000}
cylinder{<83.820000,0.038000,27.940000><83.820000,-1.538000,27.940000>0.400000}
cylinder{<13.970000,0.038000,68.580000><13.970000,-1.538000,68.580000>0.400000}
cylinder{<81.280000,0.038000,25.400000><81.280000,-1.538000,25.400000>0.400000}
cylinder{<83.820000,0.038000,25.400000><83.820000,-1.538000,25.400000>0.400000}
cylinder{<27.940000,0.038000,20.320000><27.940000,-1.538000,20.320000>0.400000}
cylinder{<30.480000,0.038000,20.320000><30.480000,-1.538000,20.320000>0.400000}
cylinder{<20.320000,0.038000,20.320000><20.320000,-1.538000,20.320000>0.400000}
cylinder{<33.020000,0.038000,20.320000><33.020000,-1.538000,20.320000>0.400000}
cylinder{<9.894600,0.038000,46.081800><9.894600,-1.538000,46.081800>0.550000 }
cylinder{<9.897600,0.038000,25.088000><9.897600,-1.538000,25.088000>0.800000 }
cylinder{<9.894600,0.038000,46.081800><9.894600,-1.538000,46.081800>0.550000 }
cylinder{<9.897600,0.038000,25.088000><9.897600,-1.538000,25.088000>0.800000 }
cylinder{<9.894600,0.038000,46.081800><9.894600,-1.538000,46.081800>0.550000 }
cylinder{<9.897600,0.038000,25.088000><9.897600,-1.538000,25.088000>0.800000 }
cylinder{<9.894600,0.038000,46.081800><9.894600,-1.538000,46.081800>0.550000 }
cylinder{<9.897600,0.038000,25.088000><9.897600,-1.538000,25.088000>0.800000 }
cylinder{<9.894600,0.038000,46.081800><9.894600,-1.538000,46.081800>0.550000 }
cylinder{<9.897600,0.038000,25.088000><9.897600,-1.538000,25.088000>0.800000 }
cylinder{<9.894600,0.038000,46.081800><9.894600,-1.538000,46.081800>0.550000 }
cylinder{<9.897600,0.038000,25.088000><9.897600,-1.538000,25.088000>0.800000 }
cylinder{<9.894600,0.038000,46.081800><9.894600,-1.538000,46.081800>0.550000 }
cylinder{<9.897600,0.038000,25.088000><9.897600,-1.538000,25.088000>0.800000 }
cylinder{<9.894600,0.038000,46.081800><9.894600,-1.538000,46.081800>0.550000 }
cylinder{<9.897600,0.038000,25.088000><9.897600,-1.538000,25.088000>0.800000 }
cylinder{<9.894600,0.038000,46.081800><9.894600,-1.538000,46.081800>0.550000 }
cylinder{<9.897600,0.038000,25.088000><9.897600,-1.538000,25.088000>0.800000 }
cylinder{<9.894600,0.038000,46.081800><9.894600,-1.538000,46.081800>0.550000 }
cylinder{<9.897600,0.038000,25.088000><9.897600,-1.538000,25.088000>0.800000 }
cylinder{<9.894600,0.038000,46.081800><9.894600,-1.538000,46.081800>0.550000 }
cylinder{<9.897600,0.038000,25.088000><9.897600,-1.538000,25.088000>0.800000 }
cylinder{<9.894600,0.038000,46.081800><9.894600,-1.538000,46.081800>0.550000 }
cylinder{<9.897600,0.038000,25.088000><9.897600,-1.538000,25.088000>0.800000 }
cylinder{<9.894600,0.038000,46.081800><9.894600,-1.538000,46.081800>0.550000 }
cylinder{<9.897600,0.038000,25.088000><9.897600,-1.538000,25.088000>0.800000 }
cylinder{<86.360000,0.038000,82.550000><86.360000,-1.538000,82.550000>0.457200}
cylinder{<86.360000,0.038000,80.010000><86.360000,-1.538000,80.010000>0.457200}
cylinder{<83.820000,0.038000,82.550000><83.820000,-1.538000,82.550000>0.457200}
cylinder{<83.820000,0.038000,80.010000><83.820000,-1.538000,80.010000>0.457200}
cylinder{<81.280000,0.038000,82.550000><81.280000,-1.538000,82.550000>0.457200}
cylinder{<81.280000,0.038000,80.010000><81.280000,-1.538000,80.010000>0.457200}
cylinder{<12.827000,0.038000,56.134000><12.827000,-1.538000,56.134000>0.508000}
cylinder{<12.827000,0.038000,58.674000><12.827000,-1.538000,58.674000>0.508000}
cylinder{<12.827000,0.038000,61.214000><12.827000,-1.538000,61.214000>0.508000}
cylinder{<12.827000,0.038000,63.754000><12.827000,-1.538000,63.754000>0.508000}
cylinder{<3.810000,0.038000,56.134000><3.810000,-1.538000,56.134000>0.508000}
cylinder{<3.810000,0.038000,58.674000><3.810000,-1.538000,58.674000>0.508000}
cylinder{<3.810000,0.038000,61.214000><3.810000,-1.538000,61.214000>0.508000}
cylinder{<3.810000,0.038000,63.754000><3.810000,-1.538000,63.754000>0.508000}
cylinder{<99.270000,0.038000,70.970000><99.270000,-1.538000,70.970000>0.700000}
cylinder{<99.270000,0.038000,66.770000><99.270000,-1.538000,66.770000>0.700000}
cylinder{<99.270000,0.038000,62.570000><99.270000,-1.538000,62.570000>0.700000}
cylinder{<99.270000,0.038000,58.370000><99.270000,-1.538000,58.370000>0.700000}
cylinder{<99.270000,0.038000,54.170000><99.270000,-1.538000,54.170000>0.700000}
cylinder{<99.270000,0.038000,49.970000><99.270000,-1.538000,49.970000>0.700000}
cylinder{<99.270000,0.038000,45.770000><99.270000,-1.538000,45.770000>0.700000}
cylinder{<99.270000,0.038000,41.570000><99.270000,-1.538000,41.570000>0.700000}
cylinder{<99.270000,0.038000,37.370000><99.270000,-1.538000,37.370000>0.700000}
cylinder{<99.270000,0.038000,33.170000><99.270000,-1.538000,33.170000>0.700000}
cylinder{<93.770000,0.038000,70.970000><93.770000,-1.538000,70.970000>0.700000}
cylinder{<93.770000,0.038000,66.770000><93.770000,-1.538000,66.770000>0.700000}
cylinder{<93.770000,0.038000,62.570000><93.770000,-1.538000,62.570000>0.700000}
cylinder{<93.770000,0.038000,58.370000><93.770000,-1.538000,58.370000>0.700000}
cylinder{<93.770000,0.038000,54.170000><93.770000,-1.538000,54.170000>0.700000}
cylinder{<93.770000,0.038000,49.970000><93.770000,-1.538000,49.970000>0.700000}
cylinder{<93.770000,0.038000,45.770000><93.770000,-1.538000,45.770000>0.700000}
cylinder{<93.770000,0.038000,41.570000><93.770000,-1.538000,41.570000>0.700000}
cylinder{<93.770000,0.038000,37.370000><93.770000,-1.538000,37.370000>0.700000}
cylinder{<93.770000,0.038000,33.170000><93.770000,-1.538000,33.170000>0.700000}
cylinder{<69.850000,0.038000,82.550000><69.850000,-1.538000,82.550000>0.457200}
cylinder{<69.850000,0.038000,80.010000><69.850000,-1.538000,80.010000>0.457200}
cylinder{<67.310000,0.038000,82.550000><67.310000,-1.538000,82.550000>0.457200}
cylinder{<67.310000,0.038000,80.010000><67.310000,-1.538000,80.010000>0.457200}
cylinder{<64.770000,0.038000,82.550000><64.770000,-1.538000,82.550000>0.457200}
cylinder{<64.770000,0.038000,80.010000><64.770000,-1.538000,80.010000>0.457200}
cylinder{<30.861000,0.038000,56.134000><30.861000,-1.538000,56.134000>0.508000}
cylinder{<30.861000,0.038000,58.674000><30.861000,-1.538000,58.674000>0.508000}
cylinder{<30.861000,0.038000,61.214000><30.861000,-1.538000,61.214000>0.508000}
cylinder{<30.861000,0.038000,63.754000><30.861000,-1.538000,63.754000>0.508000}
cylinder{<21.844000,0.038000,56.134000><21.844000,-1.538000,56.134000>0.508000}
cylinder{<21.844000,0.038000,58.674000><21.844000,-1.538000,58.674000>0.508000}
cylinder{<21.844000,0.038000,61.214000><21.844000,-1.538000,61.214000>0.508000}
cylinder{<21.844000,0.038000,63.754000><21.844000,-1.538000,63.754000>0.508000}
cylinder{<53.340000,0.038000,82.550000><53.340000,-1.538000,82.550000>0.457200}
cylinder{<53.340000,0.038000,80.010000><53.340000,-1.538000,80.010000>0.457200}
cylinder{<50.800000,0.038000,82.550000><50.800000,-1.538000,82.550000>0.457200}
cylinder{<50.800000,0.038000,80.010000><50.800000,-1.538000,80.010000>0.457200}
cylinder{<48.260000,0.038000,82.550000><48.260000,-1.538000,82.550000>0.457200}
cylinder{<48.260000,0.038000,80.010000><48.260000,-1.538000,80.010000>0.457200}
cylinder{<49.149000,0.038000,56.134000><49.149000,-1.538000,56.134000>0.508000}
cylinder{<49.149000,0.038000,58.674000><49.149000,-1.538000,58.674000>0.508000}
cylinder{<49.149000,0.038000,61.214000><49.149000,-1.538000,61.214000>0.508000}
cylinder{<49.149000,0.038000,63.754000><49.149000,-1.538000,63.754000>0.508000}
cylinder{<40.132000,0.038000,56.134000><40.132000,-1.538000,56.134000>0.508000}
cylinder{<40.132000,0.038000,58.674000><40.132000,-1.538000,58.674000>0.508000}
cylinder{<40.132000,0.038000,61.214000><40.132000,-1.538000,61.214000>0.508000}
cylinder{<40.132000,0.038000,63.754000><40.132000,-1.538000,63.754000>0.508000}
//Holes(fast)/Vias
cylinder{<56.769000,0.038000,36.449000><56.769000,-1.538000,36.449000>0.254000 }
cylinder{<97.332800,0.038000,18.186400><97.332800,-1.538000,18.186400>0.355600 }
cylinder{<32.727900,0.038000,49.542700><32.727900,-1.538000,49.542700>0.300000 }
cylinder{<43.878500,0.038000,72.809100><43.878500,-1.538000,72.809100>0.300000 }
cylinder{<44.577000,0.038000,70.231000><44.577000,-1.538000,70.231000>0.254000 }
cylinder{<43.815000,0.038000,49.149000><43.815000,-1.538000,49.149000>0.254000 }
cylinder{<62.865000,0.038000,34.544000><62.865000,-1.538000,34.544000>0.254000 }
cylinder{<62.103000,0.038000,50.800000><62.103000,-1.538000,50.800000>0.254000 }
cylinder{<66.116200,0.038000,46.901100><66.116200,-1.538000,46.901100>0.254000 }
cylinder{<70.345300,0.038000,77.127100><70.345300,-1.538000,77.127100>0.254000 }
cylinder{<80.352900,0.038000,75.704700><80.352900,-1.538000,75.704700>0.300000 }
cylinder{<85.471000,0.038000,72.085200><85.471000,-1.538000,72.085200>0.300000 }
cylinder{<78.308200,0.038000,75.717400><78.308200,-1.538000,75.717400>0.300000 }
cylinder{<65.024000,0.038000,51.066700><65.024000,-1.538000,51.066700>0.254000 }
cylinder{<68.440300,0.038000,56.210200><68.440300,-1.538000,56.210200>0.254000 }
cylinder{<64.922400,0.038000,52.730400><64.922400,-1.538000,52.730400>0.254000 }
cylinder{<56.388000,0.038000,26.035000><56.388000,-1.538000,26.035000>0.254000 }
cylinder{<70.497700,0.038000,26.009600><70.497700,-1.538000,26.009600>0.254000 }
cylinder{<32.385000,0.038000,34.074100><32.385000,-1.538000,34.074100>0.254000 }
cylinder{<41.071800,0.038000,38.252400><41.071800,-1.538000,38.252400>0.254000 }
cylinder{<36.296600,0.038000,50.660300><36.296600,-1.538000,50.660300>0.254000 }
cylinder{<8.242300,0.038000,52.298600><8.242300,-1.538000,52.298600>0.254000 }
cylinder{<35.013900,0.038000,28.536900><35.013900,-1.538000,28.536900>0.254000 }
cylinder{<20.358100,0.038000,23.761700><20.358100,-1.538000,23.761700>0.254000 }
cylinder{<-4.978400,0.038000,5.803900><-4.978400,-1.538000,5.803900>0.254000 }
cylinder{<27.686000,0.038000,14.757400><27.686000,-1.538000,14.757400>0.254000 }
cylinder{<45.059600,0.038000,16.103600><45.059600,-1.538000,16.103600>0.254000 }
cylinder{<60.858400,0.038000,15.976600><60.858400,-1.538000,15.976600>0.254000 }
cylinder{<79.070200,0.038000,16.116300><79.070200,-1.538000,16.116300>0.254000 }
cylinder{<87.630000,0.038000,25.908000><87.630000,-1.538000,25.908000>0.254000 }
cylinder{<87.591900,0.038000,52.692300><87.591900,-1.538000,52.692300>0.254000 }
cylinder{<89.001600,0.038000,72.110600><89.001600,-1.538000,72.110600>0.254000 }
cylinder{<34.366200,0.038000,73.139300><34.366200,-1.538000,73.139300>0.254000 }
cylinder{<53.911500,0.038000,65.874900><53.911500,-1.538000,65.874900>0.254000 }
cylinder{<17.830800,0.038000,72.923400><17.830800,-1.538000,72.923400>0.254000 }
cylinder{<-4.851400,0.038000,68.326000><-4.851400,-1.538000,68.326000>0.254000 }
cylinder{<25.387300,0.038000,82.626200><25.387300,-1.538000,82.626200>0.300000 }
cylinder{<42.240200,0.038000,82.969100><42.240200,-1.538000,82.969100>0.300000 }
cylinder{<58.915300,0.038000,83.845400><58.915300,-1.538000,83.845400>0.300000 }
cylinder{<75.692000,0.038000,83.629500><75.692000,-1.538000,83.629500>0.300000 }
cylinder{<90.881200,0.038000,83.629500><90.881200,-1.538000,83.629500>0.300000 }
cylinder{<22.555200,0.038000,79.756000><22.555200,-1.538000,79.756000>0.300000 }
cylinder{<39.090600,0.038000,79.121000><39.090600,-1.538000,79.121000>0.300000 }
cylinder{<55.981600,0.038000,79.717900><55.981600,-1.538000,79.717900>0.300000 }
cylinder{<72.351900,0.038000,78.549500><72.351900,-1.538000,78.549500>0.300000 }
cylinder{<75.933300,0.038000,65.303400><75.933300,-1.538000,65.303400>0.300000 }
cylinder{<17.602200,0.038000,40.436800><17.602200,-1.538000,40.436800>0.300000 }
cylinder{<16.040100,0.038000,32.727900><16.040100,-1.538000,32.727900>0.300000 }
cylinder{<61.048900,0.038000,27.813000><61.048900,-1.538000,27.813000>0.300000 }
cylinder{<45.364400,0.038000,42.189400><45.364400,-1.538000,42.189400>0.300000 }
cylinder{<61.722000,0.038000,33.401000><61.722000,-1.538000,33.401000>0.254000 }
cylinder{<25.019000,0.038000,29.718000><25.019000,-1.538000,29.718000>0.254000 }
cylinder{<15.684500,0.038000,30.226000><15.684500,-1.538000,30.226000>0.300000 }
cylinder{<24.206200,0.038000,27.584400><24.206200,-1.538000,27.584400>0.254000 }
cylinder{<15.722600,0.038000,27.597100><15.722600,-1.538000,27.597100>0.300000 }
cylinder{<18.249900,0.038000,14.782800><18.249900,-1.538000,14.782800>0.300000 }
cylinder{<51.308000,0.038000,40.640000><51.308000,-1.538000,40.640000>0.254000 }
cylinder{<64.008000,0.038000,27.940000><64.008000,-1.538000,27.940000>0.254000 }
cylinder{<-2.540000,0.038000,54.229000><-2.540000,-1.538000,54.229000>0.254000 }
cylinder{<22.733000,0.038000,46.609000><22.733000,-1.538000,46.609000>0.254000 }
cylinder{<61.595000,0.038000,59.055000><61.595000,-1.538000,59.055000>0.254000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.356100,0.000000,76.746100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.296700,0.000000,76.746100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<-5.296700,0.000000,76.746100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.296700,0.000000,76.746100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.296700,0.000000,77.216400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<-5.296700,0.000000,77.216400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.296700,0.000000,77.216400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.139900,0.000000,77.373100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<-5.296700,0.000000,77.216400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.139900,0.000000,77.373100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.826400,0.000000,77.373100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<-5.139900,0.000000,77.373100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.826400,0.000000,77.373100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.669600,0.000000,77.216400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<-4.826400,0.000000,77.373100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.669600,0.000000,77.216400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.669600,0.000000,76.746100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<-4.669600,0.000000,76.746100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.356100,0.000000,77.681600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.356100,0.000000,77.995100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<-4.356100,0.000000,77.995100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.356100,0.000000,77.838300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.296700,0.000000,77.838300>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<-5.296700,0.000000,77.838300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.296700,0.000000,77.681600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.296700,0.000000,77.995100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<-5.296700,0.000000,77.995100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.296700,0.000000,78.932200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.296700,0.000000,78.305200>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<-5.296700,0.000000,78.305200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.296700,0.000000,78.305200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.356100,0.000000,78.305200>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<-5.296700,0.000000,78.305200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.356100,0.000000,78.305200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.356100,0.000000,78.932200>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<-4.356100,0.000000,78.932200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.826400,0.000000,78.305200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.826400,0.000000,78.618700>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<-4.826400,0.000000,78.618700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.296700,0.000000,79.240700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.296700,0.000000,79.867700>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<-5.296700,0.000000,79.867700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.296700,0.000000,79.867700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.139900,0.000000,79.867700>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<-5.296700,0.000000,79.867700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.139900,0.000000,79.867700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.512800,0.000000,79.240700>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,44.992462,0> translate<-5.139900,0.000000,79.867700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.512800,0.000000,79.240700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.356100,0.000000,79.240700>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<-4.512800,0.000000,79.240700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.356100,0.000000,79.240700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.356100,0.000000,79.867700>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<-4.356100,0.000000,79.867700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.296700,0.000000,80.646500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.296700,0.000000,80.332900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<-5.296700,0.000000,80.332900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.296700,0.000000,80.332900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.139900,0.000000,80.176200>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<-5.296700,0.000000,80.332900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.139900,0.000000,80.176200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.512800,0.000000,80.176200>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<-5.139900,0.000000,80.176200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.512800,0.000000,80.176200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.356100,0.000000,80.332900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<-4.512800,0.000000,80.176200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.356100,0.000000,80.332900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.356100,0.000000,80.646500>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<-4.356100,0.000000,80.646500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.356100,0.000000,80.646500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.512800,0.000000,80.803200>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<-4.512800,0.000000,80.803200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.512800,0.000000,80.803200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.139900,0.000000,80.803200>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<-5.139900,0.000000,80.803200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.139900,0.000000,80.803200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.296700,0.000000,80.646500>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<-5.296700,0.000000,80.646500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.461200,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.461200,0.000000,44.781700>}
box{<0,0,-0.076200><1.779500,0.036000,0.076200> rotate<0,90.000000,0> translate<32.461200,0.000000,44.781700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.461200,0.000000,44.781700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.054300,0.000000,44.188500>}
box{<0,0,-0.076200><0.838841,0.036000,0.076200> rotate<0,45.001860,0> translate<32.461200,0.000000,44.781700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.054300,0.000000,44.188500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.647500,0.000000,44.781700>}
box{<0,0,-0.076200><0.838911,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.054300,0.000000,44.188500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.647500,0.000000,44.781700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.647500,0.000000,43.002200>}
box{<0,0,-0.076200><1.779500,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.647500,0.000000,43.002200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.535100,0.000000,44.188500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.128300,0.000000,44.188500>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,0.000000,0> translate<34.535100,0.000000,44.188500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.128300,0.000000,44.188500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.424900,0.000000,43.891900>}
box{<0,0,-0.076200><0.419456,0.036000,0.076200> rotate<0,44.997030,0> translate<35.128300,0.000000,44.188500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.424900,0.000000,43.891900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.424900,0.000000,43.002200>}
box{<0,0,-0.076200><0.889700,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.424900,0.000000,43.002200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.424900,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.535100,0.000000,43.002200>}
box{<0,0,-0.076200><0.889800,0.036000,0.076200> rotate<0,0.000000,0> translate<34.535100,0.000000,43.002200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.535100,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.238600,0.000000,43.298700>}
box{<0,0,-0.076200><0.419314,0.036000,0.076200> rotate<0,44.997030,0> translate<34.238600,0.000000,43.298700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.238600,0.000000,43.298700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.535100,0.000000,43.595300>}
box{<0,0,-0.076200><0.419385,0.036000,0.076200> rotate<0,-45.006690,0> translate<34.238600,0.000000,43.298700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.535100,0.000000,43.595300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.424900,0.000000,43.595300>}
box{<0,0,-0.076200><0.889800,0.036000,0.076200> rotate<0,0.000000,0> translate<34.535100,0.000000,43.595300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.016000,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.016000,0.000000,44.781700>}
box{<0,0,-0.076200><1.779500,0.036000,0.076200> rotate<0,90.000000,0> translate<36.016000,0.000000,44.781700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.905700,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.016000,0.000000,43.595300>}
box{<0,0,-0.076200><1.069268,0.036000,0.076200> rotate<0,33.686358,0> translate<36.016000,0.000000,43.595300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.016000,0.000000,43.595300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.905700,0.000000,44.188500>}
box{<0,0,-0.076200><1.069323,0.036000,0.076200> rotate<0,-33.690816,0> translate<36.016000,0.000000,43.595300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.386900,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.793700,0.000000,43.002200>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,0.000000,0> translate<37.793700,0.000000,43.002200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.793700,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.497200,0.000000,43.298700>}
box{<0,0,-0.076200><0.419314,0.036000,0.076200> rotate<0,44.997030,0> translate<37.497200,0.000000,43.298700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.497200,0.000000,43.298700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.497200,0.000000,43.891900>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,90.000000,0> translate<37.497200,0.000000,43.891900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.497200,0.000000,43.891900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.793700,0.000000,44.188500>}
box{<0,0,-0.076200><0.419385,0.036000,0.076200> rotate<0,-45.006690,0> translate<37.497200,0.000000,43.891900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.793700,0.000000,44.188500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.386900,0.000000,44.188500>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,0.000000,0> translate<37.793700,0.000000,44.188500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.386900,0.000000,44.188500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.683500,0.000000,43.891900>}
box{<0,0,-0.076200><0.419456,0.036000,0.076200> rotate<0,44.997030,0> translate<38.386900,0.000000,44.188500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.683500,0.000000,43.891900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.683500,0.000000,43.595300>}
box{<0,0,-0.076200><0.296600,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.683500,0.000000,43.595300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.683500,0.000000,43.595300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.497200,0.000000,43.595300>}
box{<0,0,-0.076200><1.186300,0.036000,0.076200> rotate<0,0.000000,0> translate<37.497200,0.000000,43.595300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.274600,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.274600,0.000000,44.188500>}
box{<0,0,-0.076200><1.186300,0.036000,0.076200> rotate<0,90.000000,0> translate<39.274600,0.000000,44.188500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.274600,0.000000,43.595300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.867700,0.000000,44.188500>}
box{<0,0,-0.076200><0.838841,0.036000,0.076200> rotate<0,-45.001860,0> translate<39.274600,0.000000,43.595300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.867700,0.000000,44.188500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.164300,0.000000,44.188500>}
box{<0,0,-0.076200><0.296600,0.036000,0.076200> rotate<0,0.000000,0> translate<39.867700,0.000000,44.188500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.755800,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.755800,0.000000,44.781700>}
box{<0,0,-0.076200><1.779500,0.036000,0.076200> rotate<0,90.000000,0> translate<40.755800,0.000000,44.781700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.755800,0.000000,44.781700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.645500,0.000000,44.781700>}
box{<0,0,-0.076200><0.889700,0.036000,0.076200> rotate<0,0.000000,0> translate<40.755800,0.000000,44.781700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.645500,0.000000,44.781700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.942100,0.000000,44.485100>}
box{<0,0,-0.076200><0.419456,0.036000,0.076200> rotate<0,44.997030,0> translate<41.645500,0.000000,44.781700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.942100,0.000000,44.485100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.942100,0.000000,44.188500>}
box{<0,0,-0.076200><0.296600,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.942100,0.000000,44.188500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.942100,0.000000,44.188500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.645500,0.000000,43.891900>}
box{<0,0,-0.076200><0.419456,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.645500,0.000000,43.891900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.645500,0.000000,43.891900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.942100,0.000000,43.595300>}
box{<0,0,-0.076200><0.419456,0.036000,0.076200> rotate<0,44.997030,0> translate<41.645500,0.000000,43.891900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.942100,0.000000,43.595300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.942100,0.000000,43.298700>}
box{<0,0,-0.076200><0.296600,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.942100,0.000000,43.298700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.942100,0.000000,43.298700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.645500,0.000000,43.002200>}
box{<0,0,-0.076200><0.419385,0.036000,0.076200> rotate<0,-44.987370,0> translate<41.645500,0.000000,43.002200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.645500,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.755800,0.000000,43.002200>}
box{<0,0,-0.076200><0.889700,0.036000,0.076200> rotate<0,0.000000,0> translate<40.755800,0.000000,43.002200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.755800,0.000000,43.891900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.645500,0.000000,43.891900>}
box{<0,0,-0.076200><0.889700,0.036000,0.076200> rotate<0,0.000000,0> translate<40.755800,0.000000,43.891900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.829700,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.422900,0.000000,43.002200>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,0.000000,0> translate<42.829700,0.000000,43.002200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.422900,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.719500,0.000000,43.298700>}
box{<0,0,-0.076200><0.419385,0.036000,0.076200> rotate<0,-44.987370,0> translate<43.422900,0.000000,43.002200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.719500,0.000000,43.298700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.719500,0.000000,43.891900>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,90.000000,0> translate<43.719500,0.000000,43.891900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.719500,0.000000,43.891900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.422900,0.000000,44.188500>}
box{<0,0,-0.076200><0.419456,0.036000,0.076200> rotate<0,44.997030,0> translate<43.422900,0.000000,44.188500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.422900,0.000000,44.188500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.829700,0.000000,44.188500>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,0.000000,0> translate<42.829700,0.000000,44.188500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.829700,0.000000,44.188500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.533200,0.000000,43.891900>}
box{<0,0,-0.076200><0.419385,0.036000,0.076200> rotate<0,-45.006690,0> translate<42.533200,0.000000,43.891900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.533200,0.000000,43.891900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.533200,0.000000,43.298700>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.533200,0.000000,43.298700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.533200,0.000000,43.298700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.829700,0.000000,43.002200>}
box{<0,0,-0.076200><0.419314,0.036000,0.076200> rotate<0,44.997030,0> translate<42.533200,0.000000,43.298700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.607100,0.000000,44.485100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.607100,0.000000,43.298700>}
box{<0,0,-0.076200><1.186400,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.607100,0.000000,43.298700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.607100,0.000000,43.298700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.903700,0.000000,43.002200>}
box{<0,0,-0.076200><0.419385,0.036000,0.076200> rotate<0,44.987370,0> translate<44.607100,0.000000,43.298700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.310600,0.000000,44.188500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.903700,0.000000,44.188500>}
box{<0,0,-0.076200><0.593100,0.036000,0.076200> rotate<0,0.000000,0> translate<44.310600,0.000000,44.188500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.461200,0.000000,39.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.461200,0.000000,41.606700>}
box{<0,0,-0.076200><1.779500,0.036000,0.076200> rotate<0,90.000000,0> translate<32.461200,0.000000,41.606700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.461200,0.000000,41.606700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.054300,0.000000,41.013500>}
box{<0,0,-0.076200><0.838841,0.036000,0.076200> rotate<0,45.001860,0> translate<32.461200,0.000000,41.606700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.054300,0.000000,41.013500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.647500,0.000000,41.606700>}
box{<0,0,-0.076200><0.838911,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.054300,0.000000,41.013500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.647500,0.000000,41.606700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.647500,0.000000,39.827200>}
box{<0,0,-0.076200><1.779500,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.647500,0.000000,39.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.535100,0.000000,39.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.128300,0.000000,39.827200>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,0.000000,0> translate<34.535100,0.000000,39.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.128300,0.000000,39.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.424900,0.000000,40.123700>}
box{<0,0,-0.076200><0.419385,0.036000,0.076200> rotate<0,-44.987370,0> translate<35.128300,0.000000,39.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.424900,0.000000,40.123700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.424900,0.000000,40.716900>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,90.000000,0> translate<35.424900,0.000000,40.716900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.424900,0.000000,40.716900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.128300,0.000000,41.013500>}
box{<0,0,-0.076200><0.419456,0.036000,0.076200> rotate<0,44.997030,0> translate<35.128300,0.000000,41.013500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.128300,0.000000,41.013500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.535100,0.000000,41.013500>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,0.000000,0> translate<34.535100,0.000000,41.013500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.535100,0.000000,41.013500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.238600,0.000000,40.716900>}
box{<0,0,-0.076200><0.419385,0.036000,0.076200> rotate<0,-45.006690,0> translate<34.238600,0.000000,40.716900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.238600,0.000000,40.716900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.238600,0.000000,40.123700>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.238600,0.000000,40.123700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.238600,0.000000,40.123700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.535100,0.000000,39.827200>}
box{<0,0,-0.076200><0.419314,0.036000,0.076200> rotate<0,44.997030,0> translate<34.238600,0.000000,40.123700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.312500,0.000000,41.310100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.312500,0.000000,40.123700>}
box{<0,0,-0.076200><1.186400,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.312500,0.000000,40.123700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.312500,0.000000,40.123700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.609100,0.000000,39.827200>}
box{<0,0,-0.076200><0.419385,0.036000,0.076200> rotate<0,44.987370,0> translate<36.312500,0.000000,40.123700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.016000,0.000000,41.013500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.609100,0.000000,41.013500>}
box{<0,0,-0.076200><0.593100,0.036000,0.076200> rotate<0,0.000000,0> translate<36.016000,0.000000,41.013500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.200900,0.000000,41.606700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.200900,0.000000,39.827200>}
box{<0,0,-0.076200><1.779500,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.200900,0.000000,39.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.200900,0.000000,40.716900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.497400,0.000000,41.013500>}
box{<0,0,-0.076200><0.419385,0.036000,0.076200> rotate<0,-45.006690,0> translate<37.200900,0.000000,40.716900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.497400,0.000000,41.013500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.090600,0.000000,41.013500>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,0.000000,0> translate<37.497400,0.000000,41.013500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.090600,0.000000,41.013500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.387200,0.000000,40.716900>}
box{<0,0,-0.076200><0.419456,0.036000,0.076200> rotate<0,44.997030,0> translate<38.090600,0.000000,41.013500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.387200,0.000000,40.716900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.387200,0.000000,39.827200>}
box{<0,0,-0.076200><0.889700,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.387200,0.000000,39.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.868000,0.000000,39.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.274800,0.000000,39.827200>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,0.000000,0> translate<39.274800,0.000000,39.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.274800,0.000000,39.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.978300,0.000000,40.123700>}
box{<0,0,-0.076200><0.419314,0.036000,0.076200> rotate<0,44.997030,0> translate<38.978300,0.000000,40.123700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.978300,0.000000,40.123700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.978300,0.000000,40.716900>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,90.000000,0> translate<38.978300,0.000000,40.716900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.978300,0.000000,40.716900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.274800,0.000000,41.013500>}
box{<0,0,-0.076200><0.419385,0.036000,0.076200> rotate<0,-45.006690,0> translate<38.978300,0.000000,40.716900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.274800,0.000000,41.013500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.868000,0.000000,41.013500>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,0.000000,0> translate<39.274800,0.000000,41.013500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.868000,0.000000,41.013500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.164600,0.000000,40.716900>}
box{<0,0,-0.076200><0.419456,0.036000,0.076200> rotate<0,44.997030,0> translate<39.868000,0.000000,41.013500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.164600,0.000000,40.716900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.164600,0.000000,40.420300>}
box{<0,0,-0.076200><0.296600,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.164600,0.000000,40.420300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.164600,0.000000,40.420300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.978300,0.000000,40.420300>}
box{<0,0,-0.076200><1.186300,0.036000,0.076200> rotate<0,0.000000,0> translate<38.978300,0.000000,40.420300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.755700,0.000000,39.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.755700,0.000000,41.013500>}
box{<0,0,-0.076200><1.186300,0.036000,0.076200> rotate<0,90.000000,0> translate<40.755700,0.000000,41.013500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.755700,0.000000,40.420300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.348800,0.000000,41.013500>}
box{<0,0,-0.076200><0.838841,0.036000,0.076200> rotate<0,-45.001860,0> translate<40.755700,0.000000,40.420300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.348800,0.000000,41.013500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.645400,0.000000,41.013500>}
box{<0,0,-0.076200><0.296600,0.036000,0.076200> rotate<0,0.000000,0> translate<41.348800,0.000000,41.013500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.236900,0.000000,39.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.236900,0.000000,41.606700>}
box{<0,0,-0.076200><1.779500,0.036000,0.076200> rotate<0,90.000000,0> translate<42.236900,0.000000,41.606700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.236900,0.000000,41.606700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.126600,0.000000,41.606700>}
box{<0,0,-0.076200><0.889700,0.036000,0.076200> rotate<0,0.000000,0> translate<42.236900,0.000000,41.606700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.126600,0.000000,41.606700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.423200,0.000000,41.310100>}
box{<0,0,-0.076200><0.419456,0.036000,0.076200> rotate<0,44.997030,0> translate<43.126600,0.000000,41.606700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.423200,0.000000,41.310100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.423200,0.000000,41.013500>}
box{<0,0,-0.076200><0.296600,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.423200,0.000000,41.013500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.423200,0.000000,41.013500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.126600,0.000000,40.716900>}
box{<0,0,-0.076200><0.419456,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.126600,0.000000,40.716900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.126600,0.000000,40.716900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.423200,0.000000,40.420300>}
box{<0,0,-0.076200><0.419456,0.036000,0.076200> rotate<0,44.997030,0> translate<43.126600,0.000000,40.716900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.423200,0.000000,40.420300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.423200,0.000000,40.123700>}
box{<0,0,-0.076200><0.296600,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.423200,0.000000,40.123700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.423200,0.000000,40.123700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.126600,0.000000,39.827200>}
box{<0,0,-0.076200><0.419385,0.036000,0.076200> rotate<0,-44.987370,0> translate<43.126600,0.000000,39.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.126600,0.000000,39.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.236900,0.000000,39.827200>}
box{<0,0,-0.076200><0.889700,0.036000,0.076200> rotate<0,0.000000,0> translate<42.236900,0.000000,39.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.236900,0.000000,40.716900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.126600,0.000000,40.716900>}
box{<0,0,-0.076200><0.889700,0.036000,0.076200> rotate<0,0.000000,0> translate<42.236900,0.000000,40.716900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.310800,0.000000,39.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.904000,0.000000,39.827200>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,0.000000,0> translate<44.310800,0.000000,39.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.904000,0.000000,39.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.200600,0.000000,40.123700>}
box{<0,0,-0.076200><0.419385,0.036000,0.076200> rotate<0,-44.987370,0> translate<44.904000,0.000000,39.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.200600,0.000000,40.123700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.200600,0.000000,40.716900>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,90.000000,0> translate<45.200600,0.000000,40.716900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.200600,0.000000,40.716900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.904000,0.000000,41.013500>}
box{<0,0,-0.076200><0.419456,0.036000,0.076200> rotate<0,44.997030,0> translate<44.904000,0.000000,41.013500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.904000,0.000000,41.013500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.310800,0.000000,41.013500>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,0.000000,0> translate<44.310800,0.000000,41.013500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.310800,0.000000,41.013500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.014300,0.000000,40.716900>}
box{<0,0,-0.076200><0.419385,0.036000,0.076200> rotate<0,-45.006690,0> translate<44.014300,0.000000,40.716900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.014300,0.000000,40.716900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.014300,0.000000,40.123700>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.014300,0.000000,40.123700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.014300,0.000000,40.123700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.310800,0.000000,39.827200>}
box{<0,0,-0.076200><0.419314,0.036000,0.076200> rotate<0,44.997030,0> translate<44.014300,0.000000,40.123700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.088200,0.000000,41.013500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.681400,0.000000,41.013500>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,0.000000,0> translate<46.088200,0.000000,41.013500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.681400,0.000000,41.013500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.978000,0.000000,40.716900>}
box{<0,0,-0.076200><0.419456,0.036000,0.076200> rotate<0,44.997030,0> translate<46.681400,0.000000,41.013500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.978000,0.000000,40.716900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.978000,0.000000,39.827200>}
box{<0,0,-0.076200><0.889700,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.978000,0.000000,39.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.978000,0.000000,39.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.088200,0.000000,39.827200>}
box{<0,0,-0.076200><0.889800,0.036000,0.076200> rotate<0,0.000000,0> translate<46.088200,0.000000,39.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.088200,0.000000,39.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.791700,0.000000,40.123700>}
box{<0,0,-0.076200><0.419314,0.036000,0.076200> rotate<0,44.997030,0> translate<45.791700,0.000000,40.123700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.791700,0.000000,40.123700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.088200,0.000000,40.420300>}
box{<0,0,-0.076200><0.419385,0.036000,0.076200> rotate<0,-45.006690,0> translate<45.791700,0.000000,40.123700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.088200,0.000000,40.420300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.978000,0.000000,40.420300>}
box{<0,0,-0.076200><0.889800,0.036000,0.076200> rotate<0,0.000000,0> translate<46.088200,0.000000,40.420300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.569100,0.000000,39.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.569100,0.000000,41.013500>}
box{<0,0,-0.076200><1.186300,0.036000,0.076200> rotate<0,90.000000,0> translate<47.569100,0.000000,41.013500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.569100,0.000000,40.420300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.162200,0.000000,41.013500>}
box{<0,0,-0.076200><0.838841,0.036000,0.076200> rotate<0,-45.001860,0> translate<47.569100,0.000000,40.420300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.162200,0.000000,41.013500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.458800,0.000000,41.013500>}
box{<0,0,-0.076200><0.296600,0.036000,0.076200> rotate<0,0.000000,0> translate<48.162200,0.000000,41.013500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.236600,0.000000,41.606700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.236600,0.000000,39.827200>}
box{<0,0,-0.076200><1.779500,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.236600,0.000000,39.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.236600,0.000000,39.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.346800,0.000000,39.827200>}
box{<0,0,-0.076200><0.889800,0.036000,0.076200> rotate<0,0.000000,0> translate<49.346800,0.000000,39.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.346800,0.000000,39.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.050300,0.000000,40.123700>}
box{<0,0,-0.076200><0.419314,0.036000,0.076200> rotate<0,44.997030,0> translate<49.050300,0.000000,40.123700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.050300,0.000000,40.123700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.050300,0.000000,40.716900>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,90.000000,0> translate<49.050300,0.000000,40.716900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.050300,0.000000,40.716900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.346800,0.000000,41.013500>}
box{<0,0,-0.076200><0.419385,0.036000,0.076200> rotate<0,-45.006690,0> translate<49.050300,0.000000,40.716900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.346800,0.000000,41.013500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.236600,0.000000,41.013500>}
box{<0,0,-0.076200><0.889800,0.036000,0.076200> rotate<0,0.000000,0> translate<49.346800,0.000000,41.013500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.461200,0.000000,38.092500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.054300,0.000000,36.906200>}
box{<0,0,-0.076200><1.326301,0.036000,0.076200> rotate<0,63.432694,0> translate<32.461200,0.000000,38.092500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.054300,0.000000,36.906200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.647500,0.000000,38.092500>}
box{<0,0,-0.076200><1.326346,0.036000,0.076200> rotate<0,-63.428831,0> translate<33.054300,0.000000,36.906200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.424900,0.000000,36.906200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.238600,0.000000,36.906200>}
box{<0,0,-0.076200><1.186300,0.036000,0.076200> rotate<0,0.000000,0> translate<34.238600,0.000000,36.906200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.238600,0.000000,36.906200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.424900,0.000000,38.092500>}
box{<0,0,-0.076200><1.677682,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.238600,0.000000,36.906200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.424900,0.000000,38.092500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.424900,0.000000,38.389100>}
box{<0,0,-0.076200><0.296600,0.036000,0.076200> rotate<0,90.000000,0> translate<35.424900,0.000000,38.389100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.424900,0.000000,38.389100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.128300,0.000000,38.685700>}
box{<0,0,-0.076200><0.419456,0.036000,0.076200> rotate<0,44.997030,0> translate<35.128300,0.000000,38.685700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.128300,0.000000,38.685700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.535100,0.000000,38.685700>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,0.000000,0> translate<34.535100,0.000000,38.685700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.535100,0.000000,38.685700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.238600,0.000000,38.389100>}
box{<0,0,-0.076200><0.419385,0.036000,0.076200> rotate<0,-45.006690,0> translate<34.238600,0.000000,38.389100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.016000,0.000000,36.906200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.016000,0.000000,37.202700>}
box{<0,0,-0.076200><0.296500,0.036000,0.076200> rotate<0,90.000000,0> translate<36.016000,0.000000,37.202700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.016000,0.000000,37.202700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.312500,0.000000,37.202700>}
box{<0,0,-0.076200><0.296500,0.036000,0.076200> rotate<0,0.000000,0> translate<36.016000,0.000000,37.202700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.312500,0.000000,37.202700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.312500,0.000000,36.906200>}
box{<0,0,-0.076200><0.296500,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.312500,0.000000,36.906200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.312500,0.000000,36.906200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.016000,0.000000,36.906200>}
box{<0,0,-0.076200><0.296500,0.036000,0.076200> rotate<0,0.000000,0> translate<36.016000,0.000000,36.906200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.091000,0.000000,38.685700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.904700,0.000000,38.685700>}
box{<0,0,-0.076200><1.186300,0.036000,0.076200> rotate<0,0.000000,0> translate<36.904700,0.000000,38.685700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.904700,0.000000,38.685700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.904700,0.000000,37.795900>}
box{<0,0,-0.076200><0.889800,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.904700,0.000000,37.795900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.904700,0.000000,37.795900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.497800,0.000000,38.092500>}
box{<0,0,-0.076200><0.663128,0.036000,0.076200> rotate<0,-26.567162,0> translate<36.904700,0.000000,37.795900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.497800,0.000000,38.092500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.794400,0.000000,38.092500>}
box{<0,0,-0.076200><0.296600,0.036000,0.076200> rotate<0,0.000000,0> translate<37.497800,0.000000,38.092500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.794400,0.000000,38.092500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.091000,0.000000,37.795900>}
box{<0,0,-0.076200><0.419456,0.036000,0.076200> rotate<0,44.997030,0> translate<37.794400,0.000000,38.092500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.091000,0.000000,37.795900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.091000,0.000000,37.202700>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.091000,0.000000,37.202700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.091000,0.000000,37.202700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.794400,0.000000,36.906200>}
box{<0,0,-0.076200><0.419385,0.036000,0.076200> rotate<0,-44.987370,0> translate<37.794400,0.000000,36.906200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.794400,0.000000,36.906200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.201200,0.000000,36.906200>}
box{<0,0,-0.076200><0.593200,0.036000,0.076200> rotate<0,0.000000,0> translate<37.201200,0.000000,36.906200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.201200,0.000000,36.906200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.904700,0.000000,37.202700>}
box{<0,0,-0.076200><0.419314,0.036000,0.076200> rotate<0,44.997030,0> translate<36.904700,0.000000,37.202700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.813500,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.330400,0.000000,22.796500>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<31.813500,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.071900,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.071900,0.000000,24.347200>}
box{<0,0,-0.063500><1.550700,0.036000,0.063500> rotate<0,90.000000,0> translate<32.071900,0.000000,24.347200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.813500,0.000000,24.347200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.330400,0.000000,24.347200>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<31.813500,0.000000,24.347200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.842500,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.842500,0.000000,23.830300>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,90.000000,0> translate<32.842500,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.842500,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.617800,0.000000,23.830300>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,0.000000,0> translate<32.842500,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.617800,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.876300,0.000000,23.571800>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<33.617800,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.876300,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.876300,0.000000,22.796500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,-90.000000,0> translate<33.876300,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.386100,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.161400,0.000000,22.796500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,0.000000,0> translate<34.386100,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.161400,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.419900,0.000000,23.054900>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-44.985946,0> translate<35.161400,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.419900,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.161400,0.000000,23.313400>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<35.161400,0.000000,23.313400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.161400,0.000000,23.313400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.644500,0.000000,23.313400>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<34.644500,0.000000,23.313400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.644500,0.000000,23.313400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.386100,0.000000,23.571800>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<34.386100,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.386100,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.644500,0.000000,23.830300>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<34.386100,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.644500,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.419900,0.000000,23.830300>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,0.000000,0> translate<34.644500,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.188100,0.000000,24.088700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.188100,0.000000,23.054900>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,-90.000000,0> translate<36.188100,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.188100,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.446600,0.000000,22.796500>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,44.985946,0> translate<36.188100,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.929700,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.446600,0.000000,23.830300>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<35.929700,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.958700,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.958700,0.000000,23.830300>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,90.000000,0> translate<36.958700,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.958700,0.000000,23.313400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.475600,0.000000,23.830300>}
box{<0,0,-0.063500><0.731007,0.036000,0.063500> rotate<0,-44.997030,0> translate<36.958700,0.000000,23.313400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.475600,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.734000,0.000000,23.830300>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<37.475600,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.245000,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.245000,0.000000,23.054900>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,-90.000000,0> translate<38.245000,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.245000,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.503400,0.000000,22.796500>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<38.245000,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.503400,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.278800,0.000000,22.796500>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,0.000000,0> translate<38.503400,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.278800,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.278800,0.000000,23.830300>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,90.000000,0> translate<39.278800,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.822400,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.047000,0.000000,23.830300>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,0.000000,0> translate<40.047000,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.047000,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.788600,0.000000,23.571800>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<39.788600,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.788600,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.788600,0.000000,23.054900>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,-90.000000,0> translate<39.788600,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.788600,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.047000,0.000000,22.796500>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<39.788600,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.047000,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.822400,0.000000,22.796500>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,0.000000,0> translate<40.047000,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.590600,0.000000,24.088700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.590600,0.000000,23.054900>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,-90.000000,0> translate<41.590600,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.590600,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.849100,0.000000,22.796500>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,44.985946,0> translate<41.590600,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.332200,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.849100,0.000000,23.830300>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<41.332200,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.361200,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.619600,0.000000,23.830300>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<42.361200,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.619600,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.619600,0.000000,22.796500>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,-90.000000,0> translate<42.619600,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.361200,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.878100,0.000000,22.796500>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<42.361200,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.619600,0.000000,24.605600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.619600,0.000000,24.347200>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,-90.000000,0> translate<42.619600,0.000000,24.347200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.648600,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.165500,0.000000,22.796500>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<43.648600,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.165500,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.424000,0.000000,23.054900>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-44.985946,0> translate<44.165500,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.424000,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.424000,0.000000,23.571800>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,90.000000,0> translate<44.424000,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.424000,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.165500,0.000000,23.830300>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<44.165500,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.165500,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.648600,0.000000,23.830300>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<43.648600,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.648600,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.390200,0.000000,23.571800>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<43.390200,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.390200,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.390200,0.000000,23.054900>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,-90.000000,0> translate<43.390200,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.390200,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.648600,0.000000,22.796500>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<43.390200,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.933800,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.933800,0.000000,23.830300>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,90.000000,0> translate<44.933800,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.933800,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.709100,0.000000,23.830300>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,0.000000,0> translate<44.933800,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.709100,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.967600,0.000000,23.571800>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<45.709100,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.967600,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.967600,0.000000,22.796500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,-90.000000,0> translate<45.967600,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.477400,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.252700,0.000000,22.796500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,0.000000,0> translate<46.477400,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.252700,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.511200,0.000000,23.054900>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-44.985946,0> translate<47.252700,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.511200,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.252700,0.000000,23.313400>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<47.252700,0.000000,23.313400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.252700,0.000000,23.313400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.735800,0.000000,23.313400>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<46.735800,0.000000,23.313400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.735800,0.000000,23.313400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.477400,0.000000,23.571800>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<46.477400,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.477400,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.735800,0.000000,23.830300>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<46.477400,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.735800,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.511200,0.000000,23.830300>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,0.000000,0> translate<46.735800,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.021000,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.279400,0.000000,23.830300>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<48.021000,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.279400,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.279400,0.000000,23.571800>}
box{<0,0,-0.063500><0.258500,0.036000,0.063500> rotate<0,-90.000000,0> translate<48.279400,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.279400,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.021000,0.000000,23.571800>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<48.021000,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.021000,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.021000,0.000000,23.830300>}
box{<0,0,-0.063500><0.258500,0.036000,0.063500> rotate<0,90.000000,0> translate<48.021000,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.021000,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.279400,0.000000,23.054900>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<48.021000,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.279400,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.279400,0.000000,22.796500>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,-90.000000,0> translate<48.279400,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.279400,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.021000,0.000000,22.796500>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<48.021000,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.021000,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.021000,0.000000,23.054900>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,90.000000,0> translate<48.021000,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.336400,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.336400,0.000000,23.054900>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,-90.000000,0> translate<50.336400,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.336400,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.594800,0.000000,22.796500>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<50.336400,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.594800,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.853300,0.000000,23.054900>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-44.985946,0> translate<50.594800,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.853300,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.111700,0.000000,22.796500>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<50.853300,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.111700,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.370200,0.000000,23.054900>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-44.985946,0> translate<51.111700,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.370200,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.370200,0.000000,23.830300>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,90.000000,0> translate<51.370200,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.880000,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.138400,0.000000,23.830300>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<51.880000,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.138400,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.138400,0.000000,22.796500>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,-90.000000,0> translate<52.138400,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.880000,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.396900,0.000000,22.796500>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<51.880000,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.138400,0.000000,24.605600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.138400,0.000000,24.347200>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,-90.000000,0> translate<52.138400,0.000000,24.347200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.909000,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.909000,0.000000,24.347200>}
box{<0,0,-0.063500><1.550700,0.036000,0.063500> rotate<0,90.000000,0> translate<52.909000,0.000000,24.347200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.684300,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.909000,0.000000,23.313400>}
box{<0,0,-0.063500><0.931813,0.036000,0.063500> rotate<0,33.689549,0> translate<52.909000,0.000000,23.313400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.909000,0.000000,23.313400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.684300,0.000000,23.830300>}
box{<0,0,-0.063500><0.931813,0.036000,0.063500> rotate<0,-33.689549,0> translate<52.909000,0.000000,23.313400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.195300,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.453700,0.000000,23.830300>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<54.195300,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.453700,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.453700,0.000000,22.796500>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,-90.000000,0> translate<54.453700,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.195300,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.712200,0.000000,22.796500>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<54.195300,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.453700,0.000000,24.605600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.453700,0.000000,24.347200>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,-90.000000,0> translate<54.453700,0.000000,24.347200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.224300,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.224300,0.000000,23.054900>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,90.000000,0> translate<55.224300,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.224300,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.482700,0.000000,23.054900>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<55.224300,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.482700,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.482700,0.000000,22.796500>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,-90.000000,0> translate<55.482700,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.482700,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.224300,0.000000,22.796500>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<55.224300,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.996100,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.996100,0.000000,23.830300>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,90.000000,0> translate<55.996100,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.996100,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.254500,0.000000,23.830300>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<55.996100,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.254500,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.513000,0.000000,23.571800>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<56.254500,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.513000,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.513000,0.000000,22.796500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,-90.000000,0> translate<56.513000,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.513000,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.771400,0.000000,23.830300>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<56.513000,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.771400,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.029900,0.000000,23.571800>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<56.771400,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.029900,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.029900,0.000000,22.796500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,-90.000000,0> translate<57.029900,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.798100,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.315000,0.000000,23.830300>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<57.798100,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.315000,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.573500,0.000000,23.571800>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<58.315000,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.573500,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.573500,0.000000,22.796500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,-90.000000,0> translate<58.573500,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.573500,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.798100,0.000000,22.796500>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,0.000000,0> translate<57.798100,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.798100,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.539700,0.000000,23.054900>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<57.539700,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.539700,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.798100,0.000000,23.313400>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<57.539700,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.798100,0.000000,23.313400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.573500,0.000000,23.313400>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,0.000000,0> translate<57.798100,0.000000,23.313400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.083300,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.083300,0.000000,24.347200>}
box{<0,0,-0.063500><1.550700,0.036000,0.063500> rotate<0,90.000000,0> translate<59.083300,0.000000,24.347200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.858600,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.083300,0.000000,23.313400>}
box{<0,0,-0.063500><0.931813,0.036000,0.063500> rotate<0,33.689549,0> translate<59.083300,0.000000,23.313400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.083300,0.000000,23.313400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.858600,0.000000,23.830300>}
box{<0,0,-0.063500><0.931813,0.036000,0.063500> rotate<0,-33.689549,0> translate<59.083300,0.000000,23.313400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.144900,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.628000,0.000000,22.796500>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<60.628000,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.628000,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.369600,0.000000,23.054900>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<60.369600,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.369600,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.369600,0.000000,23.571800>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,90.000000,0> translate<60.369600,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.369600,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.628000,0.000000,23.830300>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<60.369600,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.628000,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.144900,0.000000,23.830300>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<60.628000,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.144900,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.403400,0.000000,23.571800>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<61.144900,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.403400,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.403400,0.000000,23.313400>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,-90.000000,0> translate<61.403400,0.000000,23.313400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.403400,0.000000,23.313400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.369600,0.000000,23.313400>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,0.000000,0> translate<60.369600,0.000000,23.313400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.913200,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.913200,0.000000,23.830300>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,90.000000,0> translate<61.913200,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.913200,0.000000,23.313400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.430100,0.000000,23.830300>}
box{<0,0,-0.063500><0.731007,0.036000,0.063500> rotate<0,-44.997030,0> translate<61.913200,0.000000,23.313400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.430100,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.688500,0.000000,23.830300>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<62.430100,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.199500,0.000000,24.347200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.199500,0.000000,22.796500>}
box{<0,0,-0.063500><1.550700,0.036000,0.063500> rotate<0,-90.000000,0> translate<63.199500,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.199500,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.974800,0.000000,22.796500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,0.000000,0> translate<63.199500,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.974800,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.233300,0.000000,23.054900>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-44.985946,0> translate<63.974800,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.233300,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.233300,0.000000,23.571800>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,90.000000,0> translate<64.233300,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.233300,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.974800,0.000000,23.830300>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<63.974800,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.974800,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.199500,0.000000,23.830300>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,0.000000,0> translate<63.199500,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.001500,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.518400,0.000000,22.796500>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<65.001500,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.518400,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.776900,0.000000,23.054900>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-44.985946,0> translate<65.518400,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.776900,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.776900,0.000000,23.571800>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,90.000000,0> translate<65.776900,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.776900,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.518400,0.000000,23.830300>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<65.518400,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.518400,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.001500,0.000000,23.830300>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<65.001500,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.001500,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.743100,0.000000,23.571800>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<64.743100,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.743100,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.743100,0.000000,23.054900>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,-90.000000,0> translate<64.743100,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.743100,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.001500,0.000000,22.796500>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<64.743100,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.545100,0.000000,24.088700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.545100,0.000000,23.054900>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,-90.000000,0> translate<66.545100,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.545100,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.803600,0.000000,22.796500>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,44.985946,0> translate<66.545100,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.286700,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.803600,0.000000,23.830300>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<66.286700,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.315700,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.315700,0.000000,23.054900>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,90.000000,0> translate<67.315700,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.315700,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.574100,0.000000,23.054900>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<67.315700,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.574100,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.574100,0.000000,22.796500>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,-90.000000,0> translate<67.574100,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.574100,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.315700,0.000000,22.796500>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<67.315700,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.121300,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.345900,0.000000,23.830300>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,0.000000,0> translate<68.345900,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.345900,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.087500,0.000000,23.571800>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<68.087500,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.087500,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.087500,0.000000,23.054900>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,-90.000000,0> translate<68.087500,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.087500,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.345900,0.000000,22.796500>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<68.087500,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.345900,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.121300,0.000000,22.796500>}
box{<0,0,-0.063500><0.775400,0.036000,0.063500> rotate<0,0.000000,0> translate<68.345900,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.889500,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.406400,0.000000,22.796500>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<69.889500,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.406400,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.664900,0.000000,23.054900>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-44.985946,0> translate<70.406400,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.664900,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.664900,0.000000,23.571800>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,90.000000,0> translate<70.664900,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.664900,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.406400,0.000000,23.830300>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<70.406400,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.406400,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.889500,0.000000,23.830300>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<69.889500,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.889500,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.631100,0.000000,23.571800>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<69.631100,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.631100,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.631100,0.000000,23.054900>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,-90.000000,0> translate<69.631100,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.631100,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.889500,0.000000,22.796500>}
box{<0,0,-0.063500><0.365433,0.036000,0.063500> rotate<0,44.997030,0> translate<69.631100,0.000000,23.054900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.174700,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.174700,0.000000,23.830300>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,90.000000,0> translate<71.174700,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.174700,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.433100,0.000000,23.830300>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<71.174700,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.433100,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.691600,0.000000,23.571800>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<71.433100,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.691600,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.691600,0.000000,22.796500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,-90.000000,0> translate<71.691600,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.691600,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.950000,0.000000,23.830300>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<71.691600,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.950000,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.208500,0.000000,23.571800>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<71.950000,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.208500,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.208500,0.000000,22.796500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,-90.000000,0> translate<72.208500,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.718300,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.752100,0.000000,24.347200>}
box{<0,0,-0.063500><1.863709,0.036000,0.063500> rotate<0,-56.306216,0> translate<72.718300,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.261900,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.261900,0.000000,23.830300>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,90.000000,0> translate<74.261900,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.261900,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.520300,0.000000,23.830300>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,0.000000,0> translate<74.261900,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.520300,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.778800,0.000000,23.571800>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<74.520300,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.778800,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.778800,0.000000,22.796500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,-90.000000,0> translate<74.778800,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.778800,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.037200,0.000000,23.830300>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<74.778800,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.037200,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.295700,0.000000,23.571800>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<75.037200,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.295700,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.295700,0.000000,22.796500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,-90.000000,0> translate<75.295700,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.805500,0.000000,24.347200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.805500,0.000000,22.796500>}
box{<0,0,-0.063500><1.550700,0.036000,0.063500> rotate<0,-90.000000,0> translate<75.805500,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.805500,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.580800,0.000000,22.796500>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,0.000000,0> translate<75.805500,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.580800,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.839300,0.000000,23.054900>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-44.985946,0> translate<76.580800,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.839300,0.000000,23.054900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.839300,0.000000,23.571800>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,90.000000,0> translate<76.839300,0.000000,23.571800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.839300,0.000000,23.571800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.580800,0.000000,23.830300>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<76.580800,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.580800,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.805500,0.000000,23.830300>}
box{<0,0,-0.063500><0.775300,0.036000,0.063500> rotate<0,0.000000,0> translate<75.805500,0.000000,23.830300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.382900,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.349100,0.000000,22.796500>}
box{<0,0,-0.063500><1.033800,0.036000,0.063500> rotate<0,0.000000,0> translate<77.349100,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.349100,0.000000,22.796500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.382900,0.000000,23.830300>}
box{<0,0,-0.063500><1.462014,0.036000,0.063500> rotate<0,-44.997030,0> translate<77.349100,0.000000,22.796500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.382900,0.000000,23.830300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.382900,0.000000,24.088700>}
box{<0,0,-0.063500><0.258400,0.036000,0.063500> rotate<0,90.000000,0> translate<78.382900,0.000000,24.088700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.382900,0.000000,24.088700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.124400,0.000000,24.347200>}
box{<0,0,-0.063500><0.365574,0.036000,0.063500> rotate<0,44.997030,0> translate<78.124400,0.000000,24.347200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.124400,0.000000,24.347200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.607500,0.000000,24.347200>}
box{<0,0,-0.063500><0.516900,0.036000,0.063500> rotate<0,0.000000,0> translate<77.607500,0.000000,24.347200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.607500,0.000000,24.347200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.349100,0.000000,24.088700>}
box{<0,0,-0.063500><0.365504,0.036000,0.063500> rotate<0,-45.008114,0> translate<77.349100,0.000000,24.088700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.414900,0.000000,12.222100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.885200,0.000000,12.222100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<-4.885200,0.000000,12.222100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.885200,0.000000,12.222100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.041900,0.000000,12.065400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<-5.041900,0.000000,12.065400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.041900,0.000000,12.065400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.041900,0.000000,11.751800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<-5.041900,0.000000,11.751800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.041900,0.000000,11.751800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.885200,0.000000,11.595100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<-5.041900,0.000000,11.751800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.885200,0.000000,11.595100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.414900,0.000000,11.595100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<-4.885200,0.000000,11.595100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.543900,0.000000,11.595100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.170900,0.000000,11.595100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<-3.170900,0.000000,11.595100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.170900,0.000000,11.595100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.543900,0.000000,12.222100>}
box{<0,0,-0.038100><0.886712,0.036000,0.038100> rotate<0,-44.997030,0> translate<-3.170900,0.000000,11.595100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.543900,0.000000,12.222100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.543900,0.000000,12.378900>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,90.000000,0> translate<-2.543900,0.000000,12.378900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.543900,0.000000,12.378900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.700600,0.000000,12.535700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<-2.700600,0.000000,12.535700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.700600,0.000000,12.535700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.014200,0.000000,12.535700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<-3.014200,0.000000,12.535700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.014200,0.000000,12.535700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.170900,0.000000,12.378900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<-3.170900,0.000000,12.378900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.235400,0.000000,11.751800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.235400,0.000000,12.378900>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<-2.235400,0.000000,12.378900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.235400,0.000000,12.378900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.078700,0.000000,12.535700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<-2.235400,0.000000,12.378900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.078700,0.000000,12.535700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.765100,0.000000,12.535700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<-2.078700,0.000000,12.535700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.765100,0.000000,12.535700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.608400,0.000000,12.378900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<-1.765100,0.000000,12.535700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.608400,0.000000,12.378900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.608400,0.000000,11.751800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<-1.608400,0.000000,11.751800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.608400,0.000000,11.751800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.765100,0.000000,11.595100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<-1.765100,0.000000,11.595100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.765100,0.000000,11.595100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.078700,0.000000,11.595100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<-2.078700,0.000000,11.595100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.078700,0.000000,11.595100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.235400,0.000000,11.751800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<-2.235400,0.000000,11.751800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.235400,0.000000,11.751800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.608400,0.000000,12.378900>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,-45.001599,0> translate<-2.235400,0.000000,11.751800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.299900,0.000000,12.222100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.986400,0.000000,12.535700>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-45.006166,0> translate<-1.299900,0.000000,12.222100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.986400,0.000000,12.535700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.986400,0.000000,11.595100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<-0.986400,0.000000,11.595100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.299900,0.000000,11.595100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.672900,0.000000,11.595100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<-1.299900,0.000000,11.595100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.364400,0.000000,12.222100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.050900,0.000000,12.535700>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-45.006166,0> translate<-0.364400,0.000000,12.222100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.050900,0.000000,12.535700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.050900,0.000000,11.595100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<-0.050900,0.000000,11.595100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.364400,0.000000,11.595100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.262600,0.000000,11.595100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<-0.364400,0.000000,11.595100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.041900,0.000000,11.011700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.041900,0.000000,10.071100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<-5.041900,0.000000,10.071100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.041900,0.000000,10.071100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.414900,0.000000,10.071100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<-5.041900,0.000000,10.071100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.106400,0.000000,10.698100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.949700,0.000000,10.698100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<-4.106400,0.000000,10.698100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.949700,0.000000,10.698100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.949700,0.000000,10.071100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<-3.949700,0.000000,10.071100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.106400,0.000000,10.071100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.792900,0.000000,10.071100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<-4.106400,0.000000,10.071100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.949700,0.000000,11.168400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.949700,0.000000,11.011700>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<-3.949700,0.000000,11.011700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.855800,0.000000,10.698100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.326100,0.000000,10.698100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<-3.326100,0.000000,10.698100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.326100,0.000000,10.698100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.482800,0.000000,10.541400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<-3.482800,0.000000,10.541400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.482800,0.000000,10.541400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.482800,0.000000,10.227800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<-3.482800,0.000000,10.227800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.482800,0.000000,10.227800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.326100,0.000000,10.071100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<-3.482800,0.000000,10.227800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.326100,0.000000,10.071100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.855800,0.000000,10.071100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<-3.326100,0.000000,10.071100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.077000,0.000000,10.071100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.390600,0.000000,10.071100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<-2.390600,0.000000,10.071100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.390600,0.000000,10.071100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.547300,0.000000,10.227800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<-2.547300,0.000000,10.227800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.547300,0.000000,10.227800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.547300,0.000000,10.541400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<-2.547300,0.000000,10.541400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.547300,0.000000,10.541400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.390600,0.000000,10.698100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<-2.547300,0.000000,10.541400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.390600,0.000000,10.698100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.077000,0.000000,10.698100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<-2.390600,0.000000,10.698100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.077000,0.000000,10.698100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.920300,0.000000,10.541400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<-2.077000,0.000000,10.698100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.920300,0.000000,10.541400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.920300,0.000000,10.384600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<-1.920300,0.000000,10.384600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.920300,0.000000,10.384600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.547300,0.000000,10.384600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<-2.547300,0.000000,10.384600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.611800,0.000000,10.071100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.611800,0.000000,10.698100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<-1.611800,0.000000,10.698100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.611800,0.000000,10.698100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.141500,0.000000,10.698100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<-1.611800,0.000000,10.698100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.141500,0.000000,10.698100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.984800,0.000000,10.541400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<-1.141500,0.000000,10.698100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.984800,0.000000,10.541400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.984800,0.000000,10.071100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<-0.984800,0.000000,10.071100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.676300,0.000000,10.071100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.206000,0.000000,10.071100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<-0.676300,0.000000,10.071100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.206000,0.000000,10.071100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.049300,0.000000,10.227800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<-0.206000,0.000000,10.071100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.049300,0.000000,10.227800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.206000,0.000000,10.384600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<-0.206000,0.000000,10.384600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.206000,0.000000,10.384600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.519600,0.000000,10.384600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<-0.519600,0.000000,10.384600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.519600,0.000000,10.384600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.676300,0.000000,10.541400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<-0.676300,0.000000,10.541400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.676300,0.000000,10.541400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.519600,0.000000,10.698100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<-0.676300,0.000000,10.541400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.519600,0.000000,10.698100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.049300,0.000000,10.698100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<-0.519600,0.000000,10.698100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.729500,0.000000,10.071100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.415900,0.000000,10.071100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<0.415900,0.000000,10.071100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.415900,0.000000,10.071100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.259200,0.000000,10.227800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<0.259200,0.000000,10.227800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.259200,0.000000,10.227800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.259200,0.000000,10.541400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<0.259200,0.000000,10.541400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.259200,0.000000,10.541400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.415900,0.000000,10.698100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<0.259200,0.000000,10.541400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.415900,0.000000,10.698100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.729500,0.000000,10.698100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<0.415900,0.000000,10.698100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.729500,0.000000,10.698100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.886200,0.000000,10.541400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<0.729500,0.000000,10.698100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.886200,0.000000,10.541400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.886200,0.000000,10.384600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<0.886200,0.000000,10.384600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.886200,0.000000,10.384600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.259200,0.000000,10.384600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<0.259200,0.000000,10.384600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.194700,0.000000,10.698100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.351400,0.000000,10.698100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<1.194700,0.000000,10.698100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.351400,0.000000,10.698100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.351400,0.000000,10.541400>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<1.351400,0.000000,10.541400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.351400,0.000000,10.541400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.194700,0.000000,10.541400>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<1.194700,0.000000,10.541400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.194700,0.000000,10.541400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.194700,0.000000,10.698100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<1.194700,0.000000,10.698100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.194700,0.000000,10.227800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.351400,0.000000,10.227800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<1.194700,0.000000,10.227800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.351400,0.000000,10.227800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.351400,0.000000,10.071100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<1.351400,0.000000,10.071100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.351400,0.000000,10.071100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.194700,0.000000,10.071100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<1.194700,0.000000,10.071100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.194700,0.000000,10.071100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.194700,0.000000,10.227800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<1.194700,0.000000,10.227800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.224900,0.000000,10.854900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.068200,0.000000,11.011700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<3.068200,0.000000,11.011700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.068200,0.000000,11.011700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.754600,0.000000,11.011700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<2.754600,0.000000,11.011700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.754600,0.000000,11.011700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.597900,0.000000,10.854900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<2.597900,0.000000,10.854900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.597900,0.000000,10.854900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.597900,0.000000,10.227800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.597900,0.000000,10.227800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.597900,0.000000,10.227800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.754600,0.000000,10.071100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<2.597900,0.000000,10.227800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.754600,0.000000,10.071100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.068200,0.000000,10.071100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<2.754600,0.000000,10.071100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.068200,0.000000,10.071100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.224900,0.000000,10.227800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<3.068200,0.000000,10.071100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.224900,0.000000,10.227800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.224900,0.000000,10.541400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<3.224900,0.000000,10.541400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.224900,0.000000,10.541400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.911400,0.000000,10.541400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<2.911400,0.000000,10.541400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.533400,0.000000,10.071100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.533400,0.000000,11.011700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<3.533400,0.000000,11.011700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.533400,0.000000,11.011700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.003700,0.000000,11.011700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<3.533400,0.000000,11.011700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.003700,0.000000,11.011700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.160400,0.000000,10.854900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<4.003700,0.000000,11.011700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.160400,0.000000,10.854900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.160400,0.000000,10.541400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.160400,0.000000,10.541400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.160400,0.000000,10.541400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.003700,0.000000,10.384600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<4.003700,0.000000,10.384600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.003700,0.000000,10.384600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.533400,0.000000,10.384600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<3.533400,0.000000,10.384600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.468900,0.000000,11.011700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.468900,0.000000,10.071100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.468900,0.000000,10.071100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.468900,0.000000,10.071100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.095900,0.000000,10.071100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<4.468900,0.000000,10.071100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.404400,0.000000,10.698100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.717900,0.000000,10.071100>}
box{<0,0,-0.038100><0.701007,0.036000,0.038100> rotate<0,63.430762,0> translate<5.404400,0.000000,10.698100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.717900,0.000000,10.071100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.031400,0.000000,10.698100>}
box{<0,0,-0.038100><0.701007,0.036000,0.038100> rotate<0,-63.430762,0> translate<5.717900,0.000000,10.071100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.339900,0.000000,10.854900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.496600,0.000000,11.011700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<6.339900,0.000000,10.854900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.496600,0.000000,11.011700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.810200,0.000000,11.011700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.496600,0.000000,11.011700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.810200,0.000000,11.011700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.966900,0.000000,10.854900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<6.810200,0.000000,11.011700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.966900,0.000000,10.854900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.966900,0.000000,10.698100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.966900,0.000000,10.698100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.966900,0.000000,10.698100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.810200,0.000000,10.541400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.810200,0.000000,10.541400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.810200,0.000000,10.541400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.653400,0.000000,10.541400>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<6.653400,0.000000,10.541400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.810200,0.000000,10.541400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.966900,0.000000,10.384600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<6.810200,0.000000,10.541400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.966900,0.000000,10.384600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.966900,0.000000,10.227800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.966900,0.000000,10.227800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.966900,0.000000,10.227800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.810200,0.000000,10.071100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.810200,0.000000,10.071100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.810200,0.000000,10.071100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.496600,0.000000,10.071100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.496600,0.000000,10.071100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.496600,0.000000,10.071100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.339900,0.000000,10.227800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<6.339900,0.000000,10.227800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.041900,0.000000,16.345700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.041900,0.000000,15.405100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<-5.041900,0.000000,15.405100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.041900,0.000000,15.405100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.571600,0.000000,15.405100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<-5.041900,0.000000,15.405100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.571600,0.000000,15.405100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.414900,0.000000,15.561800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<-4.571600,0.000000,15.405100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.414900,0.000000,15.561800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.414900,0.000000,16.188900>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<-4.414900,0.000000,16.188900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.414900,0.000000,16.188900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.571600,0.000000,16.345700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<-4.571600,0.000000,16.345700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.571600,0.000000,16.345700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.041900,0.000000,16.345700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<-5.041900,0.000000,16.345700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.636100,0.000000,15.405100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.949700,0.000000,15.405100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<-3.949700,0.000000,15.405100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.949700,0.000000,15.405100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.106400,0.000000,15.561800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<-4.106400,0.000000,15.561800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.106400,0.000000,15.561800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.106400,0.000000,15.875400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<-4.106400,0.000000,15.875400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.106400,0.000000,15.875400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.949700,0.000000,16.032100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<-4.106400,0.000000,15.875400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.949700,0.000000,16.032100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.636100,0.000000,16.032100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<-3.949700,0.000000,16.032100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.636100,0.000000,16.032100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.479400,0.000000,15.875400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<-3.636100,0.000000,16.032100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.479400,0.000000,15.875400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.479400,0.000000,15.718600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<-3.479400,0.000000,15.718600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.479400,0.000000,15.718600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.106400,0.000000,15.718600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<-4.106400,0.000000,15.718600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.170900,0.000000,15.405100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.700600,0.000000,15.405100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<-3.170900,0.000000,15.405100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.700600,0.000000,15.405100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.543900,0.000000,15.561800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<-2.700600,0.000000,15.405100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.543900,0.000000,15.561800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.700600,0.000000,15.718600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<-2.700600,0.000000,15.718600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.700600,0.000000,15.718600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.014200,0.000000,15.718600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<-3.014200,0.000000,15.718600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.014200,0.000000,15.718600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.170900,0.000000,15.875400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<-3.170900,0.000000,15.875400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.170900,0.000000,15.875400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.014200,0.000000,16.032100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<-3.170900,0.000000,15.875400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.014200,0.000000,16.032100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.543900,0.000000,16.032100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<-3.014200,0.000000,16.032100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.235400,0.000000,16.032100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.078700,0.000000,16.032100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<-2.235400,0.000000,16.032100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.078700,0.000000,16.032100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.078700,0.000000,15.405100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<-2.078700,0.000000,15.405100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.235400,0.000000,15.405100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.921900,0.000000,15.405100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<-2.235400,0.000000,15.405100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.078700,0.000000,16.502400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.078700,0.000000,16.345700>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<-2.078700,0.000000,16.345700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.298300,0.000000,15.091600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.141500,0.000000,15.091600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<-1.298300,0.000000,15.091600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.141500,0.000000,15.091600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.984800,0.000000,15.248400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<-1.141500,0.000000,15.091600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.984800,0.000000,15.248400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.984800,0.000000,16.032100>}
box{<0,0,-0.038100><0.783700,0.036000,0.038100> rotate<0,90.000000,0> translate<-0.984800,0.000000,16.032100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.984800,0.000000,16.032100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.455100,0.000000,16.032100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<-1.455100,0.000000,16.032100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.455100,0.000000,16.032100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.611800,0.000000,15.875400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<-1.611800,0.000000,15.875400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.611800,0.000000,15.875400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.611800,0.000000,15.561800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<-1.611800,0.000000,15.561800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.611800,0.000000,15.561800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.455100,0.000000,15.405100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<-1.611800,0.000000,15.561800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.455100,0.000000,15.405100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.984800,0.000000,15.405100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<-1.455100,0.000000,15.405100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.676300,0.000000,15.405100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.676300,0.000000,16.032100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<-0.676300,0.000000,16.032100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.676300,0.000000,16.032100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.206000,0.000000,16.032100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<-0.676300,0.000000,16.032100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.206000,0.000000,16.032100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.049300,0.000000,15.875400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<-0.206000,0.000000,16.032100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.049300,0.000000,15.875400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.049300,0.000000,15.405100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<-0.049300,0.000000,15.405100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.194700,0.000000,15.405100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.194700,0.000000,16.345700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<1.194700,0.000000,16.345700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.194700,0.000000,16.345700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.665000,0.000000,16.345700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<1.194700,0.000000,16.345700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.665000,0.000000,16.345700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.821700,0.000000,16.188900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<1.665000,0.000000,16.345700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.821700,0.000000,16.188900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.821700,0.000000,16.032100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<1.821700,0.000000,16.032100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.821700,0.000000,16.032100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.665000,0.000000,15.875400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<1.665000,0.000000,15.875400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.665000,0.000000,15.875400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.821700,0.000000,15.718600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<1.665000,0.000000,15.875400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.821700,0.000000,15.718600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.821700,0.000000,15.561800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<1.821700,0.000000,15.561800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.821700,0.000000,15.561800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.665000,0.000000,15.405100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<1.665000,0.000000,15.405100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.665000,0.000000,15.405100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.194700,0.000000,15.405100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<1.194700,0.000000,15.405100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.194700,0.000000,15.875400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.665000,0.000000,15.875400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<1.194700,0.000000,15.875400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.130200,0.000000,16.032100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.130200,0.000000,15.561800>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.130200,0.000000,15.561800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.130200,0.000000,15.561800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.286900,0.000000,15.405100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<2.130200,0.000000,15.561800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.286900,0.000000,15.405100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.757200,0.000000,15.405100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<2.286900,0.000000,15.405100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.757200,0.000000,16.032100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.757200,0.000000,15.248400>}
box{<0,0,-0.038100><0.783700,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.757200,0.000000,15.248400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.757200,0.000000,15.248400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.600500,0.000000,15.091600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<2.600500,0.000000,15.091600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.600500,0.000000,15.091600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.443700,0.000000,15.091600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<2.443700,0.000000,15.091600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.065700,0.000000,16.032100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.222400,0.000000,16.032100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<3.065700,0.000000,16.032100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.222400,0.000000,16.032100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.222400,0.000000,15.875400>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<3.222400,0.000000,15.875400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.222400,0.000000,15.875400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.065700,0.000000,15.875400>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<3.065700,0.000000,15.875400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.065700,0.000000,15.875400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.065700,0.000000,16.032100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<3.065700,0.000000,16.032100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.065700,0.000000,15.561800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.222400,0.000000,15.561800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<3.065700,0.000000,15.561800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.222400,0.000000,15.561800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.222400,0.000000,15.405100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<3.222400,0.000000,15.405100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.222400,0.000000,15.405100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.065700,0.000000,15.405100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<3.065700,0.000000,15.405100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.065700,0.000000,15.405100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.065700,0.000000,15.561800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<3.065700,0.000000,15.561800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.041900,0.000000,13.881100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.041900,0.000000,14.821700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<-5.041900,0.000000,14.821700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-5.041900,0.000000,14.821700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.728400,0.000000,14.508100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,45.006166,0> translate<-5.041900,0.000000,14.821700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.728400,0.000000,14.508100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.414900,0.000000,14.821700>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-45.006166,0> translate<-4.728400,0.000000,14.508100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.414900,0.000000,14.821700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.414900,0.000000,13.881100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<-4.414900,0.000000,13.881100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.949700,0.000000,14.508100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.636100,0.000000,14.508100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<-3.949700,0.000000,14.508100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.636100,0.000000,14.508100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.479400,0.000000,14.351400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<-3.636100,0.000000,14.508100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.479400,0.000000,14.351400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.479400,0.000000,13.881100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<-3.479400,0.000000,13.881100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.479400,0.000000,13.881100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.949700,0.000000,13.881100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<-3.949700,0.000000,13.881100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.949700,0.000000,13.881100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.106400,0.000000,14.037800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<-4.106400,0.000000,14.037800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-4.106400,0.000000,14.037800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.949700,0.000000,14.194600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<-4.106400,0.000000,14.037800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.949700,0.000000,14.194600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.479400,0.000000,14.194600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<-3.949700,0.000000,14.194600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.170900,0.000000,13.881100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.170900,0.000000,14.821700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<-3.170900,0.000000,14.821700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.700600,0.000000,13.881100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.170900,0.000000,14.194600>}
box{<0,0,-0.038100><0.565212,0.036000,0.038100> rotate<0,33.685033,0> translate<-3.170900,0.000000,14.194600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-3.170900,0.000000,14.194600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.700600,0.000000,14.508100>}
box{<0,0,-0.038100><0.565212,0.036000,0.038100> rotate<0,-33.685033,0> translate<-3.170900,0.000000,14.194600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.921100,0.000000,13.881100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.234700,0.000000,13.881100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<-2.234700,0.000000,13.881100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.234700,0.000000,13.881100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.391400,0.000000,14.037800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<-2.391400,0.000000,14.037800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.391400,0.000000,14.037800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.391400,0.000000,14.351400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<-2.391400,0.000000,14.351400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.391400,0.000000,14.351400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.234700,0.000000,14.508100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<-2.391400,0.000000,14.351400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.234700,0.000000,14.508100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.921100,0.000000,14.508100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<-2.234700,0.000000,14.508100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.921100,0.000000,14.508100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.764400,0.000000,14.351400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<-1.921100,0.000000,14.508100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.764400,0.000000,14.351400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.764400,0.000000,14.194600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<-1.764400,0.000000,14.194600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.764400,0.000000,14.194600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-2.391400,0.000000,14.194600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<-2.391400,0.000000,14.194600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.455900,0.000000,13.881100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.455900,0.000000,14.508100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<-1.455900,0.000000,14.508100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.455900,0.000000,14.194600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.142400,0.000000,14.508100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<-1.455900,0.000000,14.194600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-1.142400,0.000000,14.508100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.985600,0.000000,14.508100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<-1.142400,0.000000,14.508100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.676400,0.000000,13.881100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.676400,0.000000,14.821700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<-0.676400,0.000000,14.821700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.676400,0.000000,14.821700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.206100,0.000000,14.821700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<-0.676400,0.000000,14.821700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.206100,0.000000,14.821700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.049400,0.000000,14.664900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<-0.206100,0.000000,14.821700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.049400,0.000000,14.664900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.049400,0.000000,14.508100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<-0.049400,0.000000,14.508100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.049400,0.000000,14.508100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.206100,0.000000,14.351400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<-0.206100,0.000000,14.351400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.206100,0.000000,14.351400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.049400,0.000000,14.194600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<-0.206100,0.000000,14.351400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.049400,0.000000,14.194600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.049400,0.000000,14.037800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<-0.049400,0.000000,14.037800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.049400,0.000000,14.037800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.206100,0.000000,13.881100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<-0.206100,0.000000,13.881100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.206100,0.000000,13.881100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.676400,0.000000,13.881100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<-0.676400,0.000000,13.881100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.676400,0.000000,14.351400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<-0.206100,0.000000,14.351400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<-0.676400,0.000000,14.351400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.415800,0.000000,13.881100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.729400,0.000000,13.881100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<0.415800,0.000000,13.881100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.729400,0.000000,13.881100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.886100,0.000000,14.037800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<0.729400,0.000000,13.881100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.886100,0.000000,14.037800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.886100,0.000000,14.351400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<0.886100,0.000000,14.351400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.886100,0.000000,14.351400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.729400,0.000000,14.508100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<0.729400,0.000000,14.508100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.729400,0.000000,14.508100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.415800,0.000000,14.508100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<0.415800,0.000000,14.508100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.415800,0.000000,14.508100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.259100,0.000000,14.351400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<0.259100,0.000000,14.351400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.259100,0.000000,14.351400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.259100,0.000000,14.037800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<0.259100,0.000000,14.037800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.259100,0.000000,14.037800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.415800,0.000000,13.881100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<0.259100,0.000000,14.037800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.351300,0.000000,14.664900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.351300,0.000000,14.037800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<1.351300,0.000000,14.037800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.351300,0.000000,14.037800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.508100,0.000000,13.881100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<1.351300,0.000000,14.037800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.194600,0.000000,14.508100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.508100,0.000000,14.508100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<1.194600,0.000000,14.508100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.818200,0.000000,13.881100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.818200,0.000000,14.037800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<1.818200,0.000000,14.037800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.818200,0.000000,14.037800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.974900,0.000000,14.037800>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<1.818200,0.000000,14.037800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.974900,0.000000,14.037800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.974900,0.000000,13.881100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,-90.000000,0> translate<1.974900,0.000000,13.881100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.974900,0.000000,13.881100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.818200,0.000000,13.881100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<1.818200,0.000000,13.881100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.912900,0.000000,14.508100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.442600,0.000000,14.508100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<2.442600,0.000000,14.508100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.442600,0.000000,14.508100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.285900,0.000000,14.351400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<2.285900,0.000000,14.351400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.285900,0.000000,14.351400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.285900,0.000000,14.037800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.285900,0.000000,14.037800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.285900,0.000000,14.037800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.442600,0.000000,13.881100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<2.285900,0.000000,14.037800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.442600,0.000000,13.881100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.912900,0.000000,13.881100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<2.442600,0.000000,13.881100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.378100,0.000000,13.881100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.691700,0.000000,13.881100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<3.378100,0.000000,13.881100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.691700,0.000000,13.881100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.848400,0.000000,14.037800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<3.691700,0.000000,13.881100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.848400,0.000000,14.037800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.848400,0.000000,14.351400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<3.848400,0.000000,14.351400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.848400,0.000000,14.351400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.691700,0.000000,14.508100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<3.691700,0.000000,14.508100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.691700,0.000000,14.508100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.378100,0.000000,14.508100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<3.378100,0.000000,14.508100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.378100,0.000000,14.508100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.221400,0.000000,14.351400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<3.221400,0.000000,14.351400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.221400,0.000000,14.351400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.221400,0.000000,14.037800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<3.221400,0.000000,14.037800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.221400,0.000000,14.037800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.378100,0.000000,13.881100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<3.221400,0.000000,14.037800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.156900,0.000000,13.881100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.156900,0.000000,14.508100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<4.156900,0.000000,14.508100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.156900,0.000000,14.508100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.313600,0.000000,14.508100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<4.156900,0.000000,14.508100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.313600,0.000000,14.508100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.470400,0.000000,14.351400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<4.313600,0.000000,14.508100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.470400,0.000000,14.351400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.470400,0.000000,13.881100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.470400,0.000000,13.881100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.470400,0.000000,14.351400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.627200,0.000000,14.508100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<4.470400,0.000000,14.351400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.627200,0.000000,14.508100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.783900,0.000000,14.351400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<4.627200,0.000000,14.508100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.783900,0.000000,14.351400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.783900,0.000000,13.881100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.783900,0.000000,13.881100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.341600,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.341600,0.000000,17.680300>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,90.000000,0> translate<15.341600,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.341600,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.900700,0.000000,15.341600>}
box{<0,0,-0.101600><2.810749,0.036000,0.101600> rotate<0,56.306782,0> translate<15.341600,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.900700,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.900700,0.000000,17.680300>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,90.000000,0> translate<16.900700,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.849600,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.070000,0.000000,17.680300>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<18.070000,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.070000,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.680300,0.000000,17.290500>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-45.004380,0> translate<17.680300,0.000000,17.290500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.680300,0.000000,17.290500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.680300,0.000000,15.731300>}
box{<0,0,-0.101600><1.559200,0.036000,0.101600> rotate<0,-90.000000,0> translate<17.680300,0.000000,15.731300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.680300,0.000000,15.731300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.070000,0.000000,15.341600>}
box{<0,0,-0.101600><0.551119,0.036000,0.101600> rotate<0,44.997030,0> translate<17.680300,0.000000,15.731300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.070000,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.849600,0.000000,15.341600>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<18.070000,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.849600,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.239400,0.000000,15.731300>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-44.989680,0> translate<18.849600,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.239400,0.000000,15.731300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.239400,0.000000,17.290500>}
box{<0,0,-0.101600><1.559200,0.036000,0.101600> rotate<0,90.000000,0> translate<19.239400,0.000000,17.290500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.239400,0.000000,17.290500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.849600,0.000000,17.680300>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<18.849600,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.798500,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.798500,0.000000,17.680300>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,90.000000,0> translate<20.798500,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.019000,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.578100,0.000000,17.680300>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<20.019000,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.255500,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.696400,0.000000,17.680300>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<24.696400,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.696400,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.696400,0.000000,15.341600>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,-90.000000,0> translate<24.696400,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.696400,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.255500,0.000000,15.341600>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<24.696400,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.696400,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.475900,0.000000,16.510900>}
box{<0,0,-0.101600><0.779500,0.036000,0.101600> rotate<0,0.000000,0> translate<24.696400,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.814600,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.814600,0.000000,17.680300>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,90.000000,0> translate<27.814600,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.035100,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.594200,0.000000,17.680300>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<27.035100,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.373800,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.373800,0.000000,17.680300>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,90.000000,0> translate<29.373800,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.373800,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.932900,0.000000,16.510900>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<29.373800,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.932900,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.932900,0.000000,15.341600>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,-90.000000,0> translate<30.932900,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.271600,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.712500,0.000000,17.680300>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<31.712500,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.712500,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.712500,0.000000,15.341600>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,-90.000000,0> translate<31.712500,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.712500,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.271600,0.000000,15.341600>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<31.712500,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.712500,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.492000,0.000000,16.510900>}
box{<0,0,-0.101600><0.779500,0.036000,0.101600> rotate<0,0.000000,0> translate<31.712500,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.051200,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.051200,0.000000,17.680300>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,90.000000,0> translate<34.051200,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.051200,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.220500,0.000000,17.680300>}
box{<0,0,-0.101600><1.169300,0.036000,0.101600> rotate<0,0.000000,0> translate<34.051200,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.220500,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.610300,0.000000,17.290500>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<35.220500,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.610300,0.000000,17.290500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.610300,0.000000,16.510900>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,-90.000000,0> translate<35.610300,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.610300,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.220500,0.000000,16.121100>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,-44.997030,0> translate<35.220500,0.000000,16.121100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.220500,0.000000,16.121100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.051200,0.000000,16.121100>}
box{<0,0,-0.101600><1.169300,0.036000,0.101600> rotate<0,0.000000,0> translate<34.051200,0.000000,16.121100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.830700,0.000000,16.121100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.610300,0.000000,15.341600>}
box{<0,0,-0.101600><1.102450,0.036000,0.101600> rotate<0,44.993355,0> translate<34.830700,0.000000,16.121100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.389900,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.389900,0.000000,17.680300>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,90.000000,0> translate<36.389900,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.389900,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.949000,0.000000,15.341600>}
box{<0,0,-0.101600><2.810749,0.036000,0.101600> rotate<0,56.306782,0> translate<36.389900,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.949000,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.949000,0.000000,17.680300>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,90.000000,0> translate<37.949000,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.287700,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.728600,0.000000,17.680300>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<38.728600,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.728600,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.728600,0.000000,15.341600>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,-90.000000,0> translate<38.728600,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.728600,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.287700,0.000000,15.341600>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<38.728600,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.728600,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.508100,0.000000,16.510900>}
box{<0,0,-0.101600><0.779500,0.036000,0.101600> rotate<0,0.000000,0> translate<38.728600,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.846800,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.846800,0.000000,17.680300>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,90.000000,0> translate<41.846800,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.067300,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.626400,0.000000,17.680300>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<41.067300,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.744700,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.303800,0.000000,16.510900>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<45.744700,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.201600,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.201600,0.000000,17.680300>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,90.000000,0> translate<51.201600,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.422100,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.981200,0.000000,17.680300>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<50.422100,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.760800,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.760800,0.000000,17.680300>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,90.000000,0> translate<52.760800,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.760800,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.319900,0.000000,16.510900>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<52.760800,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.319900,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.319900,0.000000,15.341600>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,-90.000000,0> translate<54.319900,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.658600,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.099500,0.000000,17.680300>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<55.099500,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.099500,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.099500,0.000000,15.341600>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,-90.000000,0> translate<55.099500,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.099500,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.658600,0.000000,15.341600>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<55.099500,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.099500,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.879000,0.000000,16.510900>}
box{<0,0,-0.101600><0.779500,0.036000,0.101600> rotate<0,0.000000,0> translate<55.099500,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.997300,0.000000,17.290500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.607500,0.000000,17.680300>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<58.607500,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.607500,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.827900,0.000000,17.680300>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<57.827900,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.827900,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.438200,0.000000,17.290500>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-45.004380,0> translate<57.438200,0.000000,17.290500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.438200,0.000000,17.290500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.438200,0.000000,16.900700>}
box{<0,0,-0.101600><0.389800,0.036000,0.101600> rotate<0,-90.000000,0> translate<57.438200,0.000000,16.900700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.438200,0.000000,16.900700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.827900,0.000000,16.510900>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,45.004380,0> translate<57.438200,0.000000,16.900700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.827900,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.607500,0.000000,16.510900>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<57.827900,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.607500,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.997300,0.000000,16.121100>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<58.607500,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.997300,0.000000,16.121100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.997300,0.000000,15.731300>}
box{<0,0,-0.101600><0.389800,0.036000,0.101600> rotate<0,-90.000000,0> translate<58.997300,0.000000,15.731300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.997300,0.000000,15.731300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.607500,0.000000,15.341600>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-44.989680,0> translate<58.607500,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.607500,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.827900,0.000000,15.341600>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<57.827900,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.827900,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.438200,0.000000,15.731300>}
box{<0,0,-0.101600><0.551119,0.036000,0.101600> rotate<0,44.997030,0> translate<57.438200,0.000000,15.731300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.336000,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.776900,0.000000,17.680300>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<59.776900,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.776900,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.776900,0.000000,15.341600>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,-90.000000,0> translate<59.776900,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.776900,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.336000,0.000000,15.341600>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<59.776900,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.776900,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.556400,0.000000,16.510900>}
box{<0,0,-0.101600><0.779500,0.036000,0.101600> rotate<0,0.000000,0> translate<59.776900,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.454300,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.454300,0.000000,16.900700>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,90.000000,0> translate<64.454300,0.000000,16.900700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.454300,0.000000,16.900700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.233800,0.000000,17.680300>}
box{<0,0,-0.101600><1.102450,0.036000,0.101600> rotate<0,-45.000705,0> translate<64.454300,0.000000,16.900700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.233800,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.013400,0.000000,16.900700>}
box{<0,0,-0.101600><1.102521,0.036000,0.101600> rotate<0,44.997030,0> translate<65.233800,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.013400,0.000000,16.900700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.013400,0.000000,15.341600>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,-90.000000,0> translate<66.013400,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.454300,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.013400,0.000000,16.510900>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<64.454300,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.793000,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.793000,0.000000,17.680300>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,90.000000,0> translate<66.793000,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.793000,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.962300,0.000000,17.680300>}
box{<0,0,-0.101600><1.169300,0.036000,0.101600> rotate<0,0.000000,0> translate<66.793000,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.962300,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.352100,0.000000,17.290500>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<67.962300,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.352100,0.000000,17.290500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.352100,0.000000,16.510900>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,-90.000000,0> translate<68.352100,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.352100,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.962300,0.000000,16.121100>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,-44.997030,0> translate<67.962300,0.000000,16.121100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.962300,0.000000,16.121100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.793000,0.000000,16.121100>}
box{<0,0,-0.101600><1.169300,0.036000,0.101600> rotate<0,0.000000,0> translate<66.793000,0.000000,16.121100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.572500,0.000000,16.121100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.352100,0.000000,15.341600>}
box{<0,0,-0.101600><1.102450,0.036000,0.101600> rotate<0,44.993355,0> translate<67.572500,0.000000,16.121100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.690800,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.131700,0.000000,17.680300>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<69.131700,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.131700,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.131700,0.000000,15.341600>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,-90.000000,0> translate<69.131700,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.131700,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.690800,0.000000,15.341600>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<69.131700,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.131700,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.911200,0.000000,16.510900>}
box{<0,0,-0.101600><0.779500,0.036000,0.101600> rotate<0,0.000000,0> translate<69.131700,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<73.809100,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<73.809100,0.000000,17.680300>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,90.000000,0> translate<73.809100,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<73.809100,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.978400,0.000000,17.680300>}
box{<0,0,-0.101600><1.169300,0.036000,0.101600> rotate<0,0.000000,0> translate<73.809100,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.978400,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.368200,0.000000,17.290500>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<74.978400,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.368200,0.000000,17.290500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.368200,0.000000,16.510900>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,-90.000000,0> translate<75.368200,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.368200,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.978400,0.000000,16.121100>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,-44.997030,0> translate<74.978400,0.000000,16.121100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.978400,0.000000,16.121100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<73.809100,0.000000,16.121100>}
box{<0,0,-0.101600><1.169300,0.036000,0.101600> rotate<0,0.000000,0> translate<73.809100,0.000000,16.121100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.588600,0.000000,16.121100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.368200,0.000000,15.341600>}
box{<0,0,-0.101600><1.102450,0.036000,0.101600> rotate<0,44.993355,0> translate<74.588600,0.000000,16.121100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.706900,0.000000,17.290500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.317100,0.000000,17.680300>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<77.317100,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.317100,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.537500,0.000000,17.680300>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<76.537500,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.537500,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.147800,0.000000,17.290500>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-45.004380,0> translate<76.147800,0.000000,17.290500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.147800,0.000000,17.290500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.147800,0.000000,16.900700>}
box{<0,0,-0.101600><0.389800,0.036000,0.101600> rotate<0,-90.000000,0> translate<76.147800,0.000000,16.900700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.147800,0.000000,16.900700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.537500,0.000000,16.510900>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,45.004380,0> translate<76.147800,0.000000,16.900700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.537500,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.317100,0.000000,16.510900>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<76.537500,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.317100,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.706900,0.000000,16.121100>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<77.317100,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.706900,0.000000,16.121100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.706900,0.000000,15.731300>}
box{<0,0,-0.101600><0.389800,0.036000,0.101600> rotate<0,-90.000000,0> translate<77.706900,0.000000,15.731300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.706900,0.000000,15.731300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.317100,0.000000,15.341600>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-44.989680,0> translate<77.317100,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.317100,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.537500,0.000000,15.341600>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<76.537500,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.537500,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.147800,0.000000,15.731300>}
box{<0,0,-0.101600><0.551119,0.036000,0.101600> rotate<0,44.997030,0> translate<76.147800,0.000000,15.731300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.655800,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.655800,0.000000,17.680300>}
box{<0,0,-0.101600><2.338700,0.036000,0.101600> rotate<0,90.000000,0> translate<79.655800,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.655800,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.486500,0.000000,16.510900>}
box{<0,0,-0.101600><1.653711,0.036000,0.101600> rotate<0,-44.999480,0> translate<78.486500,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<78.486500,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.045600,0.000000,16.510900>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<78.486500,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.825200,0.000000,17.290500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.214900,0.000000,17.680300>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-45.004380,0> translate<80.825200,0.000000,17.290500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.214900,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.994500,0.000000,17.680300>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<81.214900,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.994500,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.384300,0.000000,17.290500>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<81.994500,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.384300,0.000000,17.290500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.384300,0.000000,16.900700>}
box{<0,0,-0.101600><0.389800,0.036000,0.101600> rotate<0,-90.000000,0> translate<82.384300,0.000000,16.900700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.384300,0.000000,16.900700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.994500,0.000000,16.510900>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,-44.997030,0> translate<81.994500,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.994500,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.384300,0.000000,16.121100>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<81.994500,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.384300,0.000000,16.121100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.384300,0.000000,15.731300>}
box{<0,0,-0.101600><0.389800,0.036000,0.101600> rotate<0,-90.000000,0> translate<82.384300,0.000000,15.731300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.384300,0.000000,15.731300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.994500,0.000000,15.341600>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-44.989680,0> translate<81.994500,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.994500,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.214900,0.000000,15.341600>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<81.214900,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.214900,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.825200,0.000000,15.731300>}
box{<0,0,-0.101600><0.551119,0.036000,0.101600> rotate<0,44.997030,0> translate<80.825200,0.000000,15.731300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.825200,0.000000,15.731300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.825200,0.000000,16.121100>}
box{<0,0,-0.101600><0.389800,0.036000,0.101600> rotate<0,90.000000,0> translate<80.825200,0.000000,16.121100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.825200,0.000000,16.121100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.214900,0.000000,16.510900>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-45.004380,0> translate<80.825200,0.000000,16.121100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.214900,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.825200,0.000000,16.900700>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,45.004380,0> translate<80.825200,0.000000,16.900700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.825200,0.000000,16.900700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.825200,0.000000,17.290500>}
box{<0,0,-0.101600><0.389800,0.036000,0.101600> rotate<0,90.000000,0> translate<80.825200,0.000000,17.290500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.214900,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.994500,0.000000,16.510900>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<81.214900,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.723000,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.163900,0.000000,17.680300>}
box{<0,0,-0.101600><1.559100,0.036000,0.101600> rotate<0,0.000000,0> translate<83.163900,0.000000,17.680300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.163900,0.000000,17.680300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.163900,0.000000,16.510900>}
box{<0,0,-0.101600><1.169400,0.036000,0.101600> rotate<0,-90.000000,0> translate<83.163900,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.163900,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.943400,0.000000,16.900700>}
box{<0,0,-0.101600><0.871530,0.036000,0.101600> rotate<0,-26.566238,0> translate<83.163900,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.943400,0.000000,16.900700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.333200,0.000000,16.900700>}
box{<0,0,-0.101600><0.389800,0.036000,0.101600> rotate<0,0.000000,0> translate<83.943400,0.000000,16.900700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.333200,0.000000,16.900700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.723000,0.000000,16.510900>}
box{<0,0,-0.101600><0.551260,0.036000,0.101600> rotate<0,44.997030,0> translate<84.333200,0.000000,16.900700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.723000,0.000000,16.510900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.723000,0.000000,15.731300>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,-90.000000,0> translate<84.723000,0.000000,15.731300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.723000,0.000000,15.731300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.333200,0.000000,15.341600>}
box{<0,0,-0.101600><0.551190,0.036000,0.101600> rotate<0,-44.989680,0> translate<84.333200,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.333200,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.553600,0.000000,15.341600>}
box{<0,0,-0.101600><0.779600,0.036000,0.101600> rotate<0,0.000000,0> translate<83.553600,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.553600,0.000000,15.341600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.163900,0.000000,15.731300>}
box{<0,0,-0.101600><0.551119,0.036000,0.101600> rotate<0,44.997030,0> translate<83.163900,0.000000,15.731300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.502600,0.000000,15.731300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.502600,0.000000,15.341600>}
box{<0,0,-0.101600><0.389700,0.036000,0.101600> rotate<0,-90.000000,0> translate<85.502600,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.502600,0.000000,18.070100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.502600,0.000000,16.510900>}
box{<0,0,-0.101600><1.559200,0.036000,0.101600> rotate<0,-90.000000,0> translate<85.502600,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.282100,0.000000,15.731300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.282100,0.000000,15.341600>}
box{<0,0,-0.101600><0.389700,0.036000,0.101600> rotate<0,-90.000000,0> translate<86.282100,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.282100,0.000000,18.070100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.282100,0.000000,16.510900>}
box{<0,0,-0.101600><1.559200,0.036000,0.101600> rotate<0,-90.000000,0> translate<86.282100,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.061600,0.000000,15.731300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.061600,0.000000,15.341600>}
box{<0,0,-0.101600><0.389700,0.036000,0.101600> rotate<0,-90.000000,0> translate<87.061600,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.061600,0.000000,18.070100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.061600,0.000000,16.510900>}
box{<0,0,-0.101600><1.559200,0.036000,0.101600> rotate<0,-90.000000,0> translate<87.061600,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.841100,0.000000,15.731300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.841100,0.000000,15.341600>}
box{<0,0,-0.101600><0.389700,0.036000,0.101600> rotate<0,-90.000000,0> translate<87.841100,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.841100,0.000000,18.070100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.841100,0.000000,16.510900>}
box{<0,0,-0.101600><1.559200,0.036000,0.101600> rotate<0,-90.000000,0> translate<87.841100,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.620600,0.000000,15.731300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.620600,0.000000,15.341600>}
box{<0,0,-0.101600><0.389700,0.036000,0.101600> rotate<0,-90.000000,0> translate<88.620600,0.000000,15.341600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.620600,0.000000,18.070100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.620600,0.000000,16.510900>}
box{<0,0,-0.101600><1.559200,0.036000,0.101600> rotate<0,-90.000000,0> translate<88.620600,0.000000,16.510900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.236200,0.000000,2.616200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.863100,0.000000,2.616200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<-11.863100,0.000000,2.616200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.863100,0.000000,2.616200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.863100,0.000000,3.429600>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<-11.863100,0.000000,3.429600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.863100,0.000000,3.429600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.592000,0.000000,3.700800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<-11.863100,0.000000,3.429600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.592000,0.000000,3.700800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.049600,0.000000,3.700800>}
box{<0,0,-0.076200><0.542400,0.036000,0.076200> rotate<0,0.000000,0> translate<-11.592000,0.000000,3.700800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.049600,0.000000,3.700800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.778500,0.000000,3.429600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<-11.049600,0.000000,3.700800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.778500,0.000000,3.429600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.778500,0.000000,2.616200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<-10.778500,0.000000,2.616200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.778500,0.000000,3.158500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.236200,0.000000,3.700800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<-10.778500,0.000000,3.158500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.863100,0.000000,5.337900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.863100,0.000000,4.253300>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<-11.863100,0.000000,4.253300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.863100,0.000000,4.253300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.236200,0.000000,4.253300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<-11.863100,0.000000,4.253300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.236200,0.000000,4.253300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.236200,0.000000,5.337900>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<-10.236200,0.000000,5.337900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.049600,0.000000,4.253300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.049600,0.000000,4.795600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<-11.049600,0.000000,4.795600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.592000,0.000000,6.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.863100,0.000000,6.703800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<-11.863100,0.000000,6.703800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.863100,0.000000,6.703800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.863100,0.000000,6.161500>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<-11.863100,0.000000,6.161500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.863100,0.000000,6.161500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.592000,0.000000,5.890400>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<-11.863100,0.000000,6.161500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.592000,0.000000,5.890400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.320800,0.000000,5.890400>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<-11.592000,0.000000,5.890400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.320800,0.000000,5.890400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.049600,0.000000,6.161500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<-11.320800,0.000000,5.890400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.049600,0.000000,6.161500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.049600,0.000000,6.703800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<-11.049600,0.000000,6.703800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.049600,0.000000,6.703800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.778500,0.000000,6.975000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<-11.049600,0.000000,6.703800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.778500,0.000000,6.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.507300,0.000000,6.975000>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<-10.778500,0.000000,6.975000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.507300,0.000000,6.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.236200,0.000000,6.703800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<-10.507300,0.000000,6.975000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.236200,0.000000,6.703800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.236200,0.000000,6.161500>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<-10.236200,0.000000,6.161500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.236200,0.000000,6.161500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.507300,0.000000,5.890400>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<-10.507300,0.000000,5.890400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.863100,0.000000,8.612100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.863100,0.000000,7.527500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<-11.863100,0.000000,7.527500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.863100,0.000000,7.527500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.236200,0.000000,7.527500>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<-11.863100,0.000000,7.527500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.236200,0.000000,7.527500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.236200,0.000000,8.612100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<-10.236200,0.000000,8.612100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.049600,0.000000,7.527500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.049600,0.000000,8.069800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<-11.049600,0.000000,8.069800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-10.236200,0.000000,9.706900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.863100,0.000000,9.706900>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<-11.863100,0.000000,9.706900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.863100,0.000000,9.164600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-11.863100,0.000000,10.249200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<-11.863100,0.000000,10.249200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.011200,0.000000,30.015200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,29.744000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<13.740100,0.000000,29.744000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,29.744000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,29.201700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.740100,0.000000,29.201700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,29.201700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.011200,0.000000,28.930600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<13.740100,0.000000,29.201700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.011200,0.000000,28.930600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.282400,0.000000,28.930600>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<14.011200,0.000000,28.930600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.282400,0.000000,28.930600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.553600,0.000000,29.201700>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<14.282400,0.000000,28.930600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.553600,0.000000,29.201700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.553600,0.000000,29.744000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<14.553600,0.000000,29.744000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.553600,0.000000,29.744000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.824700,0.000000,30.015200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<14.553600,0.000000,29.744000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.824700,0.000000,30.015200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.095900,0.000000,30.015200>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<14.824700,0.000000,30.015200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.095900,0.000000,30.015200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,29.744000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<15.095900,0.000000,30.015200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,29.744000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,29.201700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.367000,0.000000,29.201700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,29.201700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.095900,0.000000,28.930600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.095900,0.000000,28.930600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,30.567700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,30.567700>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<13.740100,0.000000,30.567700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,30.567700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,31.381100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<15.367000,0.000000,31.381100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,31.381100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.095900,0.000000,31.652300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<15.095900,0.000000,31.652300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.095900,0.000000,31.652300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.011200,0.000000,31.652300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<14.011200,0.000000,31.652300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.011200,0.000000,31.652300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,31.381100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<13.740100,0.000000,31.381100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,31.381100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,30.567700>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.740100,0.000000,30.567700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.011200,0.000000,34.926500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,34.655300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<13.740100,0.000000,34.655300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,34.655300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,34.113000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.740100,0.000000,34.113000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,34.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.011200,0.000000,33.841900>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<13.740100,0.000000,34.113000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.011200,0.000000,33.841900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.095900,0.000000,33.841900>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<14.011200,0.000000,33.841900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.095900,0.000000,33.841900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,34.113000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.095900,0.000000,33.841900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,34.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,34.655300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<15.367000,0.000000,34.655300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,34.655300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.095900,0.000000,34.926500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<15.095900,0.000000,34.926500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,35.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.282400,0.000000,35.479000>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<14.282400,0.000000,35.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.282400,0.000000,35.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,36.021300>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<13.740100,0.000000,36.021300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,36.021300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.282400,0.000000,36.563600>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.740100,0.000000,36.021300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.282400,0.000000,36.563600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,36.563600>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<14.282400,0.000000,36.563600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.553600,0.000000,35.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.553600,0.000000,36.563600>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<14.553600,0.000000,36.563600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,37.116100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,37.116100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<13.740100,0.000000,37.116100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,37.116100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,37.929500>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<13.740100,0.000000,37.929500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,37.929500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.011200,0.000000,38.200700>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<13.740100,0.000000,37.929500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.011200,0.000000,38.200700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.553600,0.000000,38.200700>}
box{<0,0,-0.076200><0.542400,0.036000,0.076200> rotate<0,0.000000,0> translate<14.011200,0.000000,38.200700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.553600,0.000000,38.200700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.824700,0.000000,37.929500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<14.553600,0.000000,38.200700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.824700,0.000000,37.929500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.824700,0.000000,37.116100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.824700,0.000000,37.116100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.824700,0.000000,37.658400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,38.200700>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.824700,0.000000,37.658400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,38.753200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,38.753200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<13.740100,0.000000,38.753200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,38.753200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,39.566600>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<15.367000,0.000000,39.566600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,39.566600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.095900,0.000000,39.837800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<15.095900,0.000000,39.837800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.095900,0.000000,39.837800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.011200,0.000000,39.837800>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<14.011200,0.000000,39.837800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.011200,0.000000,39.837800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,39.566600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<13.740100,0.000000,39.566600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,39.566600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.740100,0.000000,38.753200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.740100,0.000000,38.753200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,3.862100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,2.235200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.033000,0.000000,2.235200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,2.235200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.846400,0.000000,2.235200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<10.033000,0.000000,2.235200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.846400,0.000000,2.235200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.117600,0.000000,2.506300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<10.846400,0.000000,2.235200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.117600,0.000000,2.506300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.117600,0.000000,3.591000>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,90.000000,0> translate<11.117600,0.000000,3.591000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.117600,0.000000,3.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.846400,0.000000,3.862100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<10.846400,0.000000,3.862100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.846400,0.000000,3.862100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,3.862100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<10.033000,0.000000,3.862100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.670100,0.000000,3.319800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.212400,0.000000,3.862100>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<11.670100,0.000000,3.319800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.212400,0.000000,3.862100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.212400,0.000000,2.235200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.212400,0.000000,2.235200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.670100,0.000000,2.235200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.754700,0.000000,2.235200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<11.670100,0.000000,2.235200> }
difference{
cylinder{<-4.699000,0,11.938000><-4.699000,0.036000,11.938000>0.647700 translate<0,0.000000,0>}
cylinder{<-4.699000,-0.1,11.938000><-4.699000,0.135000,11.938000>0.622300 translate<0,0.000000,0>}}
//3-3V silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.274000,0.000000,13.517600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.274000,0.000000,14.117600>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.274000,0.000000,14.117600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.474000,0.000000,13.517600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.474000,0.000000,14.117600>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<8.474000,0.000000,14.117600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.255000,0.000000,14.135100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.874000,0.000000,14.135100>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<7.874000,0.000000,14.135100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.874000,0.000000,14.135100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.493000,0.000000,14.135100>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<7.493000,0.000000,14.135100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.874000,0.000000,14.135100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.493000,0.000000,13.500100>}
box{<0,0,-0.063500><0.740531,0.036000,0.063500> rotate<0,-59.032347,0> translate<7.493000,0.000000,13.500100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.493000,0.000000,13.500100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.255000,0.000000,13.500100>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<7.493000,0.000000,13.500100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.255000,0.000000,13.500100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.874000,0.000000,14.135100>}
box{<0,0,-0.063500><0.740531,0.036000,0.063500> rotate<0,59.032347,0> translate<7.874000,0.000000,14.135100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.112000,0.000000,14.960600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.112000,0.000000,15.278100>}
box{<0,0,-0.063500><0.317500,0.036000,0.063500> rotate<0,90.000000,0> translate<7.112000,0.000000,15.278100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.112000,0.000000,15.278100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.636000,0.000000,15.278100>}
box{<0,0,-0.063500><1.524000,0.036000,0.063500> rotate<0,0.000000,0> translate<7.112000,0.000000,15.278100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.636000,0.000000,15.278100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.636000,0.000000,14.960600>}
box{<0,0,-0.063500><0.317500,0.036000,0.063500> rotate<0,-90.000000,0> translate<8.636000,0.000000,14.960600> }
//5V silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.226000,0.000000,12.520000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.226000,0.000000,11.920000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<99.226000,0.000000,11.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.026000,0.000000,12.520000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.026000,0.000000,11.920000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<98.026000,0.000000,11.920000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<98.245000,0.000000,11.902500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<98.626000,0.000000,11.902500>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<98.245000,0.000000,11.902500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<98.626000,0.000000,11.902500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<99.007000,0.000000,11.902500>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<98.626000,0.000000,11.902500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<98.626000,0.000000,11.902500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<99.007000,0.000000,12.537500>}
box{<0,0,-0.063500><0.740531,0.036000,0.063500> rotate<0,-59.032347,0> translate<98.626000,0.000000,11.902500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<99.007000,0.000000,12.537500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<98.245000,0.000000,12.537500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<98.245000,0.000000,12.537500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<98.245000,0.000000,12.537500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<98.626000,0.000000,11.902500>}
box{<0,0,-0.063500><0.740531,0.036000,0.063500> rotate<0,59.032347,0> translate<98.245000,0.000000,12.537500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<99.388000,0.000000,11.077000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<99.388000,0.000000,10.759500>}
box{<0,0,-0.063500><0.317500,0.036000,0.063500> rotate<0,-90.000000,0> translate<99.388000,0.000000,10.759500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<99.388000,0.000000,10.759500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<97.864000,0.000000,10.759500>}
box{<0,0,-0.063500><1.524000,0.036000,0.063500> rotate<0,0.000000,0> translate<97.864000,0.000000,10.759500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<97.864000,0.000000,10.759500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<97.864000,0.000000,11.077000>}
box{<0,0,-0.063500><0.317500,0.036000,0.063500> rotate<0,90.000000,0> translate<97.864000,0.000000,11.077000> }
//12V silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.670000,0.000000,12.520000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.670000,0.000000,11.920000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<95.670000,0.000000,11.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.470000,0.000000,12.520000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.470000,0.000000,11.920000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<94.470000,0.000000,11.920000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.689000,0.000000,11.902500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<95.070000,0.000000,11.902500>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<94.689000,0.000000,11.902500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<95.070000,0.000000,11.902500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<95.451000,0.000000,11.902500>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<95.070000,0.000000,11.902500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<95.070000,0.000000,11.902500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<95.451000,0.000000,12.537500>}
box{<0,0,-0.063500><0.740531,0.036000,0.063500> rotate<0,-59.032347,0> translate<95.070000,0.000000,11.902500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<95.451000,0.000000,12.537500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.689000,0.000000,12.537500>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<94.689000,0.000000,12.537500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.689000,0.000000,12.537500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<95.070000,0.000000,11.902500>}
box{<0,0,-0.063500><0.740531,0.036000,0.063500> rotate<0,59.032347,0> translate<94.689000,0.000000,12.537500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<95.832000,0.000000,11.077000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<95.832000,0.000000,10.759500>}
box{<0,0,-0.063500><0.317500,0.036000,0.063500> rotate<0,-90.000000,0> translate<95.832000,0.000000,10.759500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<95.832000,0.000000,10.759500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.308000,0.000000,10.759500>}
box{<0,0,-0.063500><1.524000,0.036000,0.063500> rotate<0,0.000000,0> translate<94.308000,0.000000,10.759500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.308000,0.000000,10.759500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.308000,0.000000,11.077000>}
box{<0,0,-0.063500><0.317500,0.036000,0.063500> rotate<0,90.000000,0> translate<94.308000,0.000000,11.077000> }
//A-AXIS silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.005000,0.000000,78.105000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.305000,0.000000,78.105000>}
box{<0,0,-0.063500><12.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<27.305000,0.000000,78.105000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.305000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.305000,0.000000,78.105000>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,-90.000000,0> translate<27.305000,0.000000,78.105000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.005000,0.000000,78.105000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.005000,0.000000,84.455000>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,90.000000,0> translate<40.005000,0.000000,84.455000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.275000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.005000,0.000000,76.835000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<40.005000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.035000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.035000,0.000000,76.835000>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,-90.000000,0> translate<26.035000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.275000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.275000,0.000000,85.725000>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,90.000000,0> translate<41.275000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.623000,0.000000,83.693000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.623000,0.000000,84.455000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,90.000000,0> translate<31.623000,0.000000,84.455000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.623000,0.000000,83.693000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.687000,0.000000,83.693000>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<31.623000,0.000000,83.693000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.687000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.687000,0.000000,83.693000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,-90.000000,0> translate<35.687000,0.000000,83.693000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.687000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.005000,0.000000,84.455000>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<35.687000,0.000000,84.455000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.687000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.687000,0.000000,84.709000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<35.687000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.305000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.305000,0.000000,76.581000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<27.305000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.305000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.575000,0.000000,76.581000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<27.305000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.575000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.575000,0.000000,76.581000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<28.575000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.305000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.035000,0.000000,76.835000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<26.035000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.020000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.290000,0.000000,76.581000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<33.020000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.020000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.020000,0.000000,76.835000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<33.020000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.020000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.575000,0.000000,76.835000>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,0.000000,0> translate<28.575000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.290000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.290000,0.000000,76.835000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<34.290000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.735000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.005000,0.000000,76.581000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<38.735000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.005000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.005000,0.000000,76.835000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<40.005000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.735000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.735000,0.000000,76.835000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<38.735000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.735000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.290000,0.000000,76.835000>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,0.000000,0> translate<34.290000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.035000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.623000,0.000000,85.725000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,0.000000,0> translate<26.035000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.623000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.687000,0.000000,85.725000>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<31.623000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.305000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.623000,0.000000,84.455000>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<27.305000,0.000000,84.455000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.623000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.623000,0.000000,84.709000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<31.623000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.623000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.623000,0.000000,85.725000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<31.623000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<31.623000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<27.051000,0.000000,84.709000>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<27.051000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<27.051000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<27.051000,0.000000,77.851000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,-90.000000,0> translate<27.051000,0.000000,77.851000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<27.051000,0.000000,77.851000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<40.259000,0.000000,77.851000>}
box{<0,0,-0.025400><13.208000,0.036000,0.025400> rotate<0,0.000000,0> translate<27.051000,0.000000,77.851000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<40.259000,0.000000,77.851000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<40.259000,0.000000,84.709000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,90.000000,0> translate<40.259000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<40.259000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<35.687000,0.000000,84.709000>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<35.687000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.687000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.687000,0.000000,85.725000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<35.687000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.687000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.195000,0.000000,85.725000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,0.000000,0> translate<35.687000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.195000,0.000000,85.598000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.195000,0.000000,85.725000>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,90.000000,0> translate<36.195000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.195000,0.000000,85.598000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.465000,0.000000,85.598000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<36.195000,0.000000,85.598000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.465000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.465000,0.000000,85.598000>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,-90.000000,0> translate<37.465000,0.000000,85.598000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.465000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.275000,0.000000,85.725000>}
box{<0,0,-0.063500><3.810000,0.036000,0.063500> rotate<0,0.000000,0> translate<37.465000,0.000000,85.725000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<33.655000,0.000000,80.010000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<36.195000,0.000000,80.010000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<31.115000,0.000000,80.010000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<33.655000,0.000000,82.550000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<36.195000,0.000000,82.550000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<31.115000,0.000000,82.550000>}
//B-AXIS silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.495000,0.000000,78.105000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.795000,0.000000,78.105000>}
box{<0,0,-0.063500><12.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<10.795000,0.000000,78.105000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.795000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.795000,0.000000,78.105000>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,-90.000000,0> translate<10.795000,0.000000,78.105000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.495000,0.000000,78.105000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.495000,0.000000,84.455000>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,90.000000,0> translate<23.495000,0.000000,84.455000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.765000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.495000,0.000000,76.835000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<23.495000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.525000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.525000,0.000000,76.835000>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,-90.000000,0> translate<9.525000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.765000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.765000,0.000000,85.725000>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,90.000000,0> translate<24.765000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.113000,0.000000,83.693000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.113000,0.000000,84.455000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,90.000000,0> translate<15.113000,0.000000,84.455000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.113000,0.000000,83.693000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.177000,0.000000,83.693000>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<15.113000,0.000000,83.693000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.177000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.177000,0.000000,83.693000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,-90.000000,0> translate<19.177000,0.000000,83.693000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.177000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.495000,0.000000,84.455000>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<19.177000,0.000000,84.455000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.177000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.177000,0.000000,84.709000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<19.177000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.795000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.795000,0.000000,76.581000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<10.795000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.795000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.065000,0.000000,76.581000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<10.795000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.065000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.065000,0.000000,76.581000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.065000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.795000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.525000,0.000000,76.835000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<9.525000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.510000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.780000,0.000000,76.581000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<16.510000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.510000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.510000,0.000000,76.835000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<16.510000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.510000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.065000,0.000000,76.835000>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,0.000000,0> translate<12.065000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.780000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.780000,0.000000,76.835000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<17.780000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.225000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.495000,0.000000,76.581000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<22.225000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.495000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.495000,0.000000,76.835000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<23.495000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.225000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.225000,0.000000,76.835000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<22.225000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.225000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.780000,0.000000,76.835000>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.780000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.525000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.113000,0.000000,85.725000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,0.000000,0> translate<9.525000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.113000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.177000,0.000000,85.725000>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<15.113000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.795000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.113000,0.000000,84.455000>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<10.795000,0.000000,84.455000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.113000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.113000,0.000000,84.709000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<15.113000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.113000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.113000,0.000000,85.725000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<15.113000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.113000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.541000,0.000000,84.709000>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<10.541000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.541000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.541000,0.000000,77.851000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,-90.000000,0> translate<10.541000,0.000000,77.851000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.541000,0.000000,77.851000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<23.749000,0.000000,77.851000>}
box{<0,0,-0.025400><13.208000,0.036000,0.025400> rotate<0,0.000000,0> translate<10.541000,0.000000,77.851000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<23.749000,0.000000,77.851000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<23.749000,0.000000,84.709000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,90.000000,0> translate<23.749000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<23.749000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.177000,0.000000,84.709000>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<19.177000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.177000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.177000,0.000000,85.725000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<19.177000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.177000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.685000,0.000000,85.725000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,0.000000,0> translate<19.177000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.685000,0.000000,85.598000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.685000,0.000000,85.725000>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,90.000000,0> translate<19.685000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.685000,0.000000,85.598000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.955000,0.000000,85.598000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<19.685000,0.000000,85.598000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.955000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.955000,0.000000,85.598000>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.955000,0.000000,85.598000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.955000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.765000,0.000000,85.725000>}
box{<0,0,-0.063500><3.810000,0.036000,0.063500> rotate<0,0.000000,0> translate<20.955000,0.000000,85.725000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<17.145000,0.000000,80.010000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<19.685000,0.000000,80.010000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<14.605000,0.000000,80.010000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<17.145000,0.000000,82.550000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<19.685000,0.000000,82.550000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<14.605000,0.000000,82.550000>}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.677000,0.000000,28.000000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.077000,0.000000,28.000000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<98.077000,0.000000,28.000000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.677000,0.000000,29.200000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.077000,0.000000,29.200000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<98.077000,0.000000,29.200000> }
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.439000,0.000000,21.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.677000,0.000000,21.557000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<99.677000,0.000000,21.557000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.058000,0.000000,21.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<100.058000,0.000000,21.176000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<100.058000,0.000000,21.176000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.661000,0.000000,22.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.772000,0.000000,22.700000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<97.772000,0.000000,22.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.772000,0.000000,22.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.772000,0.000000,23.970000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<97.772000,0.000000,23.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.772000,0.000000,23.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.264000,0.000000,23.970000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<97.264000,0.000000,23.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.264000,0.000000,23.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.264000,0.000000,21.430000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<97.264000,0.000000,21.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.264000,0.000000,21.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.772000,0.000000,21.430000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<97.264000,0.000000,21.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.772000,0.000000,21.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<97.772000,0.000000,22.700000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<97.772000,0.000000,22.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<96.375000,0.000000,22.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.359000,0.000000,22.700000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<95.359000,0.000000,22.700000> }
difference{
cylinder{<97.010000,0,22.700000><97.010000,0.036000,22.700000>4.140200 translate<0,0.000000,0>}
cylinder{<97.010000,-0.1,22.700000><97.010000,0.135000,22.700000>3.987800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-180.000000,0> translate<96.502000,0.000000,22.700000>}
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.099800,0.000000,44.239200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.337800,0.000000,44.239200>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<59.337800,0.000000,44.239200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.718800,0.000000,44.620200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.718800,0.000000,43.858200>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.718800,0.000000,43.858200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.321800,0.000000,45.382200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.432800,0.000000,45.382200>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.432800,0.000000,45.382200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.432800,0.000000,45.382200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.432800,0.000000,46.652200>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.432800,0.000000,46.652200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.432800,0.000000,46.652200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.924800,0.000000,46.652200>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.924800,0.000000,46.652200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.924800,0.000000,46.652200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.924800,0.000000,44.112200>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<56.924800,0.000000,44.112200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.924800,0.000000,44.112200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.432800,0.000000,44.112200>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.924800,0.000000,44.112200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.432800,0.000000,44.112200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.432800,0.000000,45.382200>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.432800,0.000000,45.382200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.035800,0.000000,45.382200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.019800,0.000000,45.382200>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.019800,0.000000,45.382200> }
difference{
cylinder{<56.670800,0,45.382200><56.670800,0.036000,45.382200>4.140200 translate<0,0.000000,0>}
cylinder{<56.670800,-0.1,45.382200><56.670800,0.135000,45.382200>3.987800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-180.000000,0> translate<56.162800,0.000000,45.382200>}
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.096500,0.000000,13.741400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.096500,0.000000,12.471400>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<10.096500,0.000000,12.471400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.096500,0.000000,12.471400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.096500,0.000000,7.391400>}
box{<0,0,-0.127000><5.080000,0.036000,0.127000> rotate<0,-90.000000,0> translate<10.096500,0.000000,7.391400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.096500,0.000000,7.391400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.366500,0.000000,7.391400>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<10.096500,0.000000,7.391400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.366500,0.000000,7.391400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.636500,0.000000,7.391400>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<11.366500,0.000000,7.391400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.636500,0.000000,7.391400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.636500,0.000000,12.471400>}
box{<0,0,-0.127000><5.080000,0.036000,0.127000> rotate<0,90.000000,0> translate<12.636500,0.000000,12.471400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.636500,0.000000,12.471400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.636500,0.000000,13.741400>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<12.636500,0.000000,13.741400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.636500,0.000000,13.741400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.366500,0.000000,13.741400>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<11.366500,0.000000,13.741400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.366500,0.000000,13.741400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.096500,0.000000,13.741400>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<10.096500,0.000000,13.741400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.096500,0.000000,12.471400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.636500,0.000000,12.471400>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,0.000000,0> translate<10.096500,0.000000,12.471400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.366500,0.000000,7.391400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.366500,0.000000,6.756400>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,-90.000000,0> translate<11.366500,0.000000,6.756400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.366500,0.000000,13.741400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.366500,0.000000,14.376400>}
box{<0,0,-0.127000><0.635000,0.036000,0.127000> rotate<0,90.000000,0> translate<11.366500,0.000000,14.376400> }
//E-STOP silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.023500,0.000000,66.294000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.308500,0.000000,66.294000>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.308500,0.000000,66.294000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.308500,0.000000,66.294000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.308500,0.000000,53.594000>}
box{<0,0,-0.127000><12.700000,0.036000,0.127000> rotate<0,-90.000000,0> translate<55.308500,0.000000,53.594000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.308500,0.000000,53.594000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.023500,0.000000,53.594000>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,0.000000,0> translate<55.308500,0.000000,53.594000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.023500,0.000000,53.594000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.023500,0.000000,56.451500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,90.000000,0> translate<61.023500,0.000000,56.451500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.023500,0.000000,56.451500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.976000,0.000000,56.451500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,0.000000,0> translate<61.023500,0.000000,56.451500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.976000,0.000000,56.451500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.976000,0.000000,63.436500>}
box{<0,0,-0.127000><6.985000,0.036000,0.127000> rotate<0,90.000000,0> translate<61.976000,0.000000,63.436500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.976000,0.000000,63.436500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.023500,0.000000,63.436500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,0.000000,0> translate<61.023500,0.000000,63.436500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.023500,0.000000,63.436500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.023500,0.000000,66.294000>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,90.000000,0> translate<61.023500,0.000000,66.294000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.943500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.388500,0.000000,54.229000>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,0.000000,0> translate<55.943500,0.000000,54.229000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.943500,0.000000,65.659000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.388500,0.000000,65.659000>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,0.000000,0> translate<55.943500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.943500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.943500,0.000000,65.659000>}
box{<0,0,-0.025400><11.430000,0.036000,0.025400> rotate<0,90.000000,0> translate<55.943500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.388500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.388500,0.000000,57.086500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,90.000000,0> translate<60.388500,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.388500,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.388500,0.000000,62.801500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,90.000000,0> translate<60.388500,0.000000,62.801500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.388500,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.388500,0.000000,65.659000>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,90.000000,0> translate<60.388500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.341000,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.341000,0.000000,57.086500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,-90.000000,0> translate<61.341000,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.388500,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.341000,0.000000,57.086500>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,0.000000,0> translate<60.388500,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.388500,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.341000,0.000000,62.801500>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,0.000000,0> translate<60.388500,0.000000,62.801500> }
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<58.166000,0.000000,58.674000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<58.166000,0.000000,56.134000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<58.166000,0.000000,63.754000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<58.166000,0.000000,61.214000>}
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.243000,0.000000,44.455000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.243000,0.000000,47.755000>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,90.000000,0> translate<62.243000,0.000000,47.755000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.243000,0.000000,47.755000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.243000,0.000000,48.255000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,90.000000,0> translate<62.243000,0.000000,48.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.243000,0.000000,48.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.043000,0.000000,48.255000>}
box{<0,0,-0.101600><4.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<62.243000,0.000000,48.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.043000,0.000000,48.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.043000,0.000000,47.755000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,-90.000000,0> translate<67.043000,0.000000,47.755000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.043000,0.000000,47.755000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.043000,0.000000,44.455000>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,-90.000000,0> translate<67.043000,0.000000,44.455000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.043000,0.000000,44.455000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.243000,0.000000,44.455000>}
box{<0,0,-0.101600><4.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<62.243000,0.000000,44.455000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.243000,0.000000,47.755000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.043000,0.000000,47.755000>}
box{<0,0,-0.101600><4.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<62.243000,0.000000,47.755000> }
object{ARC(1.270000,0.304800,90.000000,270.000000,0.036000) translate<67.183000,0.000000,46.355000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<67.183000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<67.183000,0.000000,50.165000>}
box{<0,0,-0.304800><7.620000,0.036000,0.304800> rotate<0,90.000000,0> translate<67.183000,0.000000,50.165000> }
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-180.000000,0> translate<66.548000,0.000000,48.904900>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-180.000000,0> translate<65.278000,0.000000,48.904900>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-180.000000,0> translate<64.008000,0.000000,48.904900>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-180.000000,0> translate<62.738000,0.000000,48.904900>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-180.000000,0> translate<62.738000,0.000000,43.805000>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-180.000000,0> translate<64.008000,0.000000,43.805000>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-180.000000,0> translate<65.278000,0.000000,43.805000>}
box{<-0.245100,0,-0.550000><0.245100,0.036000,0.550000> rotate<0,-180.000000,0> translate<66.548000,0.000000,43.805000>}
//INTERFACE silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,26.670000>}
box{<0,0,-0.076200><30.480000,0.036000,0.076200> rotate<0,-90.000000,0> translate<76.835000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,26.670000>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.485000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,57.150000>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.485000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,57.150000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<78.105000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,30.099000>}
box{<0,0,-0.076200><4.699000,0.036000,0.076200> rotate<0,90.000000,0> translate<69.215000,0.000000,30.099000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,25.400000>}
box{<0,0,-0.076200><8.890000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.215000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,58.420000>}
box{<0,0,-0.076200><8.890000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.215000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,30.988000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<70.485000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.247000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.247000,0.000000,43.942000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<71.247000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.247000,0.000000,43.942000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.485000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,48.768000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<70.485000,0.000000,48.768000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.247000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,39.878000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.485000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.231000,0.000000,39.878000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.231000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.359000,0.000000,26.670000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.105000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.359000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.359000,0.000000,27.940000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<78.359000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.359000,0.000000,27.940000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.105000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,25.400000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<78.105000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.359000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.359000,0.000000,42.545000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<78.359000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.359000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,41.275000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.105000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,27.940000>}
box{<0,0,-0.076200><13.335000,0.036000,0.076200> rotate<0,-90.000000,0> translate<78.105000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.359000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,42.545000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.105000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.359000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.359000,0.000000,57.150000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<78.359000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.359000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,57.150000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.105000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.359000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,55.880000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<78.105000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,42.545000>}
box{<0,0,-0.076200><13.335000,0.036000,0.076200> rotate<0,-90.000000,0> translate<78.105000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,39.878000>}
box{<0,0,-0.076200><6.477000,0.036000,0.076200> rotate<0,90.000000,0> translate<69.215000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,43.942000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<69.215000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.231000,0.000000,32.512000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.231000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,39.878000>}
box{<0,0,-0.076200><7.366000,0.036000,0.076200> rotate<0,90.000000,0> translate<70.485000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.231000,0.000000,30.988000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.231000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,32.512000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<70.485000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.723000,0.000000,33.020000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,36.867464,0> translate<69.215000,0.000000,33.401000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.723000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,30.099000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-36.867464,0> translate<69.215000,0.000000,30.099000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.723000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.723000,0.000000,30.988000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<69.723000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<70.231000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<70.231000,0.000000,39.878000>}
box{<0,0,-0.025400><7.366000,0.036000,0.025400> rotate<0,90.000000,0> translate<70.231000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.231000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,39.878000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.215000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<70.231000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<70.231000,0.000000,26.416000>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,-90.000000,0> translate<70.231000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<70.231000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<77.089000,0.000000,26.416000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,0.000000,0> translate<70.231000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<77.089000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<77.089000,0.000000,57.404000>}
box{<0,0,-0.025400><30.988000,0.036000,0.025400> rotate<0,90.000000,0> translate<77.089000,0.000000,57.404000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<77.089000,0.000000,57.404000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<70.231000,0.000000,57.404000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,0.000000,0> translate<70.231000,0.000000,57.404000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<70.231000,0.000000,57.404000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<70.231000,0.000000,50.292000>}
box{<0,0,-0.025400><7.112000,0.036000,0.025400> rotate<0,-90.000000,0> translate<70.231000,0.000000,50.292000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.231000,0.000000,43.942000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.231000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.231000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,43.942000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.215000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.231000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.723000,0.000000,32.512000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.723000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.723000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.723000,0.000000,33.020000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<69.723000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.231000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.723000,0.000000,30.988000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.723000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.723000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.723000,0.000000,32.512000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<69.723000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,54.102000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.215000,0.000000,54.102000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.342000,0.000000,54.102000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,54.102000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.215000,0.000000,54.102000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.342000,0.000000,54.102000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.342000,0.000000,52.578000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.342000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.342000,0.000000,52.578000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.215000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,51.181000>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.215000,0.000000,51.181000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.231000,0.000000,50.292000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.723000,0.000000,50.292000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.723000,0.000000,50.292000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.231000,0.000000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.723000,0.000000,48.768000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.723000,0.000000,48.768000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<70.231000,0.000000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<70.231000,0.000000,43.942000>}
box{<0,0,-0.025400><4.826000,0.036000,0.025400> rotate<0,-90.000000,0> translate<70.231000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,50.292000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.231000,0.000000,50.292000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.231000,0.000000,50.292000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,50.292000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,57.150000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<70.485000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.231000,0.000000,48.768000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.231000,0.000000,48.768000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,50.292000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<70.485000,0.000000,50.292000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.723000,0.000000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.723000,0.000000,50.292000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<69.723000,0.000000,50.292000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.723000,0.000000,50.292000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.723000,0.000000,50.800000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<69.723000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,51.181000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.723000,0.000000,50.800000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,36.867464,0> translate<69.215000,0.000000,51.181000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.723000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,47.879000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-36.867464,0> translate<69.215000,0.000000,47.879000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,47.879000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,0.000000,43.942000>}
box{<0,0,-0.076200><3.937000,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.215000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.723000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.723000,0.000000,48.768000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<69.723000,0.000000,48.768000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<74.930000,0.000000,30.480000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<72.390000,0.000000,30.480000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<74.930000,0.000000,33.020000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<74.930000,0.000000,38.100000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<72.390000,0.000000,38.100000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<72.390000,0.000000,33.020000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<74.930000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<74.930000,0.000000,53.340000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<74.930000,0.000000,48.260000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<74.930000,0.000000,40.640000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<74.930000,0.000000,43.180000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<72.390000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<72.390000,0.000000,53.340000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<72.390000,0.000000,48.260000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<72.390000,0.000000,40.640000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<72.390000,0.000000,43.180000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<72.390000,0.000000,45.720000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<74.930000,0.000000,45.720000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<74.930000,0.000000,35.560000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<72.390000,0.000000,35.560000>}
//J1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.916000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.672000,0.000000,12.345000>}
box{<0,0,-0.101600><2.244000,0.036000,0.101600> rotate<0,0.000000,0> translate<42.672000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.725000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.132000,0.000000,12.345000>}
box{<0,0,-0.101600><0.593000,0.036000,0.101600> rotate<0,0.000000,0> translate<40.132000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.799000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.640000,0.000000,12.345000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<40.640000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.020000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.506000,0.000000,12.345000>}
box{<0,0,-0.101600><3.514000,0.036000,0.101600> rotate<0,0.000000,0> translate<29.506000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.185000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.592000,0.000000,12.345000>}
box{<0,0,-0.101600><0.593000,0.036000,0.101600> rotate<0,0.000000,0> translate<37.592000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.560000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.052000,0.000000,12.345000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.052000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.259000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.100000,0.000000,12.345000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.100000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.719000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.560000,0.000000,12.345000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.560000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.052000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.893000,0.000000,12.345000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<32.893000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.419800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.419800,0.000000,1.676400>}
box{<0,0,-0.101600><6.629400,0.036000,0.101600> rotate<0,-90.000000,0> translate<31.419800,0.000000,1.676400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.002200,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.970200,0.000000,8.305800>}
box{<0,0,-0.101600><2.032000,0.036000,0.101600> rotate<0,0.000000,0> translate<40.970200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.563800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.954200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<39.954200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.547800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.938200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<38.938200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.531800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.922200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<37.922200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.515800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.906200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<36.906200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.451800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.419800,0.000000,8.305800>}
box{<0,0,-0.101600><2.032000,0.036000,0.101600> rotate<0,0.000000,0> translate<31.419800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.419800,0.000000,1.676400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.020000,0.000000,1.676400>}
box{<0,0,-0.101600><1.600200,0.036000,0.101600> rotate<0,0.000000,0> translate<31.419800,0.000000,1.676400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.020000,0.000000,1.676400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.020000,0.000000,0.584200>}
box{<0,0,-0.101600><1.092200,0.036000,0.101600> rotate<0,-90.000000,0> translate<33.020000,0.000000,0.584200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.547800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.547800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<39.547800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.547800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.954200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<39.547800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.954200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.954200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<39.954200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.531800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.531800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<38.531800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.531800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.938200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<38.531800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.938200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.938200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<38.938200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.515800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.515800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<37.515800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.515800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.922200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<37.515800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.922200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.922200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<37.922200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.499800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.499800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.499800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.499800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.906200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<36.499800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.906200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.906200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.906200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.451800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.451800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<33.451800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.451800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.858200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<33.451800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.858200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.858200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<33.858200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.563800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.563800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<40.563800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.563800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.970200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<40.563800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.970200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.970200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<40.970200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.483800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.483800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<35.483800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.483800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.890200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<35.483800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.890200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.890200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<35.890200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.442400,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.442400,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.442400,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.442400,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.874200,0.000000,8.890000>}
box{<0,0,-0.101600><0.431800,0.036000,0.101600> rotate<0,0.000000,0> translate<34.442400,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.874200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.874200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.874200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.499800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.890200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<35.890200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.483800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.874200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<34.874200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.442400,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.858200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,0.000000,0> translate<33.858200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.002200,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.002200,0.000000,1.676400>}
box{<0,0,-0.101600><6.629400,0.036000,0.101600> rotate<0,-90.000000,0> translate<43.002200,0.000000,1.676400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.002200,0.000000,1.676400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.402000,0.000000,1.676400>}
box{<0,0,-0.101600><1.600200,0.036000,0.101600> rotate<0,0.000000,0> translate<41.402000,0.000000,1.676400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.402000,0.000000,1.676400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.402000,0.000000,0.584200>}
box{<0,0,-0.101600><1.092200,0.036000,0.101600> rotate<0,-90.000000,0> translate<41.402000,0.000000,0.584200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.976800,0.000000,1.625600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.976800,0.000000,0.584200>}
box{<0,0,-0.127000><1.041400,0.036000,0.127000> rotate<0,-90.000000,0> translate<42.976800,0.000000,0.584200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.976800,0.000000,0.584200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.445200,0.000000,0.584200>}
box{<0,0,-0.127000><11.531600,0.036000,0.127000> rotate<0,0.000000,0> translate<31.445200,0.000000,0.584200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.445200,0.000000,0.584200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.445200,0.000000,1.651000>}
box{<0,0,-0.127000><1.066800,0.036000,0.127000> rotate<0,90.000000,0> translate<31.445200,0.000000,1.651000> }
difference{
cylinder{<37.211000,0,4.445000><37.211000,0.036000,4.445000>1.397000 translate<0,0.000000,0>}
cylinder{<37.211000,-0.1,4.445000><37.211000,0.135000,4.445000>1.143000 translate<0,0.000000,0>}}
//J2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.791000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.547000,0.000000,12.345000>}
box{<0,0,-0.101600><2.244000,0.036000,0.101600> rotate<0,0.000000,0> translate<58.547000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.600000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.007000,0.000000,12.345000>}
box{<0,0,-0.101600><0.593000,0.036000,0.101600> rotate<0,0.000000,0> translate<56.007000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.674000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.515000,0.000000,12.345000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<56.515000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.895000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.381000,0.000000,12.345000>}
box{<0,0,-0.101600><3.514000,0.036000,0.101600> rotate<0,0.000000,0> translate<45.381000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.060000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.467000,0.000000,12.345000>}
box{<0,0,-0.101600><0.593000,0.036000,0.101600> rotate<0,0.000000,0> translate<53.467000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.435000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.927000,0.000000,12.345000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.927000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.134000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.975000,0.000000,12.345000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<53.975000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.594000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.435000,0.000000,12.345000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<51.435000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.927000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.768000,0.000000,12.345000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<48.768000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.294800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.294800,0.000000,1.676400>}
box{<0,0,-0.101600><6.629400,0.036000,0.101600> rotate<0,-90.000000,0> translate<47.294800,0.000000,1.676400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.877200,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.845200,0.000000,8.305800>}
box{<0,0,-0.101600><2.032000,0.036000,0.101600> rotate<0,0.000000,0> translate<56.845200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.438800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.829200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<55.829200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.422800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.813200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<54.813200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.406800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.797200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<53.797200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.390800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.781200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<52.781200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.326800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.294800,0.000000,8.305800>}
box{<0,0,-0.101600><2.032000,0.036000,0.101600> rotate<0,0.000000,0> translate<47.294800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.294800,0.000000,1.676400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.895000,0.000000,1.676400>}
box{<0,0,-0.101600><1.600200,0.036000,0.101600> rotate<0,0.000000,0> translate<47.294800,0.000000,1.676400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.895000,0.000000,1.676400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.895000,0.000000,0.584200>}
box{<0,0,-0.101600><1.092200,0.036000,0.101600> rotate<0,-90.000000,0> translate<48.895000,0.000000,0.584200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.422800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.422800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<55.422800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.422800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.829200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<55.422800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.829200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.829200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<55.829200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.406800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.406800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<54.406800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.406800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.813200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<54.406800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.813200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.813200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<54.813200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.390800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.390800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<53.390800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.390800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.797200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<53.390800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.797200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.797200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<53.797200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.374800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.374800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<52.374800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.374800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.781200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<52.374800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.781200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.781200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<52.781200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.326800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.326800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.326800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.326800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.733200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<49.326800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.733200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.733200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.733200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.438800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.438800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<56.438800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.438800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.845200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<56.438800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.845200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.845200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<56.845200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.358800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.358800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<51.358800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.358800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.765200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<51.358800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.765200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.765200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<51.765200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.317400,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.317400,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<50.317400,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.317400,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.749200,0.000000,8.890000>}
box{<0,0,-0.101600><0.431800,0.036000,0.101600> rotate<0,0.000000,0> translate<50.317400,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.749200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.749200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<50.749200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.374800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.765200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<51.765200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.358800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.749200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<50.749200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.317400,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.733200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,0.000000,0> translate<49.733200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.877200,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.877200,0.000000,1.676400>}
box{<0,0,-0.101600><6.629400,0.036000,0.101600> rotate<0,-90.000000,0> translate<58.877200,0.000000,1.676400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.877200,0.000000,1.676400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.277000,0.000000,1.676400>}
box{<0,0,-0.101600><1.600200,0.036000,0.101600> rotate<0,0.000000,0> translate<57.277000,0.000000,1.676400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.277000,0.000000,1.676400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.277000,0.000000,0.584200>}
box{<0,0,-0.101600><1.092200,0.036000,0.101600> rotate<0,-90.000000,0> translate<57.277000,0.000000,0.584200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.851800,0.000000,1.625600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.851800,0.000000,0.584200>}
box{<0,0,-0.127000><1.041400,0.036000,0.127000> rotate<0,-90.000000,0> translate<58.851800,0.000000,0.584200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.851800,0.000000,0.584200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.320200,0.000000,0.584200>}
box{<0,0,-0.127000><11.531600,0.036000,0.127000> rotate<0,0.000000,0> translate<47.320200,0.000000,0.584200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.320200,0.000000,0.584200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.320200,0.000000,1.651000>}
box{<0,0,-0.127000><1.066800,0.036000,0.127000> rotate<0,90.000000,0> translate<47.320200,0.000000,1.651000> }
difference{
cylinder{<53.086000,0,4.445000><53.086000,0.036000,4.445000>1.397000 translate<0,0.000000,0>}
cylinder{<53.086000,-0.1,4.445000><53.086000,0.135000,4.445000>1.143000 translate<0,0.000000,0>}}
//J3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<76.666000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.422000,0.000000,12.345000>}
box{<0,0,-0.101600><2.244000,0.036000,0.101600> rotate<0,0.000000,0> translate<74.422000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.475000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<71.882000,0.000000,12.345000>}
box{<0,0,-0.101600><0.593000,0.036000,0.101600> rotate<0,0.000000,0> translate<71.882000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.549000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.390000,0.000000,12.345000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<72.390000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.770000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.256000,0.000000,12.345000>}
box{<0,0,-0.101600><3.514000,0.036000,0.101600> rotate<0,0.000000,0> translate<61.256000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.935000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.342000,0.000000,12.345000>}
box{<0,0,-0.101600><0.593000,0.036000,0.101600> rotate<0,0.000000,0> translate<69.342000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.310000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.802000,0.000000,12.345000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<66.802000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.009000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.850000,0.000000,12.345000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<69.850000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.469000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.310000,0.000000,12.345000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<67.310000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.802000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.643000,0.000000,12.345000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<64.643000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.169800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.169800,0.000000,1.676400>}
box{<0,0,-0.101600><6.629400,0.036000,0.101600> rotate<0,-90.000000,0> translate<63.169800,0.000000,1.676400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.752200,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.720200,0.000000,8.305800>}
box{<0,0,-0.101600><2.032000,0.036000,0.101600> rotate<0,0.000000,0> translate<72.720200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.313800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<71.704200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<71.704200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<71.297800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.688200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<70.688200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.281800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.672200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<69.672200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.265800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.656200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<68.656200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.201800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.169800,0.000000,8.305800>}
box{<0,0,-0.101600><2.032000,0.036000,0.101600> rotate<0,0.000000,0> translate<63.169800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.169800,0.000000,1.676400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.770000,0.000000,1.676400>}
box{<0,0,-0.101600><1.600200,0.036000,0.101600> rotate<0,0.000000,0> translate<63.169800,0.000000,1.676400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.770000,0.000000,1.676400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<64.770000,0.000000,0.584200>}
box{<0,0,-0.101600><1.092200,0.036000,0.101600> rotate<0,-90.000000,0> translate<64.770000,0.000000,0.584200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<71.297800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<71.297800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<71.297800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<71.297800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<71.704200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<71.297800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<71.704200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<71.704200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<71.704200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.281800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.281800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<70.281800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.281800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.688200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<70.281800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.688200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.688200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<70.688200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.265800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.265800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<69.265800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.265800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.672200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<69.265800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.672200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.672200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<69.672200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.249800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.249800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<68.249800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.249800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.656200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<68.249800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.656200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.656200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<68.656200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.201800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.201800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<65.201800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.201800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.608200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<65.201800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.608200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.608200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<65.608200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.313800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.313800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<72.313800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.313800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.720200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<72.313800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.720200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.720200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<72.720200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.233800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.233800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<67.233800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.233800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.640200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<67.233800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.640200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.640200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<67.640200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.192400,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.192400,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<66.192400,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.192400,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.624200,0.000000,8.890000>}
box{<0,0,-0.101600><0.431800,0.036000,0.101600> rotate<0,0.000000,0> translate<66.192400,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.624200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.624200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<66.624200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.249800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.640200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<67.640200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<67.233800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.624200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<66.624200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<66.192400,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.608200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,0.000000,0> translate<65.608200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.752200,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.752200,0.000000,1.676400>}
box{<0,0,-0.101600><6.629400,0.036000,0.101600> rotate<0,-90.000000,0> translate<74.752200,0.000000,1.676400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.752200,0.000000,1.676400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<73.152000,0.000000,1.676400>}
box{<0,0,-0.101600><1.600200,0.036000,0.101600> rotate<0,0.000000,0> translate<73.152000,0.000000,1.676400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<73.152000,0.000000,1.676400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<73.152000,0.000000,0.584200>}
box{<0,0,-0.101600><1.092200,0.036000,0.101600> rotate<0,-90.000000,0> translate<73.152000,0.000000,0.584200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<74.726800,0.000000,1.625600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<74.726800,0.000000,0.584200>}
box{<0,0,-0.127000><1.041400,0.036000,0.127000> rotate<0,-90.000000,0> translate<74.726800,0.000000,0.584200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<74.726800,0.000000,0.584200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.195200,0.000000,0.584200>}
box{<0,0,-0.127000><11.531600,0.036000,0.127000> rotate<0,0.000000,0> translate<63.195200,0.000000,0.584200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.195200,0.000000,0.584200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.195200,0.000000,1.651000>}
box{<0,0,-0.127000><1.066800,0.036000,0.127000> rotate<0,90.000000,0> translate<63.195200,0.000000,1.651000> }
difference{
cylinder{<68.961000,0,4.445000><68.961000,0.036000,4.445000>1.397000 translate<0,0.000000,0>}
cylinder{<68.961000,-0.1,4.445000><68.961000,0.135000,4.445000>1.143000 translate<0,0.000000,0>}}
//J4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.041000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.797000,0.000000,12.345000>}
box{<0,0,-0.101600><2.244000,0.036000,0.101600> rotate<0,0.000000,0> translate<26.797000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.850000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.257000,0.000000,12.345000>}
box{<0,0,-0.101600><0.593000,0.036000,0.101600> rotate<0,0.000000,0> translate<24.257000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.924000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.765000,0.000000,12.345000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<24.765000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.145000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.631000,0.000000,12.345000>}
box{<0,0,-0.101600><3.514000,0.036000,0.101600> rotate<0,0.000000,0> translate<13.631000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.310000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.717000,0.000000,12.345000>}
box{<0,0,-0.101600><0.593000,0.036000,0.101600> rotate<0,0.000000,0> translate<21.717000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.685000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.177000,0.000000,12.345000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<19.177000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.384000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.225000,0.000000,12.345000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<22.225000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.844000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.685000,0.000000,12.345000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<19.685000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.177000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.018000,0.000000,12.345000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<17.018000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.544800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.544800,0.000000,1.676400>}
box{<0,0,-0.101600><6.629400,0.036000,0.101600> rotate<0,-90.000000,0> translate<15.544800,0.000000,1.676400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.127200,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.095200,0.000000,8.305800>}
box{<0,0,-0.101600><2.032000,0.036000,0.101600> rotate<0,0.000000,0> translate<25.095200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.688800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.079200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<24.079200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.672800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.063200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<23.063200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.656800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.047200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<22.047200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.640800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.031200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<21.031200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.576800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.544800,0.000000,8.305800>}
box{<0,0,-0.101600><2.032000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.544800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.544800,0.000000,1.676400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.145000,0.000000,1.676400>}
box{<0,0,-0.101600><1.600200,0.036000,0.101600> rotate<0,0.000000,0> translate<15.544800,0.000000,1.676400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.145000,0.000000,1.676400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.145000,0.000000,0.584200>}
box{<0,0,-0.101600><1.092200,0.036000,0.101600> rotate<0,-90.000000,0> translate<17.145000,0.000000,0.584200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.672800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.672800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<23.672800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.672800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.079200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<23.672800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.079200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.079200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<24.079200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.656800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.656800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<22.656800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.656800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.063200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<22.656800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.063200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.063200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<23.063200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.640800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.640800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<21.640800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.640800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.047200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<21.640800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.047200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.047200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<22.047200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.624800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.624800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<20.624800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.624800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.031200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<20.624800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.031200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.031200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<21.031200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.576800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.576800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<17.576800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.576800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.983200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<17.576800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.983200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.983200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<17.983200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.688800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.688800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<24.688800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.688800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.095200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<24.688800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.095200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.095200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<25.095200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.608800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.608800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<19.608800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.608800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.015200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<19.608800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.015200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.015200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<20.015200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.567400,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.567400,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<18.567400,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.567400,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.999200,0.000000,8.890000>}
box{<0,0,-0.101600><0.431800,0.036000,0.101600> rotate<0,0.000000,0> translate<18.567400,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.999200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.999200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<18.999200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.624800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.015200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<20.015200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.608800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.999200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<18.999200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.567400,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.983200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,0.000000,0> translate<17.983200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.127200,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.127200,0.000000,1.676400>}
box{<0,0,-0.101600><6.629400,0.036000,0.101600> rotate<0,-90.000000,0> translate<27.127200,0.000000,1.676400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.127200,0.000000,1.676400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.527000,0.000000,1.676400>}
box{<0,0,-0.101600><1.600200,0.036000,0.101600> rotate<0,0.000000,0> translate<25.527000,0.000000,1.676400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.527000,0.000000,1.676400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.527000,0.000000,0.584200>}
box{<0,0,-0.101600><1.092200,0.036000,0.101600> rotate<0,-90.000000,0> translate<25.527000,0.000000,0.584200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.101800,0.000000,1.625600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.101800,0.000000,0.584200>}
box{<0,0,-0.127000><1.041400,0.036000,0.127000> rotate<0,-90.000000,0> translate<27.101800,0.000000,0.584200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.101800,0.000000,0.584200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.570200,0.000000,0.584200>}
box{<0,0,-0.127000><11.531600,0.036000,0.127000> rotate<0,0.000000,0> translate<15.570200,0.000000,0.584200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.570200,0.000000,0.584200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.570200,0.000000,1.651000>}
box{<0,0,-0.127000><1.066800,0.036000,0.127000> rotate<0,90.000000,0> translate<15.570200,0.000000,1.651000> }
difference{
cylinder{<21.336000,0,4.445000><21.336000,0.036000,4.445000>1.397000 translate<0,0.000000,0>}
cylinder{<21.336000,-0.1,4.445000><21.336000,0.135000,4.445000>1.143000 translate<0,0.000000,0>}}
//J5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<92.795000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<90.551000,0.000000,12.345000>}
box{<0,0,-0.101600><2.244000,0.036000,0.101600> rotate<0,0.000000,0> translate<90.551000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.604000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.011000,0.000000,12.345000>}
box{<0,0,-0.101600><0.593000,0.036000,0.101600> rotate<0,0.000000,0> translate<88.011000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<90.678000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.519000,0.000000,12.345000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<88.519000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.899000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<77.385000,0.000000,12.345000>}
box{<0,0,-0.101600><3.514000,0.036000,0.101600> rotate<0,0.000000,0> translate<77.385000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.064000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.471000,0.000000,12.345000>}
box{<0,0,-0.101600><0.593000,0.036000,0.101600> rotate<0,0.000000,0> translate<85.471000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.439000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.931000,0.000000,12.345000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<82.931000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.138000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.979000,0.000000,12.345000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<85.979000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.598000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.439000,0.000000,12.345000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<83.439000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.931000,0.000000,12.345000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.772000,0.000000,12.345000>}
box{<0,0,-0.101600><2.159000,0.036000,0.101600> rotate<0,0.000000,0> translate<80.772000,0.000000,12.345000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.298800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.298800,0.000000,1.676400>}
box{<0,0,-0.101600><6.629400,0.036000,0.101600> rotate<0,-90.000000,0> translate<79.298800,0.000000,1.676400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<90.881200,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.849200,0.000000,8.305800>}
box{<0,0,-0.101600><2.032000,0.036000,0.101600> rotate<0,0.000000,0> translate<88.849200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.442800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.833200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<87.833200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.426800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.817200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<86.817200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.410800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.801200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<85.801200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.394800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.785200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<84.785200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.330800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.298800,0.000000,8.305800>}
box{<0,0,-0.101600><2.032000,0.036000,0.101600> rotate<0,0.000000,0> translate<79.298800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<79.298800,0.000000,1.676400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.899000,0.000000,1.676400>}
box{<0,0,-0.101600><1.600200,0.036000,0.101600> rotate<0,0.000000,0> translate<79.298800,0.000000,1.676400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.899000,0.000000,1.676400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.899000,0.000000,0.584200>}
box{<0,0,-0.101600><1.092200,0.036000,0.101600> rotate<0,-90.000000,0> translate<80.899000,0.000000,0.584200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.426800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.426800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<87.426800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.426800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.833200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<87.426800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.833200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<87.833200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<87.833200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.410800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.410800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<86.410800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.410800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.817200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<86.410800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.817200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<86.817200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<86.817200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.394800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.394800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<85.394800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.394800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.801200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<85.394800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.801200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<85.801200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<85.801200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.378800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.378800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<84.378800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.378800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.785200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<84.378800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.785200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.785200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<84.785200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.330800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.330800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<81.330800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.330800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.737200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<81.330800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.737200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.737200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<81.737200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.442800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.442800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<88.442800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.442800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.849200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<88.442800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.849200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<88.849200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<88.849200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.362800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.362800,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<83.362800,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.362800,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.769200,0.000000,8.890000>}
box{<0,0,-0.101600><0.406400,0.036000,0.101600> rotate<0,0.000000,0> translate<83.362800,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.769200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.769200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<83.769200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.321400,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.321400,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<82.321400,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.321400,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.753200,0.000000,8.890000>}
box{<0,0,-0.101600><0.431800,0.036000,0.101600> rotate<0,0.000000,0> translate<82.321400,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.753200,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.753200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,-90.000000,0> translate<82.753200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<84.378800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.769200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<83.769200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<83.362800,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.753200,0.000000,8.305800>}
box{<0,0,-0.101600><0.609600,0.036000,0.101600> rotate<0,0.000000,0> translate<82.753200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<82.321400,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<81.737200,0.000000,8.305800>}
box{<0,0,-0.101600><0.584200,0.036000,0.101600> rotate<0,0.000000,0> translate<81.737200,0.000000,8.305800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<90.881200,0.000000,8.305800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<90.881200,0.000000,1.676400>}
box{<0,0,-0.101600><6.629400,0.036000,0.101600> rotate<0,-90.000000,0> translate<90.881200,0.000000,1.676400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<90.881200,0.000000,1.676400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<89.281000,0.000000,1.676400>}
box{<0,0,-0.101600><1.600200,0.036000,0.101600> rotate<0,0.000000,0> translate<89.281000,0.000000,1.676400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<89.281000,0.000000,1.676400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<89.281000,0.000000,0.584200>}
box{<0,0,-0.101600><1.092200,0.036000,0.101600> rotate<0,-90.000000,0> translate<89.281000,0.000000,0.584200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<90.855800,0.000000,1.625600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<90.855800,0.000000,0.584200>}
box{<0,0,-0.127000><1.041400,0.036000,0.127000> rotate<0,-90.000000,0> translate<90.855800,0.000000,0.584200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<90.855800,0.000000,0.584200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<79.324200,0.000000,0.584200>}
box{<0,0,-0.127000><11.531600,0.036000,0.127000> rotate<0,0.000000,0> translate<79.324200,0.000000,0.584200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<79.324200,0.000000,0.584200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<79.324200,0.000000,1.651000>}
box{<0,0,-0.127000><1.066800,0.036000,0.127000> rotate<0,90.000000,0> translate<79.324200,0.000000,1.651000> }
difference{
cylinder{<85.090000,0,4.445000><85.090000,0.036000,4.445000>1.397000 translate<0,0.000000,0>}
cylinder{<85.090000,-0.1,4.445000><85.090000,0.135000,4.445000>1.143000 translate<0,0.000000,0>}}
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.167000,0.000000,36.576000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<66.167000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.167000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.532000,0.000000,37.211000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<65.532000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.532000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.532000,0.000000,38.481000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<65.532000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.532000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.167000,0.000000,39.116000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<65.532000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,38.481000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<68.072000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,37.211000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<67.437000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,39.116000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<67.437000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.167000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,39.116000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<66.167000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.532000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.897000,0.000000,36.576000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<64.897000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.897000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,36.576000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.627000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,37.211000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<62.992000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,38.481000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.992000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,39.116000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.992000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.897000,0.000000,39.116000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.627000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.897000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.532000,0.000000,38.481000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<64.897000,0.000000,39.116000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<66.802000,0.000000,37.846000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<64.262000,0.000000,37.846000>}
//PIEZO silk screen
difference{
cylinder{<-11.811000,0,78.740000><-11.811000,0.036000,78.740000>6.001600 translate<0,0.000000,0>}
cylinder{<-11.811000,-0.1,78.740000><-11.811000,0.135000,78.740000>5.798400 translate<0,0.000000,0>}}
difference{
cylinder{<-11.811000,0,78.740000><-11.811000,0.036000,78.740000>1.371600 translate<0,0.000000,0>}
cylinder{<-11.811000,-0.1,78.740000><-11.811000,0.135000,78.740000>1.168400 translate<0,0.000000,0>}}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.910000,0.000000,50.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.510000,0.000000,50.130000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.910000,0.000000,50.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.910000,0.000000,48.930000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.510000,0.000000,48.930000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.910000,0.000000,48.930000> }
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,27.940000>}
box{<0,0,-0.076200><20.320000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.545000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,34.290000>}
box{<0,0,-0.076200><20.320000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.545000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,27.940000>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.545000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,34.290000>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.865000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<39.370000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<41.275000,0.000000,31.115000>}
box{<0,0,-0.406400><1.905000,0.036000,0.406400> rotate<0,0.000000,0> translate<39.370000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<64.135000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.406400 translate<66.040000,0.000000,31.115000>}
box{<0,0,-0.406400><1.905000,0.036000,0.406400> rotate<0,0.000000,0> translate<64.135000,0.000000,31.115000> }
box{<-0.584200,0,-0.406400><0.584200,0.036000,0.406400> rotate<0,-0.000000,0> translate<41.960800,0.000000,31.115000>}
box{<-0.584200,0,-0.406400><0.584200,0.036000,0.406400> rotate<0,-0.000000,0> translate<63.449200,0.000000,31.115000>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.910000,0.000000,47.325000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.510000,0.000000,47.325000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.910000,0.000000,47.325000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.910000,0.000000,46.125000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.510000,0.000000,46.125000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.910000,0.000000,46.125000> }
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.286700,0.000000,9.834600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.286700,0.000000,10.434600>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.286700,0.000000,10.434600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.486700,0.000000,9.834600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.486700,0.000000,10.434600>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<8.486700,0.000000,10.434600> }
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.226000,0.000000,16.330000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<99.226000,0.000000,15.730000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<99.226000,0.000000,15.730000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.026000,0.000000,16.330000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<98.026000,0.000000,15.730000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<98.026000,0.000000,15.730000> }
//R14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.670000,0.000000,16.330000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<95.670000,0.000000,15.730000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<95.670000,0.000000,15.730000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.470000,0.000000,16.330000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<94.470000,0.000000,15.730000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<94.470000,0.000000,15.730000> }
//R15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.960700,0.000000,52.836800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.960700,0.000000,53.436800>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<65.960700,0.000000,53.436800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.160700,0.000000,52.836800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.160700,0.000000,53.436800>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<67.160700,0.000000,53.436800> }
//R16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.531700,0.000000,52.913000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.531700,0.000000,53.513000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.531700,0.000000,53.513000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.731700,0.000000,52.913000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.731700,0.000000,53.513000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<63.731700,0.000000,53.513000> }
//R17 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.978000,0.000000,41.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.578000,0.000000,41.240000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.978000,0.000000,41.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.978000,0.000000,40.040000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.578000,0.000000,40.040000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.978000,0.000000,40.040000> }
//R20 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.830000,0.000000,26.635000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.430000,0.000000,26.635000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.830000,0.000000,26.635000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.830000,0.000000,25.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.430000,0.000000,25.435000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.830000,0.000000,25.435000> }
//R21 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.830000,0.000000,31.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.430000,0.000000,31.715000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.830000,0.000000,31.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.830000,0.000000,30.515000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.430000,0.000000,30.515000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.830000,0.000000,30.515000> }
//R22 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.560000,0.000000,41.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.160000,0.000000,41.240000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.560000,0.000000,41.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.560000,0.000000,40.040000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.160000,0.000000,40.040000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.560000,0.000000,40.040000> }
//R23 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.005000,0.000000,26.635000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.605000,0.000000,26.635000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.005000,0.000000,26.635000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.005000,0.000000,25.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.605000,0.000000,25.435000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.005000,0.000000,25.435000> }
//R24 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.005000,0.000000,31.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.605000,0.000000,31.715000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.005000,0.000000,31.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.005000,0.000000,30.515000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.605000,0.000000,30.515000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.005000,0.000000,30.515000> }
//R25 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.735000,0.000000,41.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.335000,0.000000,41.240000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.735000,0.000000,41.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.735000,0.000000,40.040000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.335000,0.000000,40.040000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.735000,0.000000,40.040000> }
//S1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.954000,0.000000,2.667000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.621000,0.000000,2.667000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,0.000000,0> translate<-15.621000,0.000000,2.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.621000,0.000000,10.033000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.954000,0.000000,10.033000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,0.000000,0> translate<-15.621000,0.000000,10.033000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.954000,0.000000,10.033000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.954000,0.000000,9.779000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-12.954000,0.000000,9.779000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.954000,0.000000,9.779000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.621000,0.000000,9.779000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,0.000000,0> translate<-15.621000,0.000000,9.779000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-18.923000,0.000000,9.779000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-18.923000,0.000000,6.985000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-18.923000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.621000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.954000,0.000000,2.921000>}
box{<0,0,-0.076200><2.667000,0.036000,0.076200> rotate<0,0.000000,0> translate<-15.621000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.954000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-12.954000,0.000000,2.667000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-12.954000,0.000000,2.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-18.923000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-17.907000,0.000000,6.985000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<-18.923000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-18.923000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-18.923000,0.000000,5.715000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-18.923000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-17.907000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-17.907000,0.000000,5.715000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-17.907000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-18.923000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-17.907000,0.000000,5.715000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<-18.923000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-18.923000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-18.923000,0.000000,2.921000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-18.923000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.621000,0.000000,9.779000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.621000,0.000000,9.017000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-15.621000,0.000000,9.017000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.367000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.621000,0.000000,9.017000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<-15.621000,0.000000,9.017000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.367000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.367000,0.000000,8.255000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-15.367000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.621000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.367000,0.000000,8.255000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<-15.621000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.621000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.621000,0.000000,7.112000>}
box{<0,0,-0.076200><1.143000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-15.621000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.875000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.621000,0.000000,7.112000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<-15.875000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.875000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.875000,0.000000,5.588000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-15.875000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.621000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.875000,0.000000,5.588000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<-15.875000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.621000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.621000,0.000000,4.572000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-15.621000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.621000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.367000,0.000000,4.572000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<-15.621000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.367000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.367000,0.000000,3.683000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-15.367000,0.000000,3.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.621000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.367000,0.000000,3.683000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<-15.621000,0.000000,3.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.621000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.621000,0.000000,2.921000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-15.621000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-16.510000,0.000000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-16.510000,0.000000,7.112000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-16.510000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-16.510000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-16.891000,0.000000,5.842000>}
box{<0,0,-0.076200><1.325919,0.036000,0.076200> rotate<0,-73.295918,0> translate<-16.891000,0.000000,5.842000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-16.510000,0.000000,5.842000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-16.510000,0.000000,4.699000>}
box{<0,0,-0.076200><1.143000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-16.510000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-16.891000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-17.272000,0.000000,6.350000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<-17.272000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-17.272000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-17.272000,0.000000,6.350000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-17.272000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-17.272000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-17.272000,0.000000,6.096000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<-17.272000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-16.129000,0.000000,9.779000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-17.653000,0.000000,9.779000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<-17.653000,0.000000,9.779000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-16.129000,0.000000,9.779000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.621000,0.000000,9.779000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<-16.129000,0.000000,9.779000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-17.653000,0.000000,9.779000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-18.923000,0.000000,9.779000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<-18.923000,0.000000,9.779000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-17.653000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-18.923000,0.000000,2.921000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<-18.923000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-16.129000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-17.653000,0.000000,2.921000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<-17.653000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-16.129000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<-15.621000,0.000000,2.921000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<-16.129000,0.000000,2.921000> }
//TP1 silk screen
//TP2 silk screen
//TP3 silk screen
//TP4 silk screen
//TP5 silk screen
//TP6 silk screen
//TP7 silk screen
//TP8 silk screen
//TP9 silk screen
//TP10 silk screen
//TP11 silk screen
//TP12 silk screen
//TP13 silk screen
//U$1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-12.700000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-12.700000,0.000000,71.120000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,90.000000,0> translate<-12.700000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-12.700000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.820000,0.000000,71.120000>}
box{<0,0,-0.063500><96.520000,0.036000,0.063500> rotate<0,0.000000,0> translate<-12.700000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.820000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<86.360000,0.000000,68.580000>}
box{<0,0,-0.063500><3.592102,0.036000,0.063500> rotate<0,44.997030,0> translate<83.820000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<86.360000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<86.360000,0.000000,58.420000>}
box{<0,0,-0.063500><10.160000,0.036000,0.063500> rotate<0,-90.000000,0> translate<86.360000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<86.360000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<88.900000,0.000000,55.880000>}
box{<0,0,-0.063500><3.592102,0.036000,0.063500> rotate<0,44.997030,0> translate<86.360000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<88.900000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<88.900000,0.000000,21.590000>}
box{<0,0,-0.063500><34.290000,0.036000,0.063500> rotate<0,-90.000000,0> translate<88.900000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<88.900000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<86.360000,0.000000,19.050000>}
box{<0,0,-0.063500><3.592102,0.036000,0.063500> rotate<0,-44.997030,0> translate<86.360000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<86.360000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<86.360000,0.000000,17.780000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<86.360000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<86.360000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-12.700000,0.000000,17.780000>}
box{<0,0,-0.063500><99.060000,0.036000,0.063500> rotate<0,0.000000,0> translate<-12.700000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-14.605000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-0.635000,0.000000,20.955000>}
box{<0,0,-0.063500><13.970000,0.036000,0.063500> rotate<0,0.000000,0> translate<-14.605000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-0.635000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-0.635000,0.000000,29.845000>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,90.000000,0> translate<-0.635000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-0.635000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-14.605000,0.000000,29.845000>}
box{<0,0,-0.063500><13.970000,0.036000,0.063500> rotate<0,0.000000,0> translate<-14.605000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-14.605000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-14.605000,0.000000,20.955000>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,-90.000000,0> translate<-14.605000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-19.050000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-3.175000,0.000000,50.165000>}
box{<0,0,-0.063500><15.875000,0.036000,0.063500> rotate<0,0.000000,0> translate<-19.050000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-3.175000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-3.175000,0.000000,61.595000>}
box{<0,0,-0.063500><11.430000,0.036000,0.063500> rotate<0,90.000000,0> translate<-3.175000,0.000000,61.595000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-3.175000,0.000000,61.595000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-19.050000,0.000000,61.595000>}
box{<0,0,-0.063500><15.875000,0.036000,0.063500> rotate<0,0.000000,0> translate<-19.050000,0.000000,61.595000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-19.050000,0.000000,61.595000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-19.050000,0.000000,50.165000>}
box{<0,0,-0.063500><11.430000,0.036000,0.063500> rotate<0,-90.000000,0> translate<-19.050000,0.000000,50.165000> }
//U$2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-18.810000,0.000000,47.655000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-18.810000,0.000000,19.655000>}
box{<0,0,-0.063500><28.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<-18.810000,0.000000,19.655000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-18.810000,0.000000,19.655000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.690000,0.000000,19.655000>}
box{<0,0,-0.063500><30.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<-18.810000,0.000000,19.655000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.690000,0.000000,19.655000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.690000,0.000000,47.655000>}
box{<0,0,-0.063500><28.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<11.690000,0.000000,47.655000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.690000,0.000000,47.655000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<-18.810000,0.000000,47.655000>}
box{<0,0,-0.063500><30.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<-18.810000,0.000000,47.655000> }
//U$4 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<3.810000,0.000000,81.915000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<3.810000,0.000000,81.915000>}
difference{
cylinder{<3.810000,0,81.915000><3.810000,0.036000,81.915000>3.505200 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,81.915000><3.810000,0.135000,81.915000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<3.810000,0,81.915000><3.810000,0.036000,81.915000>0.990600 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,81.915000><3.810000,0.135000,81.915000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<3.810000,0,81.915000><3.810000,0.036000,81.915000>1.701600 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,81.915000><3.810000,0.135000,81.915000>1.498400 translate<0,0.000000,0>}}
//U$5 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<96.810000,0.000000,81.915000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<96.810000,0.000000,81.915000>}
difference{
cylinder{<96.810000,0,81.915000><96.810000,0.036000,81.915000>3.505200 translate<0,0.000000,0>}
cylinder{<96.810000,-0.1,81.915000><96.810000,0.135000,81.915000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<96.810000,0,81.915000><96.810000,0.036000,81.915000>0.990600 translate<0,0.000000,0>}
cylinder{<96.810000,-0.1,81.915000><96.810000,0.135000,81.915000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<96.810000,0,81.915000><96.810000,0.036000,81.915000>1.701600 translate<0,0.000000,0>}
cylinder{<96.810000,-0.1,81.915000><96.810000,0.135000,81.915000>1.498400 translate<0,0.000000,0>}}
//U$6 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<96.810000,0.000000,3.915000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<96.810000,0.000000,3.915000>}
difference{
cylinder{<96.810000,0,3.915000><96.810000,0.036000,3.915000>3.505200 translate<0,0.000000,0>}
cylinder{<96.810000,-0.1,3.915000><96.810000,0.135000,3.915000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<96.810000,0,3.915000><96.810000,0.036000,3.915000>0.990600 translate<0,0.000000,0>}
cylinder{<96.810000,-0.1,3.915000><96.810000,0.135000,3.915000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<96.810000,0,3.915000><96.810000,0.036000,3.915000>1.701600 translate<0,0.000000,0>}
cylinder{<96.810000,-0.1,3.915000><96.810000,0.135000,3.915000>1.498400 translate<0,0.000000,0>}}
//U$7 silk screen
object{ARC(2.159000,2.489200,180.000000,270.000000,0.036000) translate<3.810000,0.000000,3.915000>}
object{ARC(2.159000,2.489200,0.000000,90.000000,0.036000) translate<3.810000,0.000000,3.915000>}
difference{
cylinder{<3.810000,0,3.915000><3.810000,0.036000,3.915000>3.505200 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,3.915000><3.810000,0.135000,3.915000>3.352800 translate<0,0.000000,0>}}
difference{
cylinder{<3.810000,0,3.915000><3.810000,0.036000,3.915000>0.990600 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,3.915000><3.810000,0.135000,3.915000>0.533400 translate<0,0.000000,0>}}
difference{
cylinder{<3.810000,0,3.915000><3.810000,0.036000,3.915000>1.701600 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,3.915000><3.810000,0.135000,3.915000>1.498400 translate<0,0.000000,0>}}
//X-AXIS silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<90.170000,0.000000,78.105000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.470000,0.000000,78.105000>}
box{<0,0,-0.063500><12.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<77.470000,0.000000,78.105000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.470000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.470000,0.000000,78.105000>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,-90.000000,0> translate<77.470000,0.000000,78.105000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<90.170000,0.000000,78.105000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<90.170000,0.000000,84.455000>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,90.000000,0> translate<90.170000,0.000000,84.455000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<91.440000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<90.170000,0.000000,76.835000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<90.170000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.200000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.200000,0.000000,76.835000>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,-90.000000,0> translate<76.200000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<91.440000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<91.440000,0.000000,85.725000>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,90.000000,0> translate<91.440000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.788000,0.000000,83.693000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.788000,0.000000,84.455000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,90.000000,0> translate<81.788000,0.000000,84.455000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.788000,0.000000,83.693000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.852000,0.000000,83.693000>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<81.788000,0.000000,83.693000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.852000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.852000,0.000000,83.693000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,-90.000000,0> translate<85.852000,0.000000,83.693000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.852000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<90.170000,0.000000,84.455000>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<85.852000,0.000000,84.455000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.852000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.852000,0.000000,84.709000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<85.852000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.470000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.470000,0.000000,76.581000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<77.470000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.470000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.740000,0.000000,76.581000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<77.470000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.740000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.740000,0.000000,76.581000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<78.740000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.470000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.200000,0.000000,76.835000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<76.200000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.185000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<84.455000,0.000000,76.581000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<83.185000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.185000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.185000,0.000000,76.835000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<83.185000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.185000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.740000,0.000000,76.835000>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,0.000000,0> translate<78.740000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<84.455000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<84.455000,0.000000,76.835000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<84.455000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<88.900000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<90.170000,0.000000,76.581000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<88.900000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<90.170000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<90.170000,0.000000,76.835000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<90.170000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<88.900000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<88.900000,0.000000,76.835000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<88.900000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<88.900000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<84.455000,0.000000,76.835000>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,0.000000,0> translate<84.455000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.200000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.788000,0.000000,85.725000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,0.000000,0> translate<76.200000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.788000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.852000,0.000000,85.725000>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<81.788000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.470000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.788000,0.000000,84.455000>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<77.470000,0.000000,84.455000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.788000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.788000,0.000000,84.709000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<81.788000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.788000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.788000,0.000000,85.725000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<81.788000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<81.788000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<77.216000,0.000000,84.709000>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<77.216000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<77.216000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<77.216000,0.000000,77.851000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,-90.000000,0> translate<77.216000,0.000000,77.851000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<77.216000,0.000000,77.851000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<90.424000,0.000000,77.851000>}
box{<0,0,-0.025400><13.208000,0.036000,0.025400> rotate<0,0.000000,0> translate<77.216000,0.000000,77.851000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<90.424000,0.000000,77.851000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<90.424000,0.000000,84.709000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,90.000000,0> translate<90.424000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<90.424000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<85.852000,0.000000,84.709000>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<85.852000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.852000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.852000,0.000000,85.725000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<85.852000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.852000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<86.360000,0.000000,85.725000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,0.000000,0> translate<85.852000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<86.360000,0.000000,85.598000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<86.360000,0.000000,85.725000>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,90.000000,0> translate<86.360000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<86.360000,0.000000,85.598000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<87.630000,0.000000,85.598000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<86.360000,0.000000,85.598000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<87.630000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<87.630000,0.000000,85.598000>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,-90.000000,0> translate<87.630000,0.000000,85.598000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<87.630000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<91.440000,0.000000,85.725000>}
box{<0,0,-0.063500><3.810000,0.036000,0.063500> rotate<0,0.000000,0> translate<87.630000,0.000000,85.725000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<83.820000,0.000000,80.010000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<86.360000,0.000000,80.010000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<81.280000,0.000000,80.010000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<83.820000,0.000000,82.550000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<86.360000,0.000000,82.550000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<81.280000,0.000000,82.550000>}
//X-MAX silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.684500,0.000000,66.294000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<9.969500,0.000000,66.294000>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,0.000000,0> translate<9.969500,0.000000,66.294000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<9.969500,0.000000,66.294000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<9.969500,0.000000,53.594000>}
box{<0,0,-0.127000><12.700000,0.036000,0.127000> rotate<0,-90.000000,0> translate<9.969500,0.000000,53.594000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<9.969500,0.000000,53.594000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.684500,0.000000,53.594000>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,0.000000,0> translate<9.969500,0.000000,53.594000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.684500,0.000000,53.594000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.684500,0.000000,56.451500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,90.000000,0> translate<15.684500,0.000000,56.451500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.684500,0.000000,56.451500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.637000,0.000000,56.451500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,0.000000,0> translate<15.684500,0.000000,56.451500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.637000,0.000000,56.451500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.637000,0.000000,63.436500>}
box{<0,0,-0.127000><6.985000,0.036000,0.127000> rotate<0,90.000000,0> translate<16.637000,0.000000,63.436500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.637000,0.000000,63.436500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.684500,0.000000,63.436500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,0.000000,0> translate<15.684500,0.000000,63.436500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.684500,0.000000,63.436500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.684500,0.000000,66.294000>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,90.000000,0> translate<15.684500,0.000000,66.294000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.604500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.049500,0.000000,54.229000>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,0.000000,0> translate<10.604500,0.000000,54.229000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.604500,0.000000,65.659000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.049500,0.000000,65.659000>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,0.000000,0> translate<10.604500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.604500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.604500,0.000000,65.659000>}
box{<0,0,-0.025400><11.430000,0.036000,0.025400> rotate<0,90.000000,0> translate<10.604500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.049500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.049500,0.000000,57.086500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,90.000000,0> translate<15.049500,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.049500,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.049500,0.000000,62.801500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,90.000000,0> translate<15.049500,0.000000,62.801500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.049500,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.049500,0.000000,65.659000>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,90.000000,0> translate<15.049500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.002000,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.002000,0.000000,57.086500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,-90.000000,0> translate<16.002000,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.049500,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.002000,0.000000,57.086500>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,0.000000,0> translate<15.049500,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<15.049500,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.002000,0.000000,62.801500>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,0.000000,0> translate<15.049500,0.000000,62.801500> }
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<12.827000,0.000000,58.674000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<12.827000,0.000000,56.134000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<12.827000,0.000000,63.754000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<12.827000,0.000000,61.214000>}
//X-MIN silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.667500,0.000000,66.294000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.952500,0.000000,66.294000>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,0.000000,0> translate<0.952500,0.000000,66.294000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.952500,0.000000,66.294000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.952500,0.000000,53.594000>}
box{<0,0,-0.127000><12.700000,0.036000,0.127000> rotate<0,-90.000000,0> translate<0.952500,0.000000,53.594000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.952500,0.000000,53.594000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.667500,0.000000,53.594000>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,0.000000,0> translate<0.952500,0.000000,53.594000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.667500,0.000000,53.594000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.667500,0.000000,56.451500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,90.000000,0> translate<6.667500,0.000000,56.451500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.667500,0.000000,56.451500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<7.620000,0.000000,56.451500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,0.000000,0> translate<6.667500,0.000000,56.451500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<7.620000,0.000000,56.451500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<7.620000,0.000000,63.436500>}
box{<0,0,-0.127000><6.985000,0.036000,0.127000> rotate<0,90.000000,0> translate<7.620000,0.000000,63.436500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<7.620000,0.000000,63.436500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.667500,0.000000,63.436500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,0.000000,0> translate<6.667500,0.000000,63.436500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.667500,0.000000,63.436500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.667500,0.000000,66.294000>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,90.000000,0> translate<6.667500,0.000000,66.294000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<1.587500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.032500,0.000000,54.229000>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,0.000000,0> translate<1.587500,0.000000,54.229000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<1.587500,0.000000,65.659000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.032500,0.000000,65.659000>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,0.000000,0> translate<1.587500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<1.587500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<1.587500,0.000000,65.659000>}
box{<0,0,-0.025400><11.430000,0.036000,0.025400> rotate<0,90.000000,0> translate<1.587500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.032500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.032500,0.000000,57.086500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,90.000000,0> translate<6.032500,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.032500,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.032500,0.000000,62.801500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,90.000000,0> translate<6.032500,0.000000,62.801500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.032500,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.032500,0.000000,65.659000>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,90.000000,0> translate<6.032500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.985000,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.985000,0.000000,57.086500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,-90.000000,0> translate<6.985000,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.032500,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.985000,0.000000,57.086500>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,0.000000,0> translate<6.032500,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.032500,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.985000,0.000000,62.801500>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,0.000000,0> translate<6.032500,0.000000,62.801500> }
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<3.810000,0.000000,58.674000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<3.810000,0.000000,56.134000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<3.810000,0.000000,63.754000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<3.810000,0.000000,61.214000>}
//X1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<92.020000,0.000000,30.570000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<92.020000,0.000000,73.570000>}
box{<0,0,-0.127000><43.000000,0.036000,0.127000> rotate<0,90.000000,0> translate<92.020000,0.000000,73.570000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<92.020000,0.000000,73.570000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<98.720000,0.000000,73.570000>}
box{<0,0,-0.127000><6.700000,0.036000,0.127000> rotate<0,0.000000,0> translate<92.020000,0.000000,73.570000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<99.820000,0.000000,73.570000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.420000,0.000000,73.570000>}
box{<0,0,-0.127000><1.600000,0.036000,0.127000> rotate<0,0.000000,0> translate<99.820000,0.000000,73.570000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.420000,0.000000,73.570000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.420000,0.000000,30.570000>}
box{<0,0,-0.127000><43.000000,0.036000,0.127000> rotate<0,-90.000000,0> translate<101.420000,0.000000,30.570000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<101.420000,0.000000,30.570000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<92.020000,0.000000,30.570000>}
box{<0,0,-0.127000><9.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<92.020000,0.000000,30.570000> }
object{ARC(1.664300,0.254000,122.735226,237.264774,0.036000) translate<94.220000,0.000000,28.470000>}
object{ARC(1.664300,0.254000,302.735226,417.264774,0.036000) translate<94.220000,0.000000,28.470000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<93.320000,0.000000,27.070000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<95.120000,0.000000,27.070000>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,0.000000,0> translate<93.320000,0.000000,27.070000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<93.220000,0.000000,29.770000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<93.220000,0.000000,30.470000>}
box{<0,0,-0.127000><0.700000,0.036000,0.127000> rotate<0,90.000000,0> translate<93.220000,0.000000,30.470000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<95.220000,0.000000,29.770000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<95.220000,0.000000,30.470000>}
box{<0,0,-0.127000><0.700000,0.036000,0.127000> rotate<0,90.000000,0> translate<95.220000,0.000000,30.470000> }
object{ARC(1.664300,0.254000,302.735226,417.264774,0.036000) translate<94.220000,0.000000,75.670000>}
object{ARC(1.664300,0.254000,122.735226,237.264774,0.036000) translate<94.220000,0.000000,75.670000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<95.120000,0.000000,77.070000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<93.320000,0.000000,77.070000>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,0.000000,0> translate<93.320000,0.000000,77.070000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<95.220000,0.000000,74.370000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<95.220000,0.000000,73.670000>}
box{<0,0,-0.127000><0.700000,0.036000,0.127000> rotate<0,-90.000000,0> translate<95.220000,0.000000,73.670000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<93.220000,0.000000,74.370000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<93.220000,0.000000,73.670000>}
box{<0,0,-0.127000><0.700000,0.036000,0.127000> rotate<0,-90.000000,0> translate<93.220000,0.000000,73.670000> }
object{ARC(0.550000,0.254000,0.000000,180.000000,0.036000) translate<99.270000,0.000000,73.570000>}
//Y-AXIS silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.660000,0.000000,78.105000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.960000,0.000000,78.105000>}
box{<0,0,-0.063500><12.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<60.960000,0.000000,78.105000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.960000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.960000,0.000000,78.105000>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,-90.000000,0> translate<60.960000,0.000000,78.105000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.660000,0.000000,78.105000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.660000,0.000000,84.455000>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,90.000000,0> translate<73.660000,0.000000,84.455000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.930000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.660000,0.000000,76.835000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<73.660000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.690000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.690000,0.000000,76.835000>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,-90.000000,0> translate<59.690000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.930000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.930000,0.000000,85.725000>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,90.000000,0> translate<74.930000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.278000,0.000000,83.693000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.278000,0.000000,84.455000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,90.000000,0> translate<65.278000,0.000000,84.455000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.278000,0.000000,83.693000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.342000,0.000000,83.693000>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<65.278000,0.000000,83.693000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.342000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.342000,0.000000,83.693000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,-90.000000,0> translate<69.342000,0.000000,83.693000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.342000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.660000,0.000000,84.455000>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<69.342000,0.000000,84.455000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.342000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.342000,0.000000,84.709000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<69.342000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.960000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.960000,0.000000,76.581000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<60.960000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.960000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.230000,0.000000,76.581000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<60.960000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.230000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.230000,0.000000,76.581000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<62.230000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.960000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.690000,0.000000,76.835000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<59.690000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.675000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.945000,0.000000,76.581000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<66.675000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.675000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.675000,0.000000,76.835000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<66.675000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.675000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.230000,0.000000,76.835000>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,0.000000,0> translate<62.230000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.945000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.945000,0.000000,76.835000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<67.945000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.390000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.660000,0.000000,76.581000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<72.390000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.660000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.660000,0.000000,76.835000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<73.660000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.390000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.390000,0.000000,76.835000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<72.390000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.390000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.945000,0.000000,76.835000>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,0.000000,0> translate<67.945000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.690000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.278000,0.000000,85.725000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,0.000000,0> translate<59.690000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.278000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.342000,0.000000,85.725000>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<65.278000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.960000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.278000,0.000000,84.455000>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<60.960000,0.000000,84.455000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.278000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.278000,0.000000,84.709000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<65.278000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.278000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.278000,0.000000,85.725000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<65.278000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<65.278000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.706000,0.000000,84.709000>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<60.706000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.706000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.706000,0.000000,77.851000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,-90.000000,0> translate<60.706000,0.000000,77.851000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.706000,0.000000,77.851000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<73.914000,0.000000,77.851000>}
box{<0,0,-0.025400><13.208000,0.036000,0.025400> rotate<0,0.000000,0> translate<60.706000,0.000000,77.851000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<73.914000,0.000000,77.851000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<73.914000,0.000000,84.709000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,90.000000,0> translate<73.914000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<73.914000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<69.342000,0.000000,84.709000>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<69.342000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.342000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.342000,0.000000,85.725000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<69.342000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.342000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.850000,0.000000,85.725000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,0.000000,0> translate<69.342000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.850000,0.000000,85.598000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.850000,0.000000,85.725000>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,90.000000,0> translate<69.850000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<69.850000,0.000000,85.598000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.120000,0.000000,85.598000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<69.850000,0.000000,85.598000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.120000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.120000,0.000000,85.598000>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,-90.000000,0> translate<71.120000,0.000000,85.598000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.120000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.930000,0.000000,85.725000>}
box{<0,0,-0.063500><3.810000,0.036000,0.063500> rotate<0,0.000000,0> translate<71.120000,0.000000,85.725000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<67.310000,0.000000,80.010000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<69.850000,0.000000,80.010000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<64.770000,0.000000,80.010000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<67.310000,0.000000,82.550000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<69.850000,0.000000,82.550000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<64.770000,0.000000,82.550000>}
//Y-MAX silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.718500,0.000000,66.294000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.003500,0.000000,66.294000>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,0.000000,0> translate<28.003500,0.000000,66.294000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.003500,0.000000,66.294000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.003500,0.000000,53.594000>}
box{<0,0,-0.127000><12.700000,0.036000,0.127000> rotate<0,-90.000000,0> translate<28.003500,0.000000,53.594000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.003500,0.000000,53.594000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.718500,0.000000,53.594000>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,0.000000,0> translate<28.003500,0.000000,53.594000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.718500,0.000000,53.594000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.718500,0.000000,56.451500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,90.000000,0> translate<33.718500,0.000000,56.451500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.718500,0.000000,56.451500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.671000,0.000000,56.451500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,0.000000,0> translate<33.718500,0.000000,56.451500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.671000,0.000000,56.451500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.671000,0.000000,63.436500>}
box{<0,0,-0.127000><6.985000,0.036000,0.127000> rotate<0,90.000000,0> translate<34.671000,0.000000,63.436500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.671000,0.000000,63.436500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.718500,0.000000,63.436500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,0.000000,0> translate<33.718500,0.000000,63.436500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.718500,0.000000,63.436500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.718500,0.000000,66.294000>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,90.000000,0> translate<33.718500,0.000000,66.294000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.638500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<33.083500,0.000000,54.229000>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,0.000000,0> translate<28.638500,0.000000,54.229000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.638500,0.000000,65.659000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<33.083500,0.000000,65.659000>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,0.000000,0> translate<28.638500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.638500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<28.638500,0.000000,65.659000>}
box{<0,0,-0.025400><11.430000,0.036000,0.025400> rotate<0,90.000000,0> translate<28.638500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<33.083500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<33.083500,0.000000,57.086500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,90.000000,0> translate<33.083500,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<33.083500,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<33.083500,0.000000,62.801500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,90.000000,0> translate<33.083500,0.000000,62.801500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<33.083500,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<33.083500,0.000000,65.659000>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,90.000000,0> translate<33.083500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<34.036000,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<34.036000,0.000000,57.086500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,-90.000000,0> translate<34.036000,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<33.083500,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<34.036000,0.000000,57.086500>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,0.000000,0> translate<33.083500,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<33.083500,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<34.036000,0.000000,62.801500>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,0.000000,0> translate<33.083500,0.000000,62.801500> }
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<30.861000,0.000000,58.674000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<30.861000,0.000000,56.134000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<30.861000,0.000000,63.754000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<30.861000,0.000000,61.214000>}
//Y-MIN silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.701500,0.000000,66.294000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.986500,0.000000,66.294000>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,0.000000,0> translate<18.986500,0.000000,66.294000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.986500,0.000000,66.294000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.986500,0.000000,53.594000>}
box{<0,0,-0.127000><12.700000,0.036000,0.127000> rotate<0,-90.000000,0> translate<18.986500,0.000000,53.594000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.986500,0.000000,53.594000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.701500,0.000000,53.594000>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,0.000000,0> translate<18.986500,0.000000,53.594000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.701500,0.000000,53.594000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.701500,0.000000,56.451500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,90.000000,0> translate<24.701500,0.000000,56.451500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.701500,0.000000,56.451500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.654000,0.000000,56.451500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,0.000000,0> translate<24.701500,0.000000,56.451500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.654000,0.000000,56.451500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.654000,0.000000,63.436500>}
box{<0,0,-0.127000><6.985000,0.036000,0.127000> rotate<0,90.000000,0> translate<25.654000,0.000000,63.436500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.654000,0.000000,63.436500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.701500,0.000000,63.436500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,0.000000,0> translate<24.701500,0.000000,63.436500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.701500,0.000000,63.436500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.701500,0.000000,66.294000>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,90.000000,0> translate<24.701500,0.000000,66.294000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.621500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.066500,0.000000,54.229000>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,0.000000,0> translate<19.621500,0.000000,54.229000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.621500,0.000000,65.659000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.066500,0.000000,65.659000>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,0.000000,0> translate<19.621500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.621500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.621500,0.000000,65.659000>}
box{<0,0,-0.025400><11.430000,0.036000,0.025400> rotate<0,90.000000,0> translate<19.621500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.066500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.066500,0.000000,57.086500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,90.000000,0> translate<24.066500,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.066500,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.066500,0.000000,62.801500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,90.000000,0> translate<24.066500,0.000000,62.801500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.066500,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.066500,0.000000,65.659000>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,90.000000,0> translate<24.066500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.019000,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.019000,0.000000,57.086500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,-90.000000,0> translate<25.019000,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.066500,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.019000,0.000000,57.086500>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,0.000000,0> translate<24.066500,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<24.066500,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<25.019000,0.000000,62.801500>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,0.000000,0> translate<24.066500,0.000000,62.801500> }
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<21.844000,0.000000,58.674000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<21.844000,0.000000,56.134000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<21.844000,0.000000,63.754000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<21.844000,0.000000,61.214000>}
//Z-AXIS silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,78.105000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,78.105000>}
box{<0,0,-0.063500><12.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<44.450000,0.000000,78.105000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,78.105000>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,-90.000000,0> translate<44.450000,0.000000,78.105000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,78.105000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,84.455000>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,90.000000,0> translate<57.150000,0.000000,84.455000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.420000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,76.835000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<57.150000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.180000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.180000,0.000000,76.835000>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,-90.000000,0> translate<43.180000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.420000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.420000,0.000000,85.725000>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,90.000000,0> translate<58.420000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.768000,0.000000,83.693000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.768000,0.000000,84.455000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,90.000000,0> translate<48.768000,0.000000,84.455000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.768000,0.000000,83.693000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.832000,0.000000,83.693000>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<48.768000,0.000000,83.693000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.832000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.832000,0.000000,83.693000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,-90.000000,0> translate<52.832000,0.000000,83.693000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.832000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,84.455000>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<52.832000,0.000000,84.455000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.832000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.832000,0.000000,84.709000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<52.832000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,76.581000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<44.450000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.720000,0.000000,76.581000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<44.450000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.720000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.720000,0.000000,76.581000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,-90.000000,0> translate<45.720000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.180000,0.000000,76.835000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<43.180000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.165000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.435000,0.000000,76.581000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<50.165000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.165000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.165000,0.000000,76.835000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<50.165000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.165000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.720000,0.000000,76.835000>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,0.000000,0> translate<45.720000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.435000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.435000,0.000000,76.835000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<51.435000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.880000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,76.581000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<55.880000,0.000000,76.581000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,76.835000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<57.150000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.880000,0.000000,76.581000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.880000,0.000000,76.835000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<55.880000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.880000,0.000000,76.835000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.435000,0.000000,76.835000>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,0.000000,0> translate<51.435000,0.000000,76.835000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.180000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.768000,0.000000,85.725000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,0.000000,0> translate<43.180000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.768000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.832000,0.000000,85.725000>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<48.768000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.768000,0.000000,84.455000>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,0.000000,0> translate<44.450000,0.000000,84.455000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.768000,0.000000,84.455000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.768000,0.000000,84.709000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,90.000000,0> translate<48.768000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.768000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.768000,0.000000,85.725000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<48.768000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<48.768000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<44.196000,0.000000,84.709000>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<44.196000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<44.196000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<44.196000,0.000000,77.851000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,-90.000000,0> translate<44.196000,0.000000,77.851000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<44.196000,0.000000,77.851000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.404000,0.000000,77.851000>}
box{<0,0,-0.025400><13.208000,0.036000,0.025400> rotate<0,0.000000,0> translate<44.196000,0.000000,77.851000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.404000,0.000000,77.851000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.404000,0.000000,84.709000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,90.000000,0> translate<57.404000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.404000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.832000,0.000000,84.709000>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,0.000000,0> translate<52.832000,0.000000,84.709000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.832000,0.000000,84.709000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.832000,0.000000,85.725000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<52.832000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.832000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.340000,0.000000,85.725000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,0.000000,0> translate<52.832000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.340000,0.000000,85.598000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.340000,0.000000,85.725000>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,90.000000,0> translate<53.340000,0.000000,85.725000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.340000,0.000000,85.598000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.610000,0.000000,85.598000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<53.340000,0.000000,85.598000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.610000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.610000,0.000000,85.598000>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,-90.000000,0> translate<54.610000,0.000000,85.598000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.610000,0.000000,85.725000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.420000,0.000000,85.725000>}
box{<0,0,-0.063500><3.810000,0.036000,0.063500> rotate<0,0.000000,0> translate<54.610000,0.000000,85.725000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<50.800000,0.000000,80.010000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<53.340000,0.000000,80.010000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<48.260000,0.000000,80.010000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<50.800000,0.000000,82.550000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<53.340000,0.000000,82.550000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<48.260000,0.000000,82.550000>}
//Z-MAX silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.006500,0.000000,66.294000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.291500,0.000000,66.294000>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,0.000000,0> translate<46.291500,0.000000,66.294000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.291500,0.000000,66.294000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.291500,0.000000,53.594000>}
box{<0,0,-0.127000><12.700000,0.036000,0.127000> rotate<0,-90.000000,0> translate<46.291500,0.000000,53.594000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.291500,0.000000,53.594000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.006500,0.000000,53.594000>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,0.000000,0> translate<46.291500,0.000000,53.594000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.006500,0.000000,53.594000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.006500,0.000000,56.451500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,90.000000,0> translate<52.006500,0.000000,56.451500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.006500,0.000000,56.451500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.959000,0.000000,56.451500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,0.000000,0> translate<52.006500,0.000000,56.451500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.959000,0.000000,56.451500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.959000,0.000000,63.436500>}
box{<0,0,-0.127000><6.985000,0.036000,0.127000> rotate<0,90.000000,0> translate<52.959000,0.000000,63.436500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.959000,0.000000,63.436500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.006500,0.000000,63.436500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,0.000000,0> translate<52.006500,0.000000,63.436500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.006500,0.000000,63.436500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.006500,0.000000,66.294000>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,90.000000,0> translate<52.006500,0.000000,66.294000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<46.926500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.371500,0.000000,54.229000>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,0.000000,0> translate<46.926500,0.000000,54.229000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<46.926500,0.000000,65.659000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.371500,0.000000,65.659000>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,0.000000,0> translate<46.926500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<46.926500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<46.926500,0.000000,65.659000>}
box{<0,0,-0.025400><11.430000,0.036000,0.025400> rotate<0,90.000000,0> translate<46.926500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.371500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.371500,0.000000,57.086500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,90.000000,0> translate<51.371500,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.371500,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.371500,0.000000,62.801500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,90.000000,0> translate<51.371500,0.000000,62.801500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.371500,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.371500,0.000000,65.659000>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,90.000000,0> translate<51.371500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.324000,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.324000,0.000000,57.086500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,-90.000000,0> translate<52.324000,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.371500,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.324000,0.000000,57.086500>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,0.000000,0> translate<51.371500,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.371500,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.324000,0.000000,62.801500>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,0.000000,0> translate<51.371500,0.000000,62.801500> }
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<49.149000,0.000000,58.674000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<49.149000,0.000000,56.134000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<49.149000,0.000000,63.754000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<49.149000,0.000000,61.214000>}
//Z-MIN silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.989500,0.000000,66.294000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.274500,0.000000,66.294000>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,0.000000,0> translate<37.274500,0.000000,66.294000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.274500,0.000000,66.294000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.274500,0.000000,53.594000>}
box{<0,0,-0.127000><12.700000,0.036000,0.127000> rotate<0,-90.000000,0> translate<37.274500,0.000000,53.594000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.274500,0.000000,53.594000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.989500,0.000000,53.594000>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,0.000000,0> translate<37.274500,0.000000,53.594000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.989500,0.000000,53.594000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.989500,0.000000,56.451500>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,90.000000,0> translate<42.989500,0.000000,56.451500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.989500,0.000000,56.451500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.942000,0.000000,56.451500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,0.000000,0> translate<42.989500,0.000000,56.451500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.942000,0.000000,56.451500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.942000,0.000000,63.436500>}
box{<0,0,-0.127000><6.985000,0.036000,0.127000> rotate<0,90.000000,0> translate<43.942000,0.000000,63.436500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.942000,0.000000,63.436500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.989500,0.000000,63.436500>}
box{<0,0,-0.127000><0.952500,0.036000,0.127000> rotate<0,0.000000,0> translate<42.989500,0.000000,63.436500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.989500,0.000000,63.436500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.989500,0.000000,66.294000>}
box{<0,0,-0.127000><2.857500,0.036000,0.127000> rotate<0,90.000000,0> translate<42.989500,0.000000,66.294000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<37.909500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<42.354500,0.000000,54.229000>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,0.000000,0> translate<37.909500,0.000000,54.229000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<37.909500,0.000000,65.659000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<42.354500,0.000000,65.659000>}
box{<0,0,-0.025400><4.445000,0.036000,0.025400> rotate<0,0.000000,0> translate<37.909500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<37.909500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<37.909500,0.000000,65.659000>}
box{<0,0,-0.025400><11.430000,0.036000,0.025400> rotate<0,90.000000,0> translate<37.909500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<42.354500,0.000000,54.229000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<42.354500,0.000000,57.086500>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,90.000000,0> translate<42.354500,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<42.354500,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<42.354500,0.000000,62.801500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,90.000000,0> translate<42.354500,0.000000,62.801500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<42.354500,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<42.354500,0.000000,65.659000>}
box{<0,0,-0.025400><2.857500,0.036000,0.025400> rotate<0,90.000000,0> translate<42.354500,0.000000,65.659000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<43.307000,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<43.307000,0.000000,57.086500>}
box{<0,0,-0.025400><5.715000,0.036000,0.025400> rotate<0,-90.000000,0> translate<43.307000,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<42.354500,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<43.307000,0.000000,57.086500>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,0.000000,0> translate<42.354500,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<42.354500,0.000000,62.801500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<43.307000,0.000000,62.801500>}
box{<0,0,-0.025400><0.952500,0.036000,0.025400> rotate<0,0.000000,0> translate<42.354500,0.000000,62.801500> }
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<40.132000,0.000000,58.674000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<40.132000,0.000000,56.134000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<40.132000,0.000000,63.754000>}
box{<-0.238100,0,-0.238100><0.238100,0.036000,0.238100> rotate<0,-90.000000,0> translate<40.132000,0.000000,61.214000>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  MOTHERBOARD(-41.275000,0,-42.862500,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//3-3V		LED-0805
//5V		LED-0805
//12V		LED-0805
//D1	1N4933	DIODE-0.4
//E-STOP	C-GRID-04-70543	70543-04
//J1		556416-1
//J2		556416-1
//J3		556416-1
//J4		556416-1
//J5		556416-1
//PIEZO	BUZZER	BUZZER-12MM
//R3	30	KH206-8
//S1		B3F-31XX
//U$1	ARDUINO-MEGA	ARDUINO-MEGA
//U$2	SDCARD	3M-SDCARD
//U$4		3,0
//U$5		3,0
//U$6		3,0
//U$7		3,0
//X-MAX	C-GRID-04-70543	70543-04
//X-MIN	C-GRID-04-70543	70543-04
//X1	5566-20	5566-20
//Y-MAX	C-GRID-04-70543	70543-04
//Y-MIN	C-GRID-04-70543	70543-04
//Z-MAX	C-GRID-04-70543	70543-04
//Z-MIN	C-GRID-04-70543	70543-04
