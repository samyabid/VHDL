;-----------------------------------------------------------------------------
;  FILE NAME   : CODE2_TP2.asm
;  TARGET MCU  :  C8051F020
;  A FAIRE:
; - Tester le programme en laissant en commentaire les 2 appels
;   de sous-programme; Visualiser l'�volution de XDATA en faisant une ex�cution
;   avec points d'arr�t.
; - D�commenter les 2 lignes qui appellent les sous-programmes et tester de 
;   nouveau le code. S'assurer que le SP strlen_CODE fonctionne correctement
;   Mais, le fonctionnement du programme principal devrait �tre affect�, la m�moire
;   XDATA ne se remplissant plus comme pr�vu
; - Analyser le probl�me et intervenir sur le contenu du sous-programme pour 
;   r�soudre le probl�me
; - Une piste de r�flexion: Vu du programme appelant, le sous-programme ne doit
;   pas modifier le contenu de registres. Il faut donc que le SP les sauvegarde 
;   au d�but de son ex�cution et les restore � la fin. Comme lieu de stockage,
;   penser "pile"...
;-----------------------------------------------------------------------------
$include (c8051f020.inc)               ; Include register definition file.
;-----------------------------------------------------------------------------
; EQUATES
;-----------------------------------------------------------------------------
GREEN_LED      equ   P1.6              ; Port I/O pin connected to Green LED.
;-----------------------------------------------------------------------------
; Declarations Externes
;-----------------------------------------------------------------------------
;-----------------------------------------------------------------------------
; RESET and INTERRUPT VECTORS
;-----------------------------------------------------------------------------

               ; Reset Vector
               cseg AT 0          ; SEGMENT Absolu
               ljmp Main     ; Locate a jump to the start of code at 
                             ; the reset vector.

;-----------------------------------------------------------------------------
; CODE SEGMENT
;-----------------------------------------------------------------------------


Prog_base      segment  CODE

               rseg     Prog_base      ; Switch to this code segment.
               using    0              ; Specify register bank for the following
                                       ; program code.

CPE: db'CPE LYON',0
ELN3: db'Bienvenue en TP ELN3',0
 	
;******************************************************************************
; Programme Principal
;******************************************************************************
Main:
		mov WDTCN, #0DEh    
        mov WDTCN, #0ADh
		MOV DPTR,  #0
		mov A,#0	
		mov R4,#0
		mov R5,#1
Main_BCL:	
; Essai 1 de strlen_CODE
        mov  R6,#High(CPE)  ; Partie haute de l'adresse CPE
		mov  R7,#Low(CPE)   ; Partie basse de l'adresse CPE
        ;call strlen_CODE
        MOV  A,R7
		ADD  A,R4
		mov  R4,A
; Essai 2 de strlen_CODE	
        mov  R6,#High(ELN3)  ; Partie haute de l'adresse CPE
		mov  R7,#Low(ELN3)   ; Partie basse de l'adresse CPE
        ;call strlen_CODE
        MOV  A,R7
		ADD  A,R4
		mov  R4,A
; Ecriture dans XDATA		
        MOV  A,R5  
        MOVX @DPTR,A
        INC DPTR
		INC R5
Main_no_carry:		
         jmp   Main_BCL

;******************************************************************************
; Zone r�serv�e aux Sous programmes
;******************************************************************************

;******************************************************************************
; SOUS-PROGRAMME strlen_CODE
;
; Description: Sous-programme de determination de la longueur d'une chaine de 
;              caract�re stock�e dans l'espace CODE. La taille calcul�e ne tient 
;              pas compte du caract�re NULL (0)
;
; Param�tres d'entr�e:  R6-R7: Adresse de la chaine (R6 poids fort, R7 poids faible)
;						
;     
; Param�tres de sortie: R7 Taille de la chaine
; Registres modifi�s:  ?
; Pile: ? octets 
;******************************************************************************
strlen_CODE:
      mov DPH,R6
      mov DPL,R7
      mov R5,#0FFH
BCL1_strlen_CODE:
      inc R5
      mov A,R5
      movc A,@A+DPTR  
      jnz BCL1_strlen_CODE
	  mov R7,AR5
	  ret
; FIN SP strlen_CODE
;******************************************************************************	  

END
