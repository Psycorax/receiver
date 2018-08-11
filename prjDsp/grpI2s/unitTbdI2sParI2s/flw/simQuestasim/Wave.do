onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tbtbdi2spari2s/DUT/iClk
add wave -noupdate /tbtbdi2spari2s/DUT/inResetAsync
add wave -noupdate /tbtbdi2spari2s/DUT/oI2cSclk
add wave -noupdate /tbtbdi2spari2s/DUT/ioI2cSdin
add wave -noupdate /tbtbdi2spari2s/DUT/oMclk
add wave -noupdate /tbtbdi2spari2s/DUT/oBclk
add wave -noupdate -color Gold -itemcolor Gold /tbtbdi2spari2s/DUT/iADCdat
add wave -noupdate /tbtbdi2spari2s/DUT/oADClrc
add wave -noupdate -color Gold -itemcolor Gold /tbtbdi2spari2s/DUT/oDACdat
add wave -noupdate /tbtbdi2spari2s/DUT/oDAClrc
add wave -noupdate /tbtbdi2spari2s/DUT/oLed
add wave -noupdate -max 32766.999999999993 -min -32768.0 /tbtbdi2spari2s/DUT/Data
add wave -noupdate /tbtbdi2spari2s/DUT/ValL
add wave -noupdate /tbtbdi2spari2s/DUT/ValR
add wave -noupdate /tbtbdi2spari2s/DUT/Clk48MHz
add wave -noupdate /tbtbdi2spari2s/DUT/StrobeI2C
add wave -noupdate /tbtbdi2spari2s/DUT/Start
add wave -noupdate /tbtbdi2spari2s/DUT/Configured
add wave -noupdate /tbtbdi2spari2s/DUT/AckError
add wave -noupdate /tbtbdi2spari2s/DUT/Mclk
add wave -noupdate /tbtbdi2spari2s/DUT/Bclk
add wave -noupdate /tbtbdi2spari2s/DUT/ADClrc
add wave -noupdate /tbtbdi2spari2s/DUT/DAClrc
add wave -noupdate /tbtbdi2spari2s/DUT/BclkDiffersFromMclk
add wave -noupdate /tbtbdi2spari2s/DUT/ADClrcDiffersFromDAClrc
add wave -noupdate /tbtbdi2spari2s/DUT/WaitCtr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {140000 ps} 1} {{Cursor 2} {11471141 ps} 1} {{Cursor 3} {25595237 ps} 0}
quietly wave cursor active 3
configure wave -namecolwidth 282
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
WaveRestoreZoom {0 ps} {6300 us}
