-- MCP23x08 Registers
	
global constant	MCP23x08_IODIR	=	0x00
global constant	MCP23x08_IPOL	=	0x01
global constant	MCP23x08_GPINTEN =	0x02
global constant	MCP23x08_DEFVAL	=	0x03
global constant	MCP23x08_INTCON	=	0x04
global constant	MCP23x08_IOCON	=	0x05
global constant	MCP23x08_GPPU	=	0x06
global constant	MCP23x08_INTF	=	0x07
global constant	MCP23x08_INTCAP	=	0x08
global constant	MCP23x08_GPIO	=	0x09
global constant	MCP23x08_OLAT	=	0x0A

-- MCP23x17 Registers

global constant	MCP23x17_IODIRA	=	0x00
global constant	MCP23x17_IPOLA	=	0x02
global constant	MCP23x17_GPINTENA =	0x04
global constant	MCP23x17_DEFVALA =	0x06
global constant	MCP23x17_INTCONA =	0x08
global constant	MCP23x17_IOCON	=	0x0A
global constant	MCP23x17_GPPUA	=	0x0C
global constant	MCP23x17_INTFA	=	0x0E
global constant	MCP23x17_INTCAPA =	0x10
global constant	MCP23x17_GPIOA	=	0x12
global constant	MCP23x17_OLATA		0x14

global constant	MCP23x17_IODIRB	=	0x01
global constant	MCP23x17_IPOLB	=	0x03
global constant	MCP23x17_GPINTENB =	0x05
global constant	MCP23x17_DEFVALB =	0x07
global constant	MCP23x17_INTCONB =	0x09
global constant	MCP23x17_IOCONB	=	0x0B
global constant	MCP23x17_GPPUB	=	0x0D
global constant	MCP23x17_INTFB	=	0x0F
global constant	MCP23x17_INTCAPB =	0x11
global constant	MCP23x17_GPIOB	=	0x13
global constant	MCP23x17_OLATB	=	0x15

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
