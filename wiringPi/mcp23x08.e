-- MCP23x17 Registers

global constant	IODIRA	=	0x00
global constant	IPOLA	=	0x02
global constant	GPINTENA =	0x04
global constant	DEFVALA	=	0x06
global constant	INTCONA	=	0x08
global constant	IOCON	=	0x0A
global constant	GPPUA	=	0x0C
global constant	INTFA	=	0x0E
global constant	INTCAPA	=	0x10
global constant	GPIOA	=	0x12
global constant	OLATA	=	0x14

global constant	IODIRB	=	0x01
global constant	IPOLB	=	0x03
global constant	GPINTENB =	0x05
global constant	DEFVALB	=	0x07
global constant	INTCONB	=	0x09
global constant	IOCONB	=	0x0B
global constant	GPPUB	=	0x0D
global constant	INTFB	=	0x0F
global constant	INTCAPB	=	0x11
global constant	GPIOB	=	0x13
global constant	OLATB	=	0x15

-- Bits in the IOCON register

global constant	IOCON_UNUSED =	0x01
global constant	IOCON_INTPOL =	0x02
global constant	IOCON_ODR =	0x04
global constant	IOCON_HAEN =	0x08
global constant	IOCON_DISSLW =	0x10
global constant	IOCON_SEQOP =	0x20
global constant	IOCON_MIRROR =	0x40
global constant	IOCON_BANK_MODE =	0x80

-- Default initialisation mode

global constant	IOCON_INIT =	(IOCON_SEQOP)

-- SPI Command codes

global constant	CMD_WRITE =	0x40
global constant CMD_READ =	0x41
