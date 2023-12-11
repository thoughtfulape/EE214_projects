# swndivswdual ledS
set_property -dict { PACKAGE_PIN N20   IOSTANDARD LVCMOS33 } [get_ports { led[0] }]; #swO_L14P_T2_SRCC_34 Schematswc=LD0
set_property -dict { PACKAGE_PIN P20   IOSTANDARD LVCMOS33 } [get_ports { led[1] }]; #swO_L14N_T2_SRCC_34 Schematswc=LD1
set_property -dict { PACKAGE_PIN R19   IOSTANDARD LVCMOS33 } [get_ports { led[2] }]; #swO_0_34 Schematswc=LD2
set_property -dict { PACKAGE_PIN T20   IOSTANDARD LVCMOS33 } [get_ports { led[3] }]; #swO_L15P_T2_DQS_34 Schematswc=LD3
set_property -dict { PACKAGE_PIN T19   IOSTANDARD LVCMOS33 } [get_ports { led[4] }]; #swO_L3P_T0_DWS_PUDC_B_34 Schematswc=LD4
set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports { led[5] }]; #swO_25_34 Schematswc=LD5
set_property -dict { PACKAGE_PIN V20   IOSTANDARD LVCMOS33 } [get_ports { led[6] }]; #swO_L16N_T2_34 Schematswc=LD6
set_property -dict { PACKAGE_PIN W20   IOSTANDARD LVCMOS33 } [get_ports { led[7] }]; #swO_L17N_T2_34  Schematswc=LD7
set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports { red }];
# set_property -dict { PACKAGE_PIN W19   IOSTANDARD LVCMOS33 } [get_ports { led[8] }]; #swO_L16P_T2_34 Schematswc=LD8
# set_property -dict { PACKAGE_PIN led19   IOSTANDARD LVCMOS33 } [get_ports { led[9] }]; #swO_L22N_T3_34 Schematswc=LD9


# swswtches
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { sw[0] }]; #swO_L19N_T3_VREF_34 Schematswc=sw0
set_property -dict { PACKAGE_PIN U20   IOSTANDARD LVCMOS33 } [get_ports { sw[1] }]; #swO_L15N_T2_DQS_34 Schematswc=sw1
set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { sw[2] }]; #swO_L19P_T3_34 Schematswc=sw2
set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { sw[3] }]; #swO_L21N_T3_DQS_AD14N_35 Schematswc=sw3
set_property -dict { PACKAGE_PIN R14   IOSTANDARD LVCMOS33 } [get_ports { sw[4] }]; #swO_L6N_T0_VREF_34 Schematswc=sw4
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { sw[5] }]; #swO_L6P_T0_34 Schematswc=sw5
set_property -dict { PACKAGE_PIN L15   IOSTANDARD LVCMOS33 } [get_ports { sw[6] }]; #swO_L22N_T3_AD7N_35 Schematswc=sw6
set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports { sw[7] }]; #swO_L23N_T3_35 Schematswc=sw7
# set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { sw[8] }]; #swO_L10P_T1_34 Sch=VGA_R4_CON
# set_property -dict { PACKAGE_PIN T12   IOSTANDARD LVCMOS33 } [get_ports { sw[9] }]; #swO_L10N_T1_34 Sch=VGA_R5_CON
# set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { sw[10] }]; #swO_L18P_T2_34 Sch=VGA_R6_CON
set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { clk }]; #swO_L18N_T2_AD13N_35 Sch=VGA_R7_CON

#Push Buttons
# set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33 } [get_ports { pb[0] }]; #swO_L8P_T1_34 Schematswc=BTN0
# set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS33 } [get_ports { pb[1] }]; #swO_L4N_T0_34 Schematswc=BTN1
# set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { pb[2] }];
# set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { btn[2] }]; #swO_L24P_T3_34 Schematswc=BTN2
# set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { btn[3] }]; #swO_L23P_T3_35 Schematswc=BTN3