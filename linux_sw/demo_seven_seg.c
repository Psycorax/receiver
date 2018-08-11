#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>


#define LW_BRIDGE_BASE 0xFF200000
#define LW_BRIDGE_SPAN 0x00010000

#define HEX_DIGIT_CTRL1_BASE 0x00008000
#define HEX_DIGIT_CTRL2_BASE 0x00008008
#define HEX_DIGIT_VALUE  0x00000000
#define HEX_DIGIT_STATUS 0x00000004


int open_physical(int);
void * map_physical(int, unsigned int, unsigned int);
void close_physical(int);
int unmap_physical(void *, unsigned int);

int main(void) {
    volatile int * hdc1_value;
    volatile int * hdc1_status;
    volatile int * hdc2_value;
    volatile int * hdc2_status;
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
    hdc1_value = (unsigned int *)(LW_virtual + HEX_DIGIT_CTRL1_BASE + HEX_DIGIT_VALUE);
    hdc1_status = (unsigned int *)(LW_virtual + HEX_DIGIT_CTRL1_BASE + HEX_DIGIT_STATUS);
    hdc2_value = (unsigned int *)(LW_virtual + HEX_DIGIT_CTRL2_BASE + HEX_DIGIT_VALUE);
    hdc2_status = (unsigned int *)(LW_virtual + HEX_DIGIT_CTRL2_BASE + HEX_DIGIT_STATUS);

    *hdc1_status = 0x01;
    *hdc1_value = 0x0F;
    *hdc2_status = 0x01;
    *hdc2_value = 0x00;
    
    for (;;) {
        // set off-flag (turn display off)
        *hdc1_status = 0x01;

        // decrement displayed hexadecimal number (modulo 16)
        *hdc2_value = (*hdc2_value - 1) & 0x0F;
        // clear off-flag (turn display on)
        *hdc2_status = 0x00;
        
        sleep(1);
        
        // increment displayed hexadecimal number (modulo 16)
        *hdc1_value = (*hdc1_value + 1) & 0x0F;
        // clear off-flag (turn display on)
        *hdc1_status = 0x00;
        
        // set off-flag (turn display off)
        *hdc2_status = 0x01;
        
        sleep(1);
    }
    
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

