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
    menuOptions BYTE "                    ============================", 0ah
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
    ; Mutable data because pellets need to be eaten ('.' replaced with ' ')
    level1Maze BYTE "============================================================", 0ah
           BYTE "|                                                          |", 0ah
           BYTE "|   ####   .........   ####   .........   ####   .......   |", 0ah
           BYTE "|   #  #   .........   #  #   .........   #  #   .......   |", 0ah
           BYTE "|   #  #   ###   ###   #  #   ###   ###   #  #   ### ###   |", 0ah
           BYTE "|   #  #   #       #   #  #   #       #   #  #   #     #   |", 0ah
           BYTE "|   ####   #       #   ####   #       #   ####   #     #   |", 0ah
           BYTE "|          #       #          #       #          #     #   |", 0ah
           BYTE "|   ####   #       #   ####   #       #   ####   #     #   |", 0ah
           BYTE "|   #  #   ###   ###   #  #   ###   ###   #  #   ### ###   |", 0ah
           BYTE "|   #  #   .........   #  #   .........   #  #   .......   |", 0ah
           BYTE "|   #  #   .........   #  #   .........   #  #   .......   |", 0ah
           BYTE "|   ####   #### ####   ####   #### ####   ####   ######    |", 0ah
           BYTE "|                                                          |", 0ah
           BYTE "|   ####   .........   ####   .........   ####   .......   |", 0ah
           BYTE "|   #  #   .........   #  #   .........   #  #   .......   |", 0ah
           BYTE "|   #  #   ###   ###   #  #   ###   ###   #  #   ### ###   |", 0ah
           BYTE "|   #  #   #       #   #  #   #       #   #  #   #     #   |", 0ah
           BYTE "|   ####   #       #   ####   #       #   ####   #     #   |", 0ah
           BYTE "|          #       #          #       #          #     #   |", 0ah
           BYTE "|   ####   #       #   ####   #       #   ####   #     #   |", 0ah
           BYTE "|   #  #   ###   ###   #  #   ###   ###   #  #   ### ###   |", 0ah
           BYTE "|   #  #   .........   #  #   .........   #  #   .......   |", 0ah
           BYTE "|   #  #   .........   #  #   .........   #  #   .......   |", 0ah
           BYTE "|   ####   #### ####   ####   #### ####   ####   ######    |", 0ah
           BYTE "============================================================", 0ah, 0

    ; Player variables
    playerX BYTE 30  ; Starting position (30,12)
    playerY BYTE 12
    inputChar BYTE 0

    score DWORD 0    ; Player score

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

; Procedure to display the main menu and handle selection
displayMainMenu PROC
    push ebp
    mov ebp, esp
menu_loop:
    call Clrscr
    mov edx, OFFSET mainMenuMsg
    call WriteString
    mov edx, OFFSET playerName
    call WriteString
    ; New line after Welcome, <name>
    mov eax, 13
    call WriteChar
    mov edx, OFFSET menuOptions
    call WriteString

    call ReadChar
    mov al, al           ; input in AL
    cmp al, '1'
    je start_game
    cmp al, '2'
    je show_instructions
    cmp al, '3'
    je show_highscores
    jmp menu_loop        ; Invalid input, loop menu

start_game:
    pop ebp
    ret

show_instructions:
    call displayInstructions
    jmp menu_loop

show_highscores:
    call displayHighScores
    jmp menu_loop

displayMainMenu ENDP

; Procedure to display instructions screen
displayInstructions PROC
    push ebp
    mov ebp, esp
instr_loop:
    call Clrscr
    mov edx, OFFSET instrMsg
    call WriteString
    call ReadChar
    ; Wait for B or b to return to menu
    cmp al, 'B'
    je done_instr
    cmp al, 'b'
    je done_instr
    jmp instr_loop
done_instr:
    pop ebp
    ret
displayInstructions ENDP

; Procedure to display high scores screen
displayHighScores PROC
    push ebp
    mov ebp, esp
highscores_loop:
    call Clrscr
    mov edx, OFFSET highScoreMsg
    call WriteString
    call ReadChar
    ; Wait for M or m to return to menu
    cmp al, 'M'
    je done_scores
    cmp al, 'm'
    je done_scores
    jmp highscores_loop
done_scores:
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
    ; Set green for walls and pellets
    mov eax, green
    call SetTextColor
    mov edx, OFFSET level1Maze
    call WriteString
    mov eax, white
    call SetTextColor
    pop ebp
    ret
displayLevel ENDP

; Procedure to display player
displayPlayer PROC
    mov dl, playerX
    mov dh, playerY
    call Gotoxy
    mov al, 'X'
    call WriteChar
    ret
displayPlayer ENDP

; Procedure to clear the player's previous position
clearPlayer PROC
    mov dl, playerX
    mov dh, playerY
    call Gotoxy
    mov al, ' '
    call WriteChar
    ret
clearPlayer ENDP

; Procedure to check if the next position is valid
isValidMove PROC
    push ebp
    mov ebp, esp
    ; Calculate the maze index based on coordinates
    movzx eax, playerY  ; Zero-extend playerY into eax
    sub eax, 1
    imul eax, 61         ; Each row is 60 chars + newline
    movzx edx, playerX   ; Zero-extend playerX into edx
    add eax, edx
    mov dl, level1Maze[eax]  ; Get char at target position
    cmp dl, '#'             ; Wall
    je invalid
    cmp dl, '|'             ; Wall boundary
    je invalid
    cmp dl, '='             ; Wall boundary
    je invalid
    ; Allow spaces and pellets '.'
    mov eax, 1
    jmp done
invalid:
    mov eax, 0
done:
    pop ebp
    ret
isValidMove ENDP

; Procedure to display score at fixed position
displayScore PROC
    push ebp
    mov ebp, esp

    ; Position cursor under maze (row 27, col 0)
    mov dl, 0
    mov dh, 27
    call Gotoxy

    ; Set color cyan for score display
    mov eax, cyan
    call SetTextColor

    mov edx, OFFSET scoreMsg
    call WriteString

    ; Convert score DWORD to string and display
    mov eax, score
    call WriteDec

    ; Reset color white
    mov eax, white
    call SetTextColor

    pop ebp
    ret
displayScore ENDP

scoreMsg BYTE "Score: ", 0

; Procedure to move player and handle pellet eating
movePlayer PROC
    call clearPlayer

    ; Save old playerX, playerY for validating move & checking maze char
    mov al, inputChar
    cmp al, 'w'
    je moveUp
    cmp al, 's'
    je moveDown
    cmp al, 'a'
    je moveLeft
    cmp al, 'd'
    je moveRight
    jmp done

moveUp:
    dec playerY
    call isValidMove
    cmp eax, 0
    je undoMoveUp
    jmp check_pellets
undoMoveUp:
    inc playerY
    jmp done

moveDown:
    inc playerY
    call isValidMove
    cmp eax, 0
    je undoMoveDown
    jmp check_pellets
undoMoveDown:
    dec playerY
    jmp done

moveLeft:
    dec playerX
    call isValidMove
    cmp eax, 0
    je undoMoveLeft
    jmp check_pellets
undoMoveLeft:
    inc playerX
    jmp done

moveRight:
    inc playerX
    call isValidMove
    cmp eax, 0
    je undoMoveRight
    jmp check_pellets
undoMoveRight:
    dec playerX

check_pellets:
    ; Calculate maze index for current player position
    movzx eax, playerY
    sub eax, 1
    imul eax, 61
    movzx edx, playerX
    add eax, edx

    ; get character at maze position
    mov bl, level1Maze[eax]

    cmp bl, '.'
    jne skip_eat

    ; Eat pellet: replace '.' with ' ' in maze
    mov byte ptr level1Maze[eax], ' '

    ; Increase score by 5
    add score, 5

skip_eat:
    call displayPlayer
    ret

done:
    call displayPlayer
    ret
movePlayer ENDP

main PROC
    call displayWelcome
    call displayMainMenu  ; Show main menu and get user choice

gameLoop:
    call displayLevel      ; Display maze
    call displayPlayer     ; Display player
    call displayScore      ; Display score
    call ReadChar          ; Read user input
    mov inputChar, al
    cmp inputChar, 'x'     ; Exit on 'x'
    je exitGame
    call movePlayer        ; Move player and handle eating
    jmp gameLoop

exitGame:
    call Clrscr
    exit
main ENDP
END main
