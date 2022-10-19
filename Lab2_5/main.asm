;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
;Question 5

			mov.w #7h, R4;
			mov.w #9h, R5;

			cmp.w R4, R5;

			jge Greater;
			jl Less;

			jmp $;

Less:
			call #less_function;
			jmp $;

Greater:
			jeq equal;
			call #greater_function;
			jmp $;

less_function:
			mov.w #0001h, &2000h;
			mov.w #0002h, &2002h;
			mov.w #0003h, &2004h;
			mov.w #0004h, &2006h;
			mov.w #0005h, &2008h;

			sub #1h, R4;
			ret;

greater_function:
			mov.w #000Ah, &2010h;
			mov.w #0009h, &2012h;
			mov.w #0008h, &2014h;
			mov.w #0007h, &2016h;
			mov.w #0006h, &2018h;

			sub #1h, R4;
			ret;

equal:
			jmp $;
                                            

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
