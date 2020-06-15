; Disassembly of Miniature Golf.bin
; Disassembled Sat Apr 06 13:06:42 2019
; Using DiStella v3.01a
;
; Command Line: DiStella.EXE Miniature Golf.bin 
;
	OPT H-F+
VSYNC   =  $00
VBLANK  =  $01
WSYNC   =  $02
NUSIZ0  =  $04
NUSIZ1  =  $05
COLUP0  =  $06
COLUP1  =  $07
COLUPF  =  $08 
COLBAK  =  $09
CTRLPF  =  $0A
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
AUDC0   =  $15
AUDC1   =  $16
AUDF0   =  $17
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENAM1   =  $1E
ENABL   =  $1F
HMP0    =  $20
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXP0FB  =  $32
CXP1FB  =  $33
CXBLPF  =  $36
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296


Stack_Store                 = $B5
PF_Y_POS                    = $90
Player_Number               = $91
Current_Hole                = $92
ObstYPos                    = $93
HoleYPos                    = $94
ClubYPos                    = $96
BallYPos                    = $97
First_Object_X_Pos          = $99
ObstXPos                    = $99
HoleXPos                    = $9A
ClubXpos                    = $9C
BallXPos                    = $9D
Delay_CountDown             = $AC

PlayField_Top_Line          = $C2
ObstNuSize                  = $C3
ObjectANDMask               = $C4

       ORG $F000

START:
       SEI            
       CLD            
       LDX    #$28    
       LDA    #$00    
LF006: STA    NUSIZ0,X
       DEX            
       BPL    LF006   
       TXS            
LF00C: STA    VSYNC,X 
       DEX            
       BMI    LF00C   
       LDA    #$FF    
       STA    $80     
       LDA    #$09    
       STA    AUDV0   
       STA    AUDV1   
       LDA    #$20    
       STA    NUSIZ1  
       LDA    #$01    
       STA    $8F     
       STA    $87     
       LDA    #$0A    
       STA    $88     
       JMP    LF0B8   
LF02C: INC    $81     
       BNE    LF032   
       INC    $82     
LF032: LDA    #$02    
       STA    WSYNC   
       STA    VBLANK  
       STA    VSYNC   
       STA    WSYNC   
       LDA    SWCHB   
       LDX    #$07    
       LDY    #$07    
       AND    #$08    
       BEQ    LF04B   
       LDX    #$F7    
       LDY    #$03    
LF04B: LDA    $80     
       BMI    LF051   
       LDX    #$FF    
LF051: AND    $82     
       STA    $86     
       STX    $84     
       LDX    #$03    
       STA    WSYNC   
LF05B: LDA    REGISTER_COLOR_SET_COLOR,Y 
       EOR    $86     
       AND    $84     
       STA    COLUP0,X
       DEY            
       DEX            
       BPL    LF05B   
       STA    WSYNC   
       LDA    #$00    
       STA    VSYNC   
       LDA    #$31    
       STA    TIM64T  
       LDA    SWCHB   
       LSR @
       BCS    LF085   
       LDA    #$00    
       STA    Player_Number      
       STA    $80     
       STA    $87     
       STA    $88     
       BEQ    LF0B6   
LF085: LSR @
       LDA    #$FF    
       BCC    LF08E   
       STA    $83     
       BNE    LF0BB   
LF08E: STA    $80     
       LDA    $83     
       BMI    LF09A   
       EOR    $81     
       AND    #$1F    
       BNE    LF0BB   
LF09A: LDA    $81     
       AND    #$1F    
       STA    $83     
       INC    $8F     
       LDA    #$0A    
       STA    $88     
       LDA    $8F     
       CMP    #$03    
       BNE    LF0B0   
       LDA    #$01    
       STA    $8F     
LF0B0: STA    $87     
       LDA    #$00    
       STA    $B0     
LF0B6: STA    Current_Hole     
LF0B8: JSR    LF63E   
LF0BB: LDA    SWCHA   
       STA    $9F     
       LDA    $80     
       BMI    LF0D0   
       LDA    $A9     
       ORA    $AA     
       BNE    LF0CD   
       JSR    LF43D   
LF0CD: JSR    LF2C7   
LF0D0: JSR    LF54F   
       LDX    #$04    
LF0D5: JSR    Position_Sprite   
       DEX            
       BPL    LF0D5   
       STA    CXCLR   
       LDA    $AD     
       BEQ    LF0E9   
       LDA    $B1     
       STA    $87     
       LDA    $B2     
       STA    $88     
LF0E9: LDA    INTIM   
       BNE    LF0E9   
       LDA    #$00    
       STA    WSYNC   
       STA    HMOVE   
       STA    VBLANK  
       STA    $89     
       STA    $8A     
       STA    PF0     
       STA    PF1     
       STA    PF2     
       LDA    #$02    
       STA    CTRLPF  
       LDX    #$05    
       
DISPLAY_TOP_NUMBERS_LOOP 
       STA    WSYNC   
       LDA    $89     
       STA    PF1     
       LDY    $8B     
       LDA    NUMERAL_DATA,Y 
       AND    #$F0    
       STA    $89     
       LDY    $8D     
       LDA    NUMERAL_DATA,Y 
       AND    #$0F    
       ORA    $89     
       STA    $89     
       LDA    $8A     
       STA    PF1     
       LDY    $8C     
       LDA    NUMERAL_DATA,Y 
       AND    #$F0    
       STA    $8A     
       LDY    $8E     
       LDA    NUMERAL_DATA,Y 
       AND    #$0F    
       STA    WSYNC   
       ORA    $8A     
       STA    $8A     
       LDA    $89     
       STA    PF1     
       DEX            
       BMI    LF150   
       INC    $8B     
       INC    $8D     
       INC    $8C     
       INC    $8E     
       LDA    $8A     
       STA    PF1     
       JMP    DISPLAY_TOP_NUMBERS_LOOP   
       
LF150: LDA    #$00    
       STA    PF1     
       STA    WSYNC   
       LDA    #$11    
       STA    CTRLPF  
       STA    WSYNC   
       LDX    #$01    
LF15E: LDA    $87,X   
       AND    #$0F    
       STA    $8D,X   
       ASL @       
       ASL @    
       CLC            
       ADC    $8D,X   
       STA    $8D,X   
       LDA    $87,X   
       AND    #$F0    
       LSR @
       LSR @   
       STA    $8B,X   
       LSR @       
       LSR @   
       STA    WSYNC   
       CLC            
       ADC    $8B,X   
       STA    $8B,X   
       DEX            
       BPL    LF15E   
       LDA    $80     
       BMI    LF1A3   
       LDY    Player_Number      
       LDA    SWCHB   
       AND    #$08    
       BEQ    LF194   
       LDA    LF6B5,Y 
       LDX    LF6B6,Y 
       BNE    LF19F   
LF194: LDA    LF6B9,Y 
       AND    #$0F    
       TAX            
       LDA    LF6B8,Y 
       AND    #$0F    
LF19F: STA    COLUP1  
       STX    COLUP0  
LF1A3: TSX            
       STX    Stack_Store     
       LDA    ObstNuSize
       STA    NUSIZ0
       LDX    Current_Hole     
       LDY    HoleStartIndex,X
       STY    PlayField_Top_Line        
       LDX    #$00    
       LDA    #$58    
       STA    PF_Y_POS     
       
Top_Bottom_Playfield
       LDA    #%11111111
       STA    WSYNC
       STA    PF0
       STA    PF1
       STA    PF2
       JMP    Put_Playfield_Objects
       
Playfield_Loop 
       CPY    PlayField_Top_Line
       BEQ    Put_Playfield_Objects       
       LDA    PlayField0,Y 
       STA    WSYNC
       STA    PF0     
       LDA    PlayField1,Y 
       STA    PF1     
       LDA    PlayField2,Y 
       STA    PF2     
Put_Playfield_Objects 
         
       STX    $B4      
       LDX    #ENABL    
       TXS            
       SEC            
       LDA    PF_Y_POS     
       SBC    ObstYPos     
       AND    ObjectANDMask    
       BEQ    LF1D4   
       LDX    #$00    
       BEQ    LF1D7   
LF1D4: LDX    #$FF    
       NOP            
LF1D7: SEC            
       LDA    PF_Y_POS     
       SBC    ClubYPos     
       AND    #$FC    
       STA    $A2     
       NOP            
       NOP            
       NOP            
       SEC            
       LDA    PF_Y_POS     
       SBC    BallYPos     
       AND    #$FE    
       PHP            
       LDA    $A2     
       PHP            
       STX    GRP0    
       SEC            
       LDA    PF_Y_POS     
       SBC    HoleYPos     
       AND    #$FE    
       BEQ    LF1FD   
       LDA    #$00    
       BEQ    LF200   
LF1FD: LDA    #$0E    
       NOP            
LF200: STA    GRP1    
       LDX    $B4     
       LDA    PF_Y_POS     
       CMP    PlayField_Section_Change,X 
       BNE    LF20D   
       INX            
       INY            
LF20D: DEC    PF_Y_POS     
       BEQ    Top_Bottom_Playfield 
       BPL    Playfield_Loop   
       
       LDX    Stack_Store     
       TXS            
       LDA    #$1A    
       STA    TIM64T  
       STA    WSYNC   
       LDA    #$00    
       STA    GRP0    
       STA    GRP1    
       STA    ENAM0   
       STA    ENAM1   
       STA    ENABL   
       STA    HMCLR   
       JSR    LF4CD   
       LDA    $BF     
       BEQ    LF240   
       DEC    $BF     
       DEC    $C0     
       BNE    LF2A7   
       INC    $C1     
       LDA    #$07    
       STA    $C0     
       LDA    $C1     
LF23E: STA    $BB     
LF240: LDX    #$00    
       LDA    $BB     
       BEQ    LF2A7   
       STA    $BC     
       LDA    $BD,X   
       BEQ    LF251   
       INX            
       LDA    $BD,X   
       BNE    LF2A7   
