#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>


#define LW_BRIDGE_BASE 0xFF200000
#define LW_BRIDGE_SPAN 0x00010000

#define CHANNEL_CTRL_TX_BASE 0x00004000
#define CHANNEL_CTRL_RX_BASE 0x00004008
#define CHANNEL_REG_CHANNEL  0x00000000
#define CHANNEL_REG_MAGIC    0x00000004

#define MAGIC_VALUE 0x5CD01234


int open_physical(int);
void * map_physical(int, unsigned int, unsigned int);
void close_physical(int);
int unmap_physical(void *, unsigned int);

int main(int argc, char const * argv[]) {
    volatile int * tx_reg_magic;
    volatile int * rx_reg_magic;
    long channel_tx;
    long channel_rx;
    int magic_tx;
    int magic_rx;
    void * LW_virtual; // physical addresses for LW bridge
    int fd = -1;       // file handle for /dev/mem

    // Create virtual memory access to the FPGA LW bridge
    if ((fd = open_physical(fd)) == -1) {
        return -1;
    }
    if ((LW_virtual = map_physical(fd, LW_BRIDGE_BASE, LW_BRIDGE_SPAN)) == NULL) {
        return -1;
    }
    
    // Set virtual address pointer to I/O port
    tx_reg_magic = (unsigned int *)(LW_virtual + CHANNEL_CTRL_TX_BASE + CHANNEL_REG_MAGIC);
    rx_reg_magic = (unsigned int *)(LW_virtual + CHANNEL_CTRL_RX_BASE + CHANNEL_REG_MAGIC);
    
    channel_tx = 0;
    if (argc > 1) {
        // read first command line argument into channel_tx as integer
        channel_tx = strtol(argv[1], NULL, 0);
    }
    channel_rx = 0;
    if (argc > 2) {
        // read second command line argument into channel_rx as integer
        channel_rx = strtol(argv[2], NULL, 0);
    }
    
    magic_tx = *tx_reg_magic;
    magic_rx = *rx_reg_magic;
    if (magic_tx != MAGIC_VALUE) {
        printf("Error: Unexpected magic value '%08X' for TX channel selector!\n", magic_tx);
        unmap_physical(LW_virtual, LW_BRIDGE_SPAN);
        close_physical(fd);
        return -1;
    }
    if (magic_rx != MAGIC_VALUE) {
        printf("Error: Unexpected magic value '%08X' for RX channel selector!\n", magic_rx);
        unmap_physical(LW_virtual, LW_BRIDGE_SPAN);
        close_physical(fd);
        return -1;
    }
    
    ////////////////////////////////////////////////////////////
    // 
    // 
    // TODO: change channel
    // 
    // 
    ////////////////////////////////////////////////////////////
    
    unmap_physical(LW_virtual, LW_BRIDGE_SPAN);
    close_physical(fd);
    return 0;
}


// Open /dev/mem to give access to physical addresses
int open_physical(int fd) {
    if (fd == -1) {
        // check if already open
        if ((fd = open("/dev/mem", (O_RDWR | O_SYNC))) == -1) {
            printf("ERROR: could not open \"/dev/mem\"...\n");
            return -1;
        }
    }
    return fd;
}

// Close /dev/mem to give access to physical addresses
void close_physical(int fd) {
    close(fd);
}

// Establish a virtual address mapping for the physical addresses
// starting at base and extending by span bytes
void * map_physical(int fd, unsigned int base, unsigned int span) {
    void * virtual_base;
    // Get a mapping from physical addresses to virtual addresses
    virtual_base = mmap(NULL, span, (PROT_READ | PROT_WRITE), MAP_SHARED, fd, base);
    if (virtual_base == MAP_FAILED) {
        printf("ERROR: mmap() failed...\n");
        close(fd);
        return NULL;
    }
    return virtual_base;
}

// Close the previously-opened virtual address mapping
int unmap_physical(void * virtual_base, unsigned int span) {
    if (munmap (virtual_base, span) != 0) {
        printf("ERROR: munmap() failed...\n");
        return -1;
    }
    return 0;
}

