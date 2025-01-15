#include "sys/alt_stdio.h"

#include "system.h"
#include "altera_avalon_pio_regs.h"

#include <sys/alt_irq.h> 
#include <alt_types.h>
#include "sys/alt_sys_init.h"




int main() {
	alt_printf("\nLab 2 : 7 Segments");
	
	alt_u32 i = 0;
	alt_u32 delay = 500000;
	
	alt_u32 value = 0;
	
	while(1){
		//DELAY
		while(i<delay){
			i++;
		}
		i=0;
		
		//COMPTEUR
		alt_u32 shift = 0;
		alt_u32 dataSend = 0;
		alt_u32 val = value;
		while (val > 0) {
			dataSend += (val % 10) << shift;
			shift += 4;
			val = val / 10;
		}
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_OUTPUT_BASE,dataSend);
		value++;
	}
	return 0;
}