LF251: LDA    $BB     
       CMP    #$03    
       BNE    LF25F   
       LDA    #$0D    
       STA    AUDC0,X 
       LDA    #$08    
       BNE    LF297   
LF25F: CMP    #$02    
       BNE    LF26B   
       LDA    #$08    
       STA    AUDC0,X 
       LDA    #$0A    
       BNE    LF297   
LF26B: CMP    #$04    
       BNE    LF279   
       LDA    #$07    
       STA    $C0     
       STA    AUDC0,X 
       LDA    #$02    
       BNE    LF297   
LF279: CMP    #$05    
       BNE    LF285   
       LDA    #$0D    
       STA    AUDC0,X 
       LDA    #$04    
       BNE    LF297   
LF285: CMP    #$01    
       BNE    LF2A7   
       LDA    #$1F    
       STA    $BF     
       LDA    #$07    
       STA    $C0     
       LDA    #$03    
       STA    $C1     
       BNE    LF23E   
LF297: STA    AUDF0,X 
       LDA    $C0     
       BNE    LF29F   
       LDA    #$02    
LF29F: STA    $BD,X   
       LDA    #$00    
       STA    $BB     
       BEQ    LF2BF   
LF2A7: LDA    $BD     
       BEQ    LF2AD   
       DEC    $BD     
LF2AD: LDA    $BE     
       BEQ    LF2B5   
       DEC    $BE     
       BPL    LF2BF   
LF2B5: LDA    $BD     
       ORA    $BE     
       BNE    LF2BF   
       STA    AUDC1   
       STA    AUDC0   
LF2BF: LDA    INTIM   
       BNE    LF2BF   
       JMP    LF02C   
LF2C7: LDA    CXBLPF  
       BPL    LF30D   
       LDA    $A3     
       BNE    LF2DB   
       LDA    #$03    
       STA    $BB     
       INC    $A3     
       JSR    LF3F6   
       JMP    LF311   
LF2DB: CMP    #$01    
       BNE    LF2F0   
       INC    $A3     
       JSR    LF408   
       JSR    LF429   
       JSR    LF408   
       JSR    LF433   
       JMP    LF311   
LF2F0: CMP    #$02    
       BNE    LF2FF   
       INC    $A3     
       JSR    LF3F6   
       JSR    LF417   
       JMP    LF311   
LF2FF: LDA    $A7     
       STA    BallXPos     
       LDA    $A8     
       STA    BallYPos     
       LDA    #$00    
       STA    $A9     
       STA    $AA     
LF30D: LDA    #$00    
       STA    $A3     
LF311: LDA    CXP1FB  
       AND    #$40    
       BEQ    LF378   
       LDA    $BC     
       CMP    #$05    
       BEQ    LF33F   
       LDA    $A9     
       ORA    $AA     
       BEQ    LF345   
       LDY    #$00    
       LDX    Player_Number      
       LDA    BIT_064,X 
       AND    SWCHB   
       BEQ    LF331   
       LDY    #$02    
LF331: LDA    $B9     
       CMP    LF736,Y 
       BCS    LF33F   
       LDA    $BA     
       CMP    LF737,Y 
       BCC    LF345   
LF33F: JSR    LF433   
       JMP    LF378   
LF345: LDA    #$04    
       STA    $BB     
       LDA    #$01    
       CMP    $AD     
       BNE    LF351   
       STA    $BB     
LF351: LDA    $8F     
       LSR @       
       BEQ    LF35E   
       LDA    Player_Number      
       BEQ    LF370   
       LDA    #$00    
       STA    Player_Number      
LF35E: INC    Current_Hole     
       LDA    Current_Hole     
       CMP    #$09    
       BNE    LF374   
       LDA    #$FF    
       STA    $80     
       LDA    #$00    
       STA    Current_Hole     
       BEQ    LF374   
LF370: EOR    #$01    
       STA    Player_Number      
LF374: JSR    LF63E   
       RTS            

LF378: LDA    CXP0FB  
       AND    #$40    
       BNE    LF381   
       STA    $A4     
       RTS            

LF381: LDA    $A4     
       BEQ    LF386   
       RTS            

LF386: LDA    #$01    
       STA    $A4     
       LDA    #$05    
       STA    $BB     
       LDA    $A9     
       ORA    $AA     
       BNE    LF3BF   
       LDA    #$0A    
       STA    $A9     
       STA    $AA     
       LDX    #$00    
       LDA    #$28    
       STA    $BA     
       STA    $B9     
       LDA    Current_Hole     
       ASL @       
       ASL @       
       TAY            
       SEC            
       LDA    Obstacle_Limit_X,Y 
       SBC    Obstacle_Start_X,Y 
       BEQ    LF3B2   
       LDX    #$01    
LF3B2: LDA    $AE     
       BEQ    LF3BA   
       LDA    #$28    
       BNE    LF3BC   
LF3BA: LDA    #$D8    
LF3BC: STA    $A9,X   
       RTS            

LF3BF: SEC            
       LDA    BallXPos     
       SBC    ObstXPos     
       LSR @       
       LSR @       
       BIT    BIT_032   
       BEQ    LF3CD   
       ORA    #$C0    
