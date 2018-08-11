onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tbrxfsk/Clk
add wave -noupdate /tbrxfsk/nResetAsync
add wave -noupdate -format Analog-Step -height 74 -max 30191.0 -min -30135.0 /tbrxfsk/DdryL
add wave -noupdate /tbrxfsk/DdryR
add wave -noupdate /tbrxfsk/DwetL
add wave -noupdate /tbrxfsk/DwetR
add wave -noupdate /tbrxfsk/ValDryL
add wave -noupdate /tbrxfsk/ValDryR
add wave -noupdate /tbrxfsk/ValWetL
add wave -noupdate /tbrxfsk/ValWetR
add wave -noupdate /tbrxfsk/WaveAtEnd
add wave -noupdate /tbrxfsk/ADClrc
add wave -noupdate /tbrxfsk/Mclk
add wave -noupdate /tbrxfsk/Bclk
add wave -noupdate /tbrxfsk/DSignal
add wave -noupdate /tbrxfsk/RxChain/BP1Chan0/iClk
add wave -noupdate /tbrxfsk/RxChain/BP1Chan0/inResetAsync
add wave -noupdate /tbrxfsk/RxChain/BP1Chan0/iDdry
add wave -noupdate /tbrxfsk/RxChain/BP1Chan0/iValDry
add wave -noupdate /tbrxfsk/RxChain/BP1Chan0/oDwet
add wave -noupdate /tbrxfsk/RxChain/BP1Chan0/oValWet
add wave -noupdate -radix sfixed -childformat {{/tbrxfsk/RxChain/BP1Chan0/ram_block(0) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(1) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(2) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(3) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(4) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(5) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(6) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(7) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(8) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(9) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(10) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(11) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(12) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(13) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(14) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(15) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(16) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(17) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(18) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(19) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(20) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(21) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(22) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(23) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(24) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(25) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(26) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/ram_block(27) -radix sfixed}} -subitemconfig {/tbrxfsk/RxChain/BP1Chan0/ram_block(0) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(1) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(2) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(3) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(4) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(5) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(6) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(7) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(8) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(9) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(10) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(11) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(12) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(13) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(14) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(15) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(16) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(17) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(18) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(19) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(20) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(21) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(22) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(23) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(24) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(25) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(26) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/ram_block(27) {-radix sfixed}} /tbrxfsk/RxChain/BP1Chan0/ram_block
add wave -noupdate -radix sfixed -childformat {{/tbrxfsk/RxChain/BP1Chan0/rom_block(0) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(1) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(2) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(3) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(4) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(5) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(6) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(7) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(8) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(9) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(10) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(11) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(12) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(13) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(14) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(15) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(16) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(17) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(18) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(19) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(20) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(21) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(22) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(23) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(24) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(25) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(26) -radix sfixed} {/tbrxfsk/RxChain/BP1Chan0/rom_block(27) -radix sfixed}} -subitemconfig {/tbrxfsk/RxChain/BP1Chan0/rom_block(0) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(1) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(2) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(3) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(4) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(5) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(6) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(7) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(8) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(9) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(10) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(11) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(12) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(13) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(14) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(15) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(16) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(17) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(18) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(19) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(20) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(21) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(22) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(23) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(24) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(25) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(26) {-radix sfixed} /tbrxfsk/RxChain/BP1Chan0/rom_block(27) {-radix sfixed}} /tbrxfsk/RxChain/BP1Chan0/rom_block
add wave -noupdate /tbrxfsk/RxChain/BP1Chan0/ram_output
add wave -noupdate /tbrxfsk/RxChain/BP1Chan0/rom_output
add wave -noupdate /tbrxfsk/RxChain/BP1Chan0/R
add wave -noupdate /tbrxfsk/RxChain/BP1Chan0/NextR
add wave -noupdate /tbrxfsk/RxChain/BP0Chan0/iClk
add wave -noupdate /tbrxfsk/RxChain/BP0Chan0/inResetAsync
add wave -noupdate /tbrxfsk/RxChain/BP0Chan0/iDdry
add wave -noupdate /tbrxfsk/RxChain/BP0Chan0/iValDry
add wave -noupdate /tbrxfsk/RxChain/BP0Chan0/oDwet
add wave -noupdate /tbrxfsk/RxChain/BP0Chan0/oValWet
add wave -noupdate -radix sfixed -childformat {{/tbrxfsk/RxChain/BP0Chan0/ram_block(0) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(1) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(2) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(3) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(4) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(5) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(6) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(7) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(8) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(9) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(10) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(11) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(12) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(13) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(14) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(15) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(16) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(17) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(18) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(19) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(20) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(21) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(22) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(23) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(24) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(25) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(26) -radix sfixed} {/tbrxfsk/RxChain/BP0Chan0/ram_block(27) -radix sfixed}} -subitemconfig {/tbrxfsk/RxChain/BP0Chan0/ram_block(0) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(1) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(2) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(3) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(4) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(5) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(6) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(7) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(8) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(9) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(10) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(11) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(12) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(13) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(14) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(15) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(16) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(17) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(18) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(19) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(20) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(21) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(22) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(23) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(24) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(25) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(26) {-radix sfixed} /tbrxfsk/RxChain/BP0Chan0/ram_block(27) {-radix sfixed}} /tbrxfsk/RxChain/BP0Chan0/ram_block
add wave -noupdate -radix sfixed /tbrxfsk/RxChain/BP0Chan0/rom_block
add wave -noupdate /tbrxfsk/RxChain/BP0Chan0/ram_output
add wave -noupdate /tbrxfsk/RxChain/BP0Chan0/rom_output
add wave -noupdate /tbrxfsk/RxChain/BP0Chan0/R
add wave -noupdate /tbrxfsk/RxChain/BP0Chan0/NextR
add wave -noupdate /tbrxfsk/RxChain/LP/iClk
add wave -noupdate /tbrxfsk/RxChain/LP/inResetAsync
add wave -noupdate /tbrxfsk/RxChain/LP/iDdry
add wave -noupdate /tbrxfsk/RxChain/LP/iValDry
add wave -noupdate /tbrxfsk/RxChain/LP/oDwet
add wave -noupdate /tbrxfsk/RxChain/LP/oValWet
add wave -noupdate /tbrxfsk/RxChain/LP/ram_block
add wave -noupdate -radix sfixed /tbrxfsk/RxChain/LP/rom_block
add wave -noupdate /tbrxfsk/RxChain/LP/ram_output
add wave -noupdate /tbrxfsk/RxChain/LP/rom_output
add wave -noupdate /tbrxfsk/RxChain/LP/R
add wave -noupdate /tbrxfsk/RxChain/LP/NextR
add wave -noupdate /tbrxfsk/RxChain/inResetAsync
add wave -noupdate /tbrxfsk/RxChain/iClk
add wave -noupdate /tbrxfsk/RxChain/iChannelSelect
add wave -noupdate /tbrxfsk/RxChain/iVal
add wave -noupdate /tbrxfsk/RxChain/iD
add wave -noupdate /tbrxfsk/RxChain/oD
add wave -noupdate /tbrxfsk/RxChain/DwetBP0Chn0
add wave -noupdate /tbrxfsk/RxChain/DwetBP1Chn0
add wave -noupdate /tbrxfsk/RxChain/ValWetBP0Chn0
add wave -noupdate /tbrxfsk/RxChain/ValWetBP1Chn0
add wave -noupdate /tbrxfsk/RxChain/DwetBP0Chn1
add wave -noupdate /tbrxfsk/RxChain/DwetBP1Chn1
add wave -noupdate /tbrxfsk/RxChain/ValWetBP0Chn1
add wave -noupdate /tbrxfsk/RxChain/ValWetBP1Chn1
add wave -noupdate /tbrxfsk/RxChain/DwetBP0
add wave -noupdate /tbrxfsk/RxChain/DwetBP1
add wave -noupdate /tbrxfsk/RxChain/ValWetBP0
add wave -noupdate /tbrxfsk/RxChain/ValWetBP1
add wave -noupdate /tbrxfsk/RxChain/DwetLP
add wave -noupdate /tbrxfsk/RxChain/ValWetLP
add wave -noupdate /tbrxfsk/RxChain/regAfterSub
add wave -noupdate /tbrxfsk/RxChain/ValAfterSub
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {522646757 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 260
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
WaveRestoreZoom {0 ps} {51944827586 ps}
