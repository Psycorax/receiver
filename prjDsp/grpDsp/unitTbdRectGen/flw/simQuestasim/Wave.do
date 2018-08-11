onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tbtbdrectgen/DUT/iClk
add wave -noupdate /tbtbdrectgen/DUT/inResetAsync
add wave -noupdate /tbtbdrectgen/DUT/oI2cSclk
add wave -noupdate /tbtbdrectgen/DUT/ioI2cSdin
add wave -noupdate /tbtbdrectgen/DUT/Start
add wave -noupdate /tbtbdrectgen/DUT/Configured
add wave -noupdate /tbtbdrectgen/DUT/AckError
add wave -noupdate /tbtbdrectgen/DUT/oLed
add wave -noupdate /tbtbdrectgen/DUT/oMclk
add wave -noupdate /tbtbdrectgen/DUT/oBclk
add wave -noupdate /tbtbdrectgen/DUT/oADClrc
add wave -noupdate /tbtbdrectgen/DUT/iADCdat
add wave -noupdate /tbtbdrectgen/DUT/oDAClrc
add wave -noupdate /tbtbdrectgen/DUT/oDACdat
add wave -noupdate -color Gold -format Analog-Step -height 74 -max 32767.0 -min -32768.0 /tbtbdrectgen/DUT/DL
add wave -noupdate /tbtbdrectgen/DUT/ValL
add wave -noupdate -color Gold -format Analog-Step -height 74 -max 32767.0 -min -32768.0 /tbtbdrectgen/DUT/DR
add wave -noupdate /tbtbdrectgen/DUT/ValR
add wave -noupdate /tbtbdrectgen/DUT/Clk48MHz
add wave -noupdate /tbtbdrectgen/DUT/StrobeI2C
add wave -noupdate /tbtbdrectgen/DUT/Mclk
add wave -noupdate /tbtbdrectgen/DUT/Bclk
add wave -noupdate /tbtbdrectgen/DUT/ADClrc
add wave -noupdate /tbtbdrectgen/DUT/nADClrc
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {440Hz_Start {1136419973 ps} 1 default Cyan} {440Hz_Stop {3408982853 ps} 1 default Cyan} {100Hz_Start {4999818533 ps} 1} {100Hz_Stop {14999178533 ps} 1}
quietly wave cursor active 0
configure wave -namecolwidth 325
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {16800 us}