LF3CD: STA    $B7     
       CLC            
       ADC    ObstYPos     
       STA    $B4     
       LDA    $B7     
       EOR    #$FF    
       CLC            
       ADC    #$09    
       CLC            
       ADC    ObstYPos     
       STA    $B6     
       LDA    BallYPos     
       CMP    $B4     
       BCC    LF3EE   
       CMP    $B6     
       BCC    LF3F2   
LF3EA: JSR    LF433   
       RTS            

LF3EE: CMP    $B6     
       BCC    LF3EA   
LF3F2: JSR    LF429   
       RTS            

LF3F6: SEC            
       LDA    BallXPos     
       SBC    $A5     
       STA    BallXPos     
       CLC            
       LDA    BallYPos     
       ADC    $A6     
       STA    BallYPos     
       JSR    LF429   
       RTS            

LF408: CLC            
       LDA    BallXPos     
       ADC    $A5     
       STA    BallXPos     
       SEC            
       LDA    BallYPos     
       SBC    $A6     
       STA    BallYPos     
       RTS            

LF417: SEC            
       LDA    BallXPos     
       SBC    $A5     
       STA    BallXPos     
       SEC            
       LDA    BallYPos     
       SBC    $A6     
       STA    BallYPos     
       JSR    LF429   
       RTS            

LF429: LDA    $AA     
       EOR    #$FF    
       CLC            
       ADC    #$01    
       STA    $AA     
       RTS            

LF433: LDA    $A9     
       EOR    #$FF    
       CLC            
       ADC    #$01    
       STA    $A9     
       RTS            

LF43D: LDX    Player_Number      
       LDA    INPT4,X 
       EOR    #$80    
       AND    $A0,X   
       BMI    LF44A   
       JMP    LF4C8   
LF44A: SEC            
       LDA    BallXPos     
       SBC    ClubXPos     
       LSR @       
       LSR @   
       BIT    BIT_032   
       BEQ    LF458   
       ORA    #$C0    
LF458: STA    $AA     
       BPL    LF461   
       EOR    #$FF    
       CLC            
       ADC    #$01    
LF461: STA    $BA     
       SEC            
       LDA    BallYPos     
       SBC    ClubYPos     
       LSR @       
       LSR @   
       BIT    BIT_032   
       BEQ    LF471   
       ORA    #$C0    
LF471: STA    $A9     
       BPL    LF47A   
       EOR    #$FF    
       CLC            
       ADC    #$01    
LF47A: STA    $B9     
       ORA    $BA     
       BEQ    LF4C8   
       LDA    #$74    
       STA    $B3     
       LDA    $B9     
       ASL @       
       CMP    $BA     
       BCS    LF48D   
       LDA    $BA     
LF48D: CLC            
       ADC    $B3     
       LSR @       
       LSR @   
       BIT    BIT_032   
       BEQ    LF499   
       ORA    #$C0    
LF499: STA    $AB     
       STA    $B8     
       INC    $AD     
       LDY    Player_Number      
       LDA    BIT_064,Y 
       AND    SWCHB   
       BEQ    LF4AD   
       ASL    $AB     
       ASL    $B8     
LF4AD: LDA    #$02    
       STA    $BB     
       LDA    BallXPos     
       STA    ClubXPos     
       LDA    BallYPos     
       CMP    #$57    
       BCC    LF4BD   
       LDA    #$56    
LF4BD: STA    ClubYPos     
       SED            
       LDA    $B1,X   
       CLC            
       ADC    #$01    
       STA    $B1,X   
       CLD            
LF4C8: LDA    INPT4,X 
       STA    $A0,X   
       RTS            

LF4CD: LDA    Player_Number      
       BNE    LF4D5   
       LDY    #$07    
       BNE    LF4D7   
LF4D5: LDY    #$03    
LF4D7: SEC            
       LDA    BallYPos     
       SBC    ClubYPos     
       BPL    LF4E3   
       EOR    #$FF    
       CLC            
       ADC    #$01    
LF4E3: CMP    #$0B    
       BCS    LF502   
       LDA    ClubXPos     
       CMP    BallXPos     
       BCC    LF4F5   
       SEC            
       LDA    ClubXPos     
       SBC    BallXPos     
       JMP    LF4FA   
LF4F5: SEC            
       LDA    BallXPos     
       SBC    ClubXPos     
LF4FA: CMP    #$15    
       BCS    LF502   
       LDA    Delay_CountDown     
       BNE    LF546   
LF502: LDA    BIT_001,Y 
       AND    $9F     
       BEQ    LF52C   
       LDA    LF6BA,Y 
       AND    $9F     
       BEQ    LF521   
       LDA    LF6B9,Y 
       AND    $9F     
       BEQ    LF536   
       LDA    LF6B8,Y 
       AND    $9F     
       BEQ    LF53E   
       JMP    LF546   
LF521: LDA    ClubXPos     
       CMP    #$03    
       BEQ    LF546   
       DEC    ClubXPos     
       JMP    LF546   
