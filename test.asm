INCLUDE Irvine32.inc

.data
    ; Welcome screen messages
     titleMsg BYTE "     ________   ________   ________   _____ ______    ________   ________      ", 0ah
        BYTE "                        |\   __  \ |\   __  \ |\   ____\ |\   _ \  _   \ |\   __  \ |\   ___  \    ", 0ah
        BYTE "                        \ \  \|\  \\ \  \|\  \\ \  \___| \ \  \\\__\ \  \\ \  \|\  \\ \  \\ \  \   ", 0ah
        BYTE "                         \ \   ____\\ \   __  \\ \  \     \ \  \\|__| \  \\ \   __  \\ \  \\ \  \  ", 0ah
        BYTE "                          \ \  \___| \ \  \ \  \\ \  \____ \ \  \    \ \  \\ \  \ \  \\ \  \\ \  \ ", 0ah   
        BYTE "                           \ \__\     \ \__\ \__\\ \_______\\ \__\    \ \__\\ \__\ \__\\ \__\\ \__\", 0ah
        BYTE "                            \|__|      \|__|\|__| \|_______| \|__|     \|__| \|__|\|__| \|__| \|__|", 0
    promptMsg BYTE "Press any key to continue...", 0
    blankMsg BYTE "                           ", 0
    namePrompt BYTE "Enter Your Name: ", 0
    playerName BYTE 50 DUP(0)  ; Buffer for player's name
    nameLength DWORD 0         ; Length of entered name

    ; Main menu messages
    mainMenuMsg BYTE "Welcome, ", 0
    menuOptions BYTE "============================", 0ah
                BYTE "                    | 1. Start Game            |", 0ah
                BYTE "                    | 2. Instructions          |", 0ah
                BYTE "                    | 3. High Scores           |", 0ah
                BYTE "                    ============================", 0ah
                BYTE "                    Select an option (1-3): ", 0

    ; Instructions screen
    instrMsg BYTE "========== Instructions ==========", 0ah
             BYTE "W - Move Up", 0ah
             BYTE "A - Move Left", 0ah
             BYTE "S - Move Down", 0ah
             BYTE "D - Move Right", 0ah
             BYTE "P - Pause Game", 0ah
             BYTE "X - Exit Game", 0ah
             BYTE "=================================", 0ah
             BYTE "Press B to return to menu", 0ah, 0

    ; High score screen (placeholder)
    highScoreMsg BYTE "========== High Scores ==========", 0ah
                 BYTE "(Scores will be displayed here)", 0ah
                 BYTE "=================================", 0ah
                 BYTE "Press M to return to menu", 0ah, 0

    ; Level 1 maze (60x25, ~100 pellets, roll number 2583)
    level1Maze BYTE "============================================================", 0ah
               BYTE "|                                                          |", 0ah
               BYTE "| ##..##.... ............ ............ ............ ...... |", 0ah  ; 2 walls
               BYTE "| .......... ............ ............ ............ ...... |", 0ah
               BYTE "| ..... ##### ##### ..... ............ ............ ...... |", 0ah  ; 5-dot gap
               BYTE "| ..... ##### ##### ..... ............ ............ ...... |", 0ah
               BYTE "| ##### ............ ..... ##### ##### ............ ...... |", 0ah
               BYTE "| ##### ............ ..... ##### ##### ............ ...... |", 0ah
               BYTE "| .......... ##....## .... ............ ............ ..... |", 0ah
               BYTE "| .......... ##....## .... ............ ............ ..... |", 0ah
               BYTE "| ##### ##### ##### ..... ............ ..... ..... ..... .. |", 0ah
               BYTE "| ##### ##### ##### ..... ............ ..... ..... ..... .. |", 0ah
               BYTE "| .......... ............ ..... ##### ..... ..... ..... ... |", 0ah
               BYTE "| .......... ............ ..... ##### ..... ..... ..... ... |", 0ah
               BYTE "| ##..##.... ............ ............ ..... ..... ..... .. |", 0ah  ; 2 walls
               BYTE "| .......... ............ ............ ..... ..... ..... .. |", 0ah
               BYTE "| ..... ##### ##### ..... ............ ..... ..... ..... .. |", 0ah
               BYTE "| ..... ##### ##### ..... ............ ..... ..... ..... .. |", 0ah
               BYTE "| .......... ............ ..... ##### ..... ..... ..... ... |", 0ah
               BYTE "| .......... ............ ..... ##### ..... ..... ..... ... |", 0ah
               BYTE "| .......... ##....## .... ............ ..... ..... ..... .. |", 0ah
               BYTE "| .......... ##....## .... ............ ..... ..... ..... .. |", 0ah
               BYTE "| ... ............ ..... ............ ... ...... ... ...... |", 0ah  ; 3 pellets
               BYTE "| .......... ............ ............ ............ ...... |", 0ah
               BYTE "============================================================", 0ah, 0

