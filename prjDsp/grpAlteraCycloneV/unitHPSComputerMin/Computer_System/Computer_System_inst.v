	Computer_System u0 (
		.f2h_bootflags_boot_from_fpga_ready      (<connected-to-f2h_bootflags_boot_from_fpga_ready>),      // f2h_bootflags.boot_from_fpga_ready
		.f2h_bootflags_boot_from_fpga_on_failure (<connected-to-f2h_bootflags_boot_from_fpga_on_failure>), //              .boot_from_fpga_on_failure
		.fpga_reset_reset_n                      (<connected-to-fpga_reset_reset_n>),                      //    fpga_reset.reset_n
		.h2f_loan_io_in                          (<connected-to-h2f_loan_io_in>),                          //   h2f_loan_io.in
		.h2f_loan_io_out                         (<connected-to-h2f_loan_io_out>),                         //              .out
		.h2f_loan_io_oe                          (<connected-to-h2f_loan_io_oe>),                          //              .oe
		.hps_io_hps_io_emac1_inst_TX_CLK         (<connected-to-hps_io_hps_io_emac1_inst_TX_CLK>),         //        hps_io.hps_io_emac1_inst_TX_CLK
		.hps_io_hps_io_emac1_inst_TXD0           (<connected-to-hps_io_hps_io_emac1_inst_TXD0>),           //              .hps_io_emac1_inst_TXD0
		.hps_io_hps_io_emac1_inst_TXD1           (<connected-to-hps_io_hps_io_emac1_inst_TXD1>),           //              .hps_io_emac1_inst_TXD1
		.hps_io_hps_io_emac1_inst_TXD2           (<connected-to-hps_io_hps_io_emac1_inst_TXD2>),           //              .hps_io_emac1_inst_TXD2
		.hps_io_hps_io_emac1_inst_TXD3           (<connected-to-hps_io_hps_io_emac1_inst_TXD3>),           //              .hps_io_emac1_inst_TXD3
		.hps_io_hps_io_emac1_inst_RXD0           (<connected-to-hps_io_hps_io_emac1_inst_RXD0>),           //              .hps_io_emac1_inst_RXD0
		.hps_io_hps_io_emac1_inst_MDIO           (<connected-to-hps_io_hps_io_emac1_inst_MDIO>),           //              .hps_io_emac1_inst_MDIO
		.hps_io_hps_io_emac1_inst_MDC            (<connected-to-hps_io_hps_io_emac1_inst_MDC>),            //              .hps_io_emac1_inst_MDC
		.hps_io_hps_io_emac1_inst_RX_CTL         (<connected-to-hps_io_hps_io_emac1_inst_RX_CTL>),         //              .hps_io_emac1_inst_RX_CTL
		.hps_io_hps_io_emac1_inst_TX_CTL         (<connected-to-hps_io_hps_io_emac1_inst_TX_CTL>),         //              .hps_io_emac1_inst_TX_CTL
		.hps_io_hps_io_emac1_inst_RX_CLK         (<connected-to-hps_io_hps_io_emac1_inst_RX_CLK>),         //              .hps_io_emac1_inst_RX_CLK
		.hps_io_hps_io_emac1_inst_RXD1           (<connected-to-hps_io_hps_io_emac1_inst_RXD1>),           //              .hps_io_emac1_inst_RXD1
		.hps_io_hps_io_emac1_inst_RXD2           (<connected-to-hps_io_hps_io_emac1_inst_RXD2>),           //              .hps_io_emac1_inst_RXD2
		.hps_io_hps_io_emac1_inst_RXD3           (<connected-to-hps_io_hps_io_emac1_inst_RXD3>),           //              .hps_io_emac1_inst_RXD3
		.hps_io_hps_io_qspi_inst_IO0             (<connected-to-hps_io_hps_io_qspi_inst_IO0>),             //              .hps_io_qspi_inst_IO0
		.hps_io_hps_io_qspi_inst_IO1             (<connected-to-hps_io_hps_io_qspi_inst_IO1>),             //              .hps_io_qspi_inst_IO1
		.hps_io_hps_io_qspi_inst_IO2             (<connected-to-hps_io_hps_io_qspi_inst_IO2>),             //              .hps_io_qspi_inst_IO2
		.hps_io_hps_io_qspi_inst_IO3             (<connected-to-hps_io_hps_io_qspi_inst_IO3>),             //              .hps_io_qspi_inst_IO3
		.hps_io_hps_io_qspi_inst_SS0             (<connected-to-hps_io_hps_io_qspi_inst_SS0>),             //              .hps_io_qspi_inst_SS0
		.hps_io_hps_io_qspi_inst_CLK             (<connected-to-hps_io_hps_io_qspi_inst_CLK>),             //              .hps_io_qspi_inst_CLK
		.hps_io_hps_io_sdio_inst_CMD             (<connected-to-hps_io_hps_io_sdio_inst_CMD>),             //              .hps_io_sdio_inst_CMD
		.hps_io_hps_io_sdio_inst_D0              (<connected-to-hps_io_hps_io_sdio_inst_D0>),              //              .hps_io_sdio_inst_D0
		.hps_io_hps_io_sdio_inst_D1              (<connected-to-hps_io_hps_io_sdio_inst_D1>),              //              .hps_io_sdio_inst_D1
		.hps_io_hps_io_sdio_inst_CLK             (<connected-to-hps_io_hps_io_sdio_inst_CLK>),             //              .hps_io_sdio_inst_CLK
		.hps_io_hps_io_sdio_inst_D2              (<connected-to-hps_io_hps_io_sdio_inst_D2>),              //              .hps_io_sdio_inst_D2
		.hps_io_hps_io_sdio_inst_D3              (<connected-to-hps_io_hps_io_sdio_inst_D3>),              //              .hps_io_sdio_inst_D3
		.hps_io_hps_io_usb1_inst_D0              (<connected-to-hps_io_hps_io_usb1_inst_D0>),              //              .hps_io_usb1_inst_D0
		.hps_io_hps_io_usb1_inst_D1              (<connected-to-hps_io_hps_io_usb1_inst_D1>),              //              .hps_io_usb1_inst_D1
		.hps_io_hps_io_usb1_inst_D2              (<connected-to-hps_io_hps_io_usb1_inst_D2>),              //              .hps_io_usb1_inst_D2
		.hps_io_hps_io_usb1_inst_D3              (<connected-to-hps_io_hps_io_usb1_inst_D3>),              //              .hps_io_usb1_inst_D3
		.hps_io_hps_io_usb1_inst_D4              (<connected-to-hps_io_hps_io_usb1_inst_D4>),              //              .hps_io_usb1_inst_D4
		.hps_io_hps_io_usb1_inst_D5              (<connected-to-hps_io_hps_io_usb1_inst_D5>),              //              .hps_io_usb1_inst_D5
		.hps_io_hps_io_usb1_inst_D6              (<connected-to-hps_io_hps_io_usb1_inst_D6>),              //              .hps_io_usb1_inst_D6
		.hps_io_hps_io_usb1_inst_D7              (<connected-to-hps_io_hps_io_usb1_inst_D7>),              //              .hps_io_usb1_inst_D7
		.hps_io_hps_io_usb1_inst_CLK             (<connected-to-hps_io_hps_io_usb1_inst_CLK>),             //              .hps_io_usb1_inst_CLK
		.hps_io_hps_io_usb1_inst_STP             (<connected-to-hps_io_hps_io_usb1_inst_STP>),             //              .hps_io_usb1_inst_STP
		.hps_io_hps_io_usb1_inst_DIR             (<connected-to-hps_io_hps_io_usb1_inst_DIR>),             //              .hps_io_usb1_inst_DIR
		.hps_io_hps_io_usb1_inst_NXT             (<connected-to-hps_io_hps_io_usb1_inst_NXT>),             //              .hps_io_usb1_inst_NXT
		.hps_io_hps_io_spim1_inst_CLK            (<connected-to-hps_io_hps_io_spim1_inst_CLK>),            //              .hps_io_spim1_inst_CLK
		.hps_io_hps_io_spim1_inst_MOSI           (<connected-to-hps_io_hps_io_spim1_inst_MOSI>),           //              .hps_io_spim1_inst_MOSI
		.hps_io_hps_io_spim1_inst_MISO           (<connected-to-hps_io_hps_io_spim1_inst_MISO>),           //              .hps_io_spim1_inst_MISO
		.hps_io_hps_io_spim1_inst_SS0            (<connected-to-hps_io_hps_io_spim1_inst_SS0>),            //              .hps_io_spim1_inst_SS0
		.hps_io_hps_io_i2c0_inst_SDA             (<connected-to-hps_io_hps_io_i2c0_inst_SDA>),             //              .hps_io_i2c0_inst_SDA
		.hps_io_hps_io_i2c0_inst_SCL             (<connected-to-hps_io_hps_io_i2c0_inst_SCL>),             //              .hps_io_i2c0_inst_SCL
		.hps_io_hps_io_i2c1_inst_SDA             (<connected-to-hps_io_hps_io_i2c1_inst_SDA>),             //              .hps_io_i2c1_inst_SDA
		.hps_io_hps_io_i2c1_inst_SCL             (<connected-to-hps_io_hps_io_i2c1_inst_SCL>),             //              .hps_io_i2c1_inst_SCL
		.hps_io_hps_io_gpio_inst_GPIO09          (<connected-to-hps_io_hps_io_gpio_inst_GPIO09>),          //              .hps_io_gpio_inst_GPIO09
		.hps_io_hps_io_gpio_inst_GPIO35          (<connected-to-hps_io_hps_io_gpio_inst_GPIO35>),          //              .hps_io_gpio_inst_GPIO35
		.hps_io_hps_io_gpio_inst_GPIO40          (<connected-to-hps_io_hps_io_gpio_inst_GPIO40>),          //              .hps_io_gpio_inst_GPIO40
		.hps_io_hps_io_gpio_inst_GPIO48          (<connected-to-hps_io_hps_io_gpio_inst_GPIO48>),          //              .hps_io_gpio_inst_GPIO48
		.hps_io_hps_io_gpio_inst_GPIO61          (<connected-to-hps_io_hps_io_gpio_inst_GPIO61>),          //              .hps_io_gpio_inst_GPIO61
		.hps_io_hps_io_gpio_inst_LOANIO49        (<connected-to-hps_io_hps_io_gpio_inst_LOANIO49>),        //              .hps_io_gpio_inst_LOANIO49
		.hps_io_hps_io_gpio_inst_LOANIO50        (<connected-to-hps_io_hps_io_gpio_inst_LOANIO50>),        //              .hps_io_gpio_inst_LOANIO50
		.hps_io_hps_io_gpio_inst_LOANIO53        (<connected-to-hps_io_hps_io_gpio_inst_LOANIO53>),        //              .hps_io_gpio_inst_LOANIO53
		.hps_io_hps_io_gpio_inst_LOANIO54        (<connected-to-hps_io_hps_io_gpio_inst_LOANIO54>),        //              .hps_io_gpio_inst_LOANIO54
		.hps_uart0_cts                           (<connected-to-hps_uart0_cts>),                           //     hps_uart0.cts
		.hps_uart0_dsr                           (<connected-to-hps_uart0_dsr>),                           //              .dsr
		.hps_uart0_dcd                           (<connected-to-hps_uart0_dcd>),                           //              .dcd
		.hps_uart0_ri                            (<connected-to-hps_uart0_ri>),                            //              .ri
		.hps_uart0_dtr                           (<connected-to-hps_uart0_dtr>),                           //              .dtr
		.hps_uart0_rts                           (<connected-to-hps_uart0_rts>),                           //              .rts
		.hps_uart0_out1_n                        (<connected-to-hps_uart0_out1_n>),                        //              .out1_n
		.hps_uart0_out2_n                        (<connected-to-hps_uart0_out2_n>),                        //              .out2_n
		.hps_uart0_rxd                           (<connected-to-hps_uart0_rxd>),                           //              .rxd
		.hps_uart0_txd                           (<connected-to-hps_uart0_txd>),                           //              .txd
		.memory_mem_a                            (<connected-to-memory_mem_a>),                            //        memory.mem_a
		.memory_mem_ba                           (<connected-to-memory_mem_ba>),                           //              .mem_ba
		.memory_mem_ck                           (<connected-to-memory_mem_ck>),                           //              .mem_ck
		.memory_mem_ck_n                         (<connected-to-memory_mem_ck_n>),                         //              .mem_ck_n
		.memory_mem_cke                          (<connected-to-memory_mem_cke>),                          //              .mem_cke
		.memory_mem_cs_n                         (<connected-to-memory_mem_cs_n>),                         //              .mem_cs_n
		.memory_mem_ras_n                        (<connected-to-memory_mem_ras_n>),                        //              .mem_ras_n
		.memory_mem_cas_n                        (<connected-to-memory_mem_cas_n>),                        //              .mem_cas_n
		.memory_mem_we_n                         (<connected-to-memory_mem_we_n>),                         //              .mem_we_n
		.memory_mem_reset_n                      (<connected-to-memory_mem_reset_n>),                      //              .mem_reset_n
		.memory_mem_dq                           (<connected-to-memory_mem_dq>),                           //              .mem_dq
		.memory_mem_dqs                          (<connected-to-memory_mem_dqs>),                          //              .mem_dqs
		.memory_mem_dqs_n                        (<connected-to-memory_mem_dqs_n>),                        //              .mem_dqs_n
		.memory_mem_odt                          (<connected-to-memory_mem_odt>),                          //              .mem_odt
		.memory_mem_dm                           (<connected-to-memory_mem_dm>),                           //              .mem_dm
		.memory_oct_rzqin                        (<connected-to-memory_oct_rzqin>),                        //              .oct_rzqin
		.system_clk_clk                          (<connected-to-system_clk_clk>),                          //    system_clk.clk
		.system_reset_reset                      (<connected-to-system_reset_reset>)                       //  system_reset.reset
	);