LF52C: LDA    ClubXPos     
       CMP    #BallXPos    
       BEQ    LF546   
       INC    ClubXPos     
       BNE    LF546   
LF536: LDA    ClubYPos     
       BEQ    LF546   
       DEC    ClubYPos     
       BPL    LF546   
LF53E: LDA    ClubYPos     
       CMP    #$56    
       BEQ    LF546   
       INC    ClubYPos     
LF546: DEC    Delay_CountDown     
       BPL    LF54E   
       LDA    #$03    
       STA    Delay_CountDown     
LF54E: RTS            

LF54F: LDA    $A3     
       BEQ    LF556   
       JMP    LF5F7   
LF556: LDA    BallXPos     
       STA    $A5     
       STA    $A7     
       LDA    BallYPos     
       STA    $A6     
       STA    $A8     
       LDA    $A9     
       LSR @       
       LSR @   
       LSR @   
       LSR @   
       BIT    BIT_008   
       BEQ    LF56F   
       ORA    #$F0    
LF56F: STA    $B4     
       LDA    $A9     
       ASL @       
       ASL @   
       ASL @   
       ASL @   
       CLC            
       ADC    $98     
       STA    $98     
       LDA    $B4     
       ADC    BallYPos     
       CMP    #$59    
       BCC    LF58E   
       LDA    $A9     
       BPL    LF58C   
       LDA    #$00    
       BEQ    LF58E   
LF58C: LDA    #$58    
LF58E: STA    BallYPos     
       LDA    $AA     
       LSR @       
       LSR @   
       LSR @   
       LSR @   
       BIT    BIT_008   
       BEQ    LF59D   
       ORA    #$F0    
LF59D: STA    $B4     
       LDA    $AA     
       ASL @   
       ASL @   
       ASL @   
       ASL @   
       CLC            
       ADC    $9E     
       STA    $9E     
       LDA    $B4     
       ADC    BallXPos     
       CMP    #$A0    
       BCC    LF5B4   
       LDA    #$9F    
LF5B4: STA    BallXPos     
       LDA    $AB     
       BPL    LF5C0   
       INC    $AB     
       BNE    LF5E9   
       BEQ    LF5C4   
LF5C0: DEC    $AB     
       BNE    LF5E9   
LF5C4: LDA    $B8     
       STA    $AB     
       LDX    #$01    
LF5CA: LDA    $A9,X   
       BEQ    LF5DA   
       BMI    LF5D6   
       DEC    $A9,X   
       DEC    $B9,X   
       BPL    LF5DA   
LF5D6: INC    $A9,X   
       DEC    $B9,X   
LF5DA: DEX            
       BPL    LF5CA   
       LDA    $A9     
       BEQ    LF5E5   
       LDA    $AA     
       BNE    LF5E9   
LF5E5: LDA    #$01    
       STA    $B8     
LF5E9: SEC            
       LDA    BallXPos     
       SBC    $A5     
       STA    $A5     
       SEC            
       LDA    BallYPos     
       SBC    $A6     
       STA    $A6     
LF5F7: LDA    Current_Hole     
       ASL @     
       ASL @   
       TAY            
       SEC            
       LDA    Obstacle_Limit_X,Y 
       SBC    Obstacle_Start_X,Y 
       BEQ    LF621   
       LDA    ObstXPos     
       CMP    Obstacle_Limit_X,Y 
       BEQ    LF61B   
       CMP    Obstacle_Start_X,Y 
       BEQ    LF615   
       LDA    $AE     
       BEQ    LF61B   
LF615: INC    ObstXPos     
       LDA    #$01    
       BNE    LF63B   
LF61B: DEC    ObstXPos     
       LDA    #$00    
       BEQ    LF63B   
LF621: LDA    ObstYPos     
       CMP    Obstacle_Limit_Y,Y 
       BEQ    LF637   
       CMP    Obstacle_Start_Y,Y 
       BEQ    LF631   
       LDA    $AE     
       BEQ    LF637   
LF631: INC    ObstYPos     
       LDA    #$01    
       BNE    LF63B   
LF637: DEC    ObstYPos     
       LDA    #$00    
LF63B: STA    $AE     
       RTS            

LF63E: LDA    Current_Hole     
       STA    $AF     
       ASL @       
       TAX            
       LDA    START_X,X 
       STA    BallXPos     
       STA    ClubXPos      
       LDA    START_Y,X 
       STA    BallYPos     
       STA    ClubYPos     
       LDA    HOLE_X,X 
       STA    $9A     
       LDA    HOLE_Y,X 
       STA    HoleYPos     
       LDA    Current_Hole     
       ASL @       
       ASL @  
       TAY            
       LDA    Obstacle_Start_X,Y 
       STA    ObstXPos     
       LDA    Obstacle_Start_Y,Y 
       STA    ObstYPos     
       LDY    Current_Hole
       LDA    Obstacle_Size_SET,Y
       AND    #248
       STA    ObjectANDMask     
              
       LDA    Obstacle_Size_SET,Y
       AND    #7
       STA    NUSIZ0        
       STA    ObstNuSize
       
       LDA    #$01    
       STA    $AE     
       LDA    #$00    
       STA    $A9     
       STA    $AA     
       STA    $AD     
       LDA    $80     
       BMI    LF690   
       INC    $AF     
       LDA    $87     
       STA    $B1     
       LDA    $88     
       STA    $B2     
       LDA    $AF     
       STA    $87     
       LDX    Current_Hole     
       LDA    HOLEPAR,X 
       STA    $88     
LF690: RTS            

Position_Sprite:
			 LDA    First_Object_X_Pos,X   
       LDY    #$02    
       SEC            
LF696: INY            
       SBC    #$0F    
       BCS    LF696   
       EOR    #$FF    
       SBC    #$06    
       ASL @       
       ASL @   
       ASL @   
       ASL @   
       STY    WSYNC   
LF6A5: DEY            
       BPL    LF6A5   
       STA    RESP0,X 
       STA    HMP0,X  
       RTS            

REGISTER_COLOR_SET_COLOR 
			 DTA $86,$48,$1A,$C8
REGISTER_COLOR_SET_BW
			 DTA $06,$0E,$08,$0A

LF6B5: DTA $86
LF6B6: DTA $48,$86
LF6B8: DTA $86
LF6B9: DTA $4E
LF6BA: DTA $86

BIT_001  
			 DTA $01
BIT_002		
			 DTA $02
BIT_004 
			 DTA $04
BIT_008 
			 DTA $08
BIT_016
       DTA $10
BIT_032
			 DTA $20
BIT_064
       DTA $40
BIT_128
  		 DTA $80


PlayField_Section_Change
        DTA 085,075,066,056,047,037,028,018,009,000

  		 
LF6C3: DTA $55,$3F,$2A,$14,$02,$00
START_X:  ;X,Y,X,Y ....
			 DTA $87
START_Y:
			 DTA $0A,$50,$05,$08,$4B,$0A,$1A,$1C,$51,$0A,$2C,$0A,$48,$8C,$4B,$82
       DTA $21
HOLE_X:   ;X,Y,X,Y ....
 			 DTA $05
HOLE_Y: 
			 DTA $05,$50,$4B,$50,$26,$4F,$37,$91,$05,$91,$2C,$96,$48,$1A,$2C,$10
       DTA $4D
NUMERAL_DATA: 
        DTA $0E,$0A,$0A,$0A,$0E,$22,$22,$22,$22,$22,$EE,$22,$EE,$88,$EE,$EE
        DTA $22,$66,$22,$EE,$AA,$AA,$EE,$22,$22,$EE,$88,$EE,$22,$EE,$EE,$88
        DTA $EE,$AA,$EE,$EE,$22,$22,$22,$22,$EE,$AA,$EE,$AA,$EE,$EE,$AA,$EE
        DTA $22,$EE,$00,$00,$00,$00,$00
HoleStartIndex:
            DTA 000,030,060,090,120,150,180,210,240
HOLEPAR:
			 DTA $04,$03,$04,$04,$04,$03,$07,$03,$04
LF736: DTA $10
LF737: DTA $1D,$0B,$13

; Reworks for Playfield: 
; PlayField table for all courses start an every X number of bytes. 6 tables for each side of playfield
; Use ZP + Index Y for tables, (If ZP locations free)
;
;

            ORG $FC00
PlayField0:
HOLE1:     ;   C       S            
            DTA %00010000 ;0 
            DTA %00010000 ;1 
            DTA %00010000 ;2 
            DTA %00010000 ;3 
            DTA %00010000 ;4 
            DTA %00010000 ;5 
            DTA %00010000 ;6 
            DTA %00010000 ;7 
            DTA %00010000 ;8 
            DTA %00010000 ;9 
PlayField1:              
           ;     S      C                                                                  
            DTA %00000000 ;0 
            DTA %00000000 ;1 
            DTA %00000000 ;2 
            DTA %00000110 ;3 
            DTA %01100110 ;4 
            DTA %01100000 ;5 
            DTA %00000000 ;6 
            DTA %00000000 ;7 
            DTA %00000000 ;8 
            DTA %00000000 ;9 
PlayField2:                                                                                              
            ;   C       S
            DTA %11000000 ;0 
            DTA %00000000 ;1 
            DTA %00000000 ;2 
            DTA %00000110 ;3 
            DTA %00001111 ;4 
            DTA %00001111 ;5 
            DTA %10001111 ;6 
            DTA %10001111 ;7 
            DTA %11111111 ;8 
            DTA %11111111 ;9 
HOLE2:      ;   C       S
            DTA %00010000 ;0 
            DTA %00010000 ;1 
            DTA %00010000 ;2 
            DTA %01110000 ;3 
            DTA %01110000 ;4 
            DTA %00010000 ;5 
            DTA %00010000 ;6 
            DTA %00010000 ;7 
            DTA %11111100 ;8 
            DTA %11111111 ;9 
            ;    S      C 
            DTA %00000000 ;0 
            DTA %00000000 ;1 
            DTA %00000000 ;2 
            DTA %00000000 ;3 
            DTA %00000000 ;4 
            DTA %00000000 ;5 
            DTA %00000000 ;6 
            DTA %00000000 ;7 
            DTA %00000000 ;8 
            DTA %11111111 ;9 
            ;   C       S
            DTA %00000000 ;0 
            DTA %00000000 ;1 
            DTA %00000000 ;2 
            DTA %11111100 ;3 
            DTA %11111111 ;4 
            DTA %11111100 ;5 
            DTA %00000000 ;6 
            DTA %00000000 ;7 
            DTA %00000000 ;8 
            DTA %00000000 ;9 
HOLE3:      ;   C       S
            DTA %10010000 ;0
            DTA %10010000 ;1
            DTA %10010000 ;2
            DTA %00010000 ;3
            DTA %00010000 ;4
            DTA %00010000 ;5
            DTA %00010000 ;6
            DTA %00010000 ;7
            DTA %01110000 ;8
            DTA %01110000 ;9
            ;    S      C
            DTA %00000000 ;0
            DTA %00000000 ;1
            DTA %00000000 ;2
            DTA %00000000 ;3
            DTA %00000000 ;4
            DTA %00000000 ;5
            DTA %00000000 ;6
            DTA %00000000 ;7
            DTA %00000000 ;8
            DTA %00000000 ;9
            ;   C       S
            DTA %00000000 ;0
            DTA %00000000 ;1
            DTA %00000000 ;2
            DTA %11111111 ;3
            DTA %00001111 ;4
            DTA %00001111 ;5
            DTA %00000110 ;6
            DTA %00000110 ;7
            DTA %01100000 ;8
            DTA %01100000 ;9
HOLE4:      ;   C       S
            DTA %00010000 ;0
            DTA %00010000 ;1
            DTA %00010000 ;2
            DTA %00010000 ;3
            DTA %00010000 ;4
            DTA %00010000 ;5
            DTA %00010000 ;6
            DTA %00010000 ;7
            DTA %00010000 ;8
            DTA %00010000 ;9
            ;   S       c
            DTA %00000000 ;0
            DTA %00000000 ;1
            DTA %00000000 ;2
            DTA %10111111 ;3
            DTA %10111111 ;4
            DTA %10111111 ;5
            DTA %10111111 ;6
            DTA %10111111 ;7
            DTA %00000000 ;8
            DTA %00000000 ;9
            ;   C       S
            DTA %11110000 ;0
            DTA %00000000 ;1
            DTA %00000000 ;2
            DTA %00010000 ;3
            DTA %00111001 ;4
            DTA %00111001 ;5
            DTA %00111001 ;6
            DTA %11111111 ;7
            DTA %11111110 ;8
            DTA %11111110 ;9
HOLE5:      ;   C       S
            DTA %00010000 ;0 
            DTA %00010000 ;1 
            DTA %00010000 ;2 
            DTA %10010000 ;3 
            DTA %00010000 ;4 
            DTA %10010000 ;5 
            DTA %00010000 ;6 
            DTA %00010000 ;7 
            DTA %10010000 ;8 
            DTA %10010000 ;9 
            ;    S      C            
            DTA %00001111 ;0 
            DTA %00001111 ;1 
            DTA %00001111 ;2 
            DTA %11111110 ;3 
            DTA %11111100 ;4 
            DTA %11111000 ;5 
            DTA %00000000 ;6 
            DTA %00000000 ;7 
            DTA %11000000 ;8 
            DTA %11001111 ;9 
            ;   C       S            
            DTA %00000000 ;0 
            DTA %00000000 ;1 
            DTA %11000000 ;2 
            DTA %11000000 ;3 
            DTA %00000000 ;4 
            DTA %00000000 ;5 
            DTA %00000000 ;6 
            DTA %00000000 ;7 
            DTA %00000000 ;8 
            DTA %00110000 ;9 
HOLE6:      ;   C       S
            DTA %00010000 ;0 
            DTA %00010000 ;1 
            DTA %00010000 ;2 
            DTA %00010000 ;3 
            DTA %00010000 ;4 
            DTA %00010000 ;5 
            DTA %00010000 ;6 
            DTA %00010000 ;7 
            DTA %00010000 ;8 
            DTA %00010000 ;9 
            ;    S      C                     
            DTA %11111111 ;0 
            DTA %11111111 ;1 
            DTA %00111100 ;2 
            DTA %00000000 ;3 
            DTA %00000000 ;4 
            DTA %00000000 ;5 
            DTA %00000000 ;6 
            DTA %00111100 ;7 
            DTA %11111111 ;8 
            DTA %11111111 ;9 
            ;   C       S                    
            DTA %00000000 ;0 
            DTA %00000000 ;1 
            DTA %10000000 ;2 
            DTA %10000000 ;3 
            DTA %10000000 ;4 
            DTA %11000000 ;5 
            DTA %11000000 ;6 
            DTA %10000000 ;7 
            DTA %10000000 ;8 
            DTA %00000000 ;9         
HOLE7:      ;   C       S
            DTA %00010000 ;0
            DTA %00010000; 1
            DTA %00010000; 2
            DTA %00010000; 3
            DTA %00010000; 4
            DTA %00010000; 5
            DTA %00010000; 6
            DTA %00010000; 7
            DTA %00010000; 8
            DTA %00010000 ;9
            ;    S      C            
            DTA %00000100 ;0
            DTA %00000100; 1
            DTA %00000100; 2
            DTA %01111100; 3
            DTA %01000000; 4
            DTA %01000000; 5
            DTA %01000010; 6
            DTA %01000010; 7
            DTA %00000010; 8
            DTA %00000010 ;9
            ;   C       S            
            DTA %00010000 ;0
            DTA %00010000; 1 
            DTA %00010000; 2 
            DTA %00010000; 3
            DTA %00010000; 4 
            DTA %00010000; 5
            DTA %00000000; 6
            DTA %00000000; 7
            DTA %00010000; 8
            DTA %00010000; 9
HOLE8:      ;   C       S
            DTA %11111111 ;0
            DTA %11111111; 1
            DTA %11111111; 2
            DTA %00010000; 3
            DTA %00010000; 4
            DTA %00010000; 5
            DTA %00010000; 6
            DTA %00010000; 7
            DTA %11111111; 8 
            DTA %11111111; 9
            ;    S      C            
            DTA %00000000 ;0
            DTA %01000100 ;1
            DTA %01000100; 2
            DTA %00000000; 3
            DTA %01000100; 4
            DTA %01000100; 5
            DTA %00000000; 6
            DTA %01000100; 7
            DTA %11100000; 8
            DTA %11100000; 9
            ;   C       S            
            DTA %00000000; 0
            DTA %00000000; 1
            DTA %00000000; 2
            DTA %00000000; 3
            DTA %00000000; 4
            DTA %00000000; 5
            DTA %00000000; 6
            DTA %00000000; 7
            DTA %11000000; 8
            DTA %11100000; 9
HOLE9:      ;   C       S
            DTA %00010000 ;0
            DTA %00010000; 1
            DTA %00010000; 2
            DTA %11111111; 3
            DTA %11111111; 4
            DTA %11111111; 5
            DTA %00010000; 6
            DTA %00010000; 7
            DTA %11110000; 8 
            DTA %11110000; 9
            ;    S      C            
            DTA %00000000 ;0
            DTA %00000000; 1
            DTA %00000000; 2
            DTA %01111111; 3
            DTA %01111111; 4
            DTA %01111111; 5
            DTA %00000000; 6
            DTA %00000000; 7
            DTA %00111111; 8
            DTA %11111111; 9
            ;   C       S            
            DTA %01111111 ;0
            DTA %00111111; 1
            DTA %00011111; 2
            DTA %00001111; 3
            DTA %00000111; 4
            DTA %00000111; 5
            DTA %00000000; 6
            DTA %00000000; 7
            DTA %01010101; 8
            DTA %01000001; 9         
;            DTA %11111111                                                                      

;      If Obstacle_Start_X and Obstacle_Limit_X are same, Obstacle Moves Vertically
;      If Obstacle_Start_Y and Obstacle_Limit_Y are same, Obstacle Moves Horizontally
Obstacle_Start_X:
			 DTA $04
Obstacle_Limit_X: 
		 	 DTA $28
Obstacle_Start_Y: 
			 DTA $21
Obstacle_Limit_Y: 
       DTA $21
			 DTA $02,$8F,$17,$17
			 DTA $00,$20,$2C,$2C
			 DTA $38,$68,$46,$46
			 DTA $46,$46,$0C,$32
			 DTA $44,$44,$01,$50
			 DTA $4F,$4F,$05,$41
			 DTA $FF,$FF,$FF,$FF
			 DTA $02,$6E,$21,$21

Obstacle_Size_SET
       ;     1   2   3   4   5   6   7   8   9
       DTA $F5,$E9,$FB,$F8,$F8,$F8,$F8,$F8,$F8

;     Bit Use
;	 AND Mask - 87654     321 - NuSize  
; Second Digit +8 Normal Verical, +0 Double Size Vertical 
; First Digit: F = 1 copy Vertical, E = 2 copies Vertical FAR, 9 = 2 copies Vertical Close

;   Player-Missile number & player size
;   D2	D1	D0	1/2 television line (80 clocks)
;   8 clocks per square	Description
;0  0	0	0	X	 	 	 	 	 	 	 	 	one copy
;1  0	0	1	X	 	X	 	 	 	 	 	 	two copies - close
;2  0	1	0	X	 	 	 	X	 	 	 	 	two copies - med
;3  0	1	1	X	 	X	 	X	 	 	 	 	three copies - close
;4  1	0	0	X	 	 	 	 	 	 	 	X	two copies - wide
;5  1	0	1	X	X	 	 	 	 	 	 	 	double size player
;6  1	1	0	X	 	 	 	X	 	 	 	X	3 copies medium
;7  1	1	1	X	X	X	X	 	 	 	 	 	quad sized player


			 
            DTA $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
            DTA $EA,$EA,$EA,$EA,$EA,$EA,$EA						 			 
            ORG $FFFC
            DTA $00,$F0,$EA,$EA