.code
; Procedure to display welcome screen and get player's name
displayWelcome PROC
    push ebp
    mov ebp, esp
    ; Clear screen
    call Clrscr
    ; Display title in yellow
    mov eax, yellow
    call SetTextColor
    mov dl, 20
    mov dh, 5
    call Gotoxy
    mov edx, OFFSET titleMsg
    call WriteString
    ; Blinking prompt
blinkLoop:
    mov dl, 20
    mov dh, 13
    call Gotoxy
    mov eax, white
    call SetTextColor
    mov edx, OFFSET promptMsg
    call WriteString
    mov eax, 500
    call Delay
    mov dl, 20
    mov dh, 13
    call Gotoxy
    mov edx, OFFSET blankMsg
    call WriteString
    mov eax, 500
    call Delay
    call ReadKey
    jz blinkLoop
    ; Prompt for name
    call Clrscr
    mov dl, 20
    mov dh, 10
    call Gotoxy
    mov eax, white
    call SetTextColor
    mov edx, OFFSET namePrompt
    call WriteString
    mov edx, OFFSET playerName
    mov ecx, 50
    call ReadString
    mov nameLength, eax
    call Clrscr
    pop ebp
    ret
displayWelcome ENDP

; Procedure to display main menu
displayMainMenu PROC
    push ebp
    mov ebp, esp
    ; Clear screen
    call Clrscr
    ; Display welcome with player's name
    mov dl, 20
    mov dh, 5
    call Gotoxy
    mov eax, cyan
    call SetTextColor
    mov edx, OFFSET mainMenuMsg
    call WriteString
    mov edx, OFFSET playerName
    call WriteString
    call Crlf
    ; Display menu options
    mov dl, 20
    mov dh, 8
    call Gotoxy
    mov eax, white
    call SetTextColor
    mov edx, OFFSET menuOptions
    call WriteString
    ; Read user choice
    call ReadChar
    mov bl, al
    call Clrscr
    ; Handle choice
    cmp bl, '1'
    je startGame
    cmp bl, '2'
    je showInstructions
    cmp bl, '3'
    je showHighScores
    call displayMainMenu
startGame:
    jmp exitMenu
showInstructions:
    call displayInstructions
    call displayMainMenu
showHighScores:
    call displayHighScores
    call displayMainMenu
exitMenu:
    pop ebp
    ret
displayMainMenu ENDP

; Procedure to display instructions
displayInstructions PROC
    push ebp
    mov ebp, esp
    call Clrscr
    mov dl, 20
    mov dh, 5
    call Gotoxy
    mov eax, green
    call SetTextColor
    mov edx, OFFSET instrMsg
    call WriteString
waitForB:
    call ReadChar
    cmp al, 'b'
    jne waitForB
    call Clrscr
    pop ebp
    ret
displayInstructions ENDP

; Procedure to display high scores (placeholder)
displayHighScores PROC
    push ebp
    mov ebp, esp
    call Clrscr
    mov dl, 20
    mov dh, 5
    call Gotoxy
    mov eax, magenta
    call SetTextColor
    mov edx, OFFSET highScoreMsg
    call WriteString
waitForM:
    call ReadChar
    cmp al, 'm'
    jne waitForM
    call Clrscr
    pop ebp
    ret
displayHighScores ENDP

; Procedure to display Level 1 maze
displayLevel PROC
    push ebp
    mov ebp, esp
    ; Set cursor to (0,1) for maze
    mov dl, 0
    mov dh, 1
    call Gotoxy
    ; Set blue for walls, green for pellets
    mov eax, blue
    call SetTextColor
    mov edx, OFFSET level1Maze
    call WriteString
    mov eax, white
    call SetTextColor
    pop ebp
    ret
displayLevel ENDP

main PROC
    call displayWelcome
    call displayMainMenu
    ; Display Level 1 maze
    call displayLevel
    ; Wait for key press to exit
    call ReadKey
    exit
main ENDP
END main