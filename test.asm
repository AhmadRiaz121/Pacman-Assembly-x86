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
           BYTE "|   ####   #### ####   ####   #### ####   ####   #######   |", 0ah
           BYTE "============================================================", 0ah, 0


level2Maze BYTE "============================================================", 0ah
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
           BYTE "|   ####   #### ####   ####   #### ####   ####   #######   |", 0ah
           BYTE "============================================================", 0ah, 0





    ; Player variables
    playerX BYTE 30  ; Starting position (30,12)
    playerY BYTE 12
    inputChar BYTE 0

    ; Ghost variables
    ghostX BYTE 30   ; First ghost at (30,8)
    ghostY BYTE 8
    ghost2X BYTE 15  ; Second ghost at (15,8)
    ghost2Y BYTE 8
    ghost3X BYTE 45  ; Third ghost at (45,8)
    ghost3Y BYTE 8

    lives DWORD 3    ; Player lives
    livesMsg BYTE "Lives: ", 0
    gameOverMsg BYTE "Game Over! Press any key to exit.", 0
    score DWORD 0    ; Player score
    scoreMsg BYTE "Score: ", 0

.code
; Procedure to display welcome screen and get player's name
displayWelcome PROC
    push ebp
    mov ebp, esp
    call Clrscr
    mov eax, yellow
    call SetTextColor
    mov dl, 20
    mov dh, 5
    call Gotoxy
    mov edx, OFFSET titleMsg
    call WriteString
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
    mov eax, 13
    call WriteChar
    mov edx, OFFSET menuOptions
    call WriteString
    call ReadChar
    mov al, al
    cmp al, '1'
    je start_game
    cmp al, '2'
    je show_instructions
    cmp al, '3'
    je show_highscores
    jmp menu_loop
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
    mov dl, 0
    mov dh, 1
    call Gotoxy
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
    movzx eax, playerY
    sub eax, 1
    imul eax, 61
    movzx edx, playerX
    add eax, edx
    mov dl, level1Maze[eax]
    cmp dl, '#'
    je invalid
    cmp dl, '|'
    je invalid
    cmp dl, '='
    je invalid
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
    mov dl, 0
    mov dh, 27
    call Gotoxy
    mov eax, cyan
    call SetTextColor
    mov edx, OFFSET scoreMsg
    call WriteString
    mov eax, score
    call WriteDec
    mov eax, white
    call SetTextColor
    pop ebp
    ret
displayScore ENDP

; Procedure to move player and handle pellet eating
movePlayer PROC
    call clearPlayer

    ; Check input and move accordingly
    mov al, inputChar
    cmp al, 'w'
    je moveUp
    cmp al, 's'
    je moveDown
    cmp al, 'a'
    je moveLeft
    cmp al, 'd'
    je moveRight
    jmp doneMove

moveUp:
    dec playerY
    call isValidMove
    cmp eax, 0
    je undoMoveUp
    jmp check_pellets
undoMoveUp:
    inc playerY
    jmp doneMove

moveDown:
    inc playerY
    call isValidMove
    cmp eax, 0
    je undoMoveDown
    jmp check_pellets
undoMoveDown:
    dec playerY
    jmp doneMove

moveLeft:
    dec playerX
    call isValidMove
    cmp eax, 0
    je undoMoveLeft
    jmp check_pellets
undoMoveLeft:
    inc playerX
    jmp doneMove

moveRight:
    inc playerX
    call isValidMove
    cmp eax, 0
    je undoMoveRight
    jmp check_pellets
undoMoveRight:
    dec playerX
    jmp check_pellets

check_pellets:
    ; Check for pellet at new position
    movzx eax, playerY
    sub eax, 1
    imul eax, 61
    movzx edx, playerX
    add eax, edx
    mov bl, level1Maze[eax]
    cmp bl, '.'
    jne check_collisions
    mov byte ptr level1Maze[eax], ' '
    add score, 5

check_collisions:
    ; Check collision with Ghost 1
    mov bl, playerX
    cmp bl, ghostX
    jne check_ghost2
    mov bl, playerY
    cmp bl, ghostY
    jne check_ghost2
    dec lives
    mov playerX, 30
    mov playerY, 12
    jmp doneMove

check_ghost2:
    ; Check collision with Ghost 2
    mov bl, playerX
    cmp bl, ghost2X
    jne check_ghost3
    mov bl, playerY
    cmp bl, ghost2Y
    jne check_ghost3
    dec lives
    mov playerX, 30
    mov playerY, 12
    jmp doneMove

check_ghost3:
    ; Check collision with Ghost 3
    mov bl, playerX
    cmp bl, ghost3X
    jne no_collision
    mov bl, playerY
    cmp bl, ghost3Y
    jne no_collision
    dec lives
    mov playerX, 30
    mov playerY, 12

no_collision:
doneMove:
    call displayPlayer
    ret
movePlayer ENDP

; Procedure to display ghosts
displayGhost PROC
    mov dl, ghostX
    mov dh, ghostY
    call Gotoxy
    mov eax, red + (black SHL 4)
    call SetTextColor
    mov al, 'G'
    call WriteChar
    mov dl, ghost2X
    mov dh, ghost2Y
    call Gotoxy
    mov eax, magenta + (black SHL 4)
    call SetTextColor
    mov al, 'G'
    call WriteChar
    mov dl, ghost3X
    mov dh, ghost3Y
    call Gotoxy
    mov eax, cyan + (black SHL 4)
    call SetTextColor
    mov al, 'G'
    call WriteChar
    mov eax, white
    call SetTextColor
    ret
displayGhost ENDP

; Procedure to clear ghosts
clearGhost PROC
    mov dl, ghostX
    mov dh, ghostY
    call Gotoxy
    mov al, ' '
    call WriteChar
    mov dl, ghost2X
    mov dh, ghost2Y
    call Gotoxy
    mov al, ' '
    call WriteChar
    mov dl, ghost3X
    mov dh, ghost3Y
    call Gotoxy
    mov al, ' '
    call WriteChar
    ret
clearGhost ENDP

; Procedure to move ghosts
moveGhost PROC
    pushad
    call clearGhost
    mov al, ghostX
    cmp al, playerX
    je checkY1
    jl moveRight1
    jg moveLeft1
checkY1:
    mov al, ghostY
    cmp al, playerY
    je handleCollision1
    jl moveDown1
    jg moveUp1
    jmp doneGhost1
handleCollision1:
    dec lives
    mov playerX, 30
    mov playerY, 12
    jmp doneGhost1
moveRight1:
    inc ghostX
    call isValidGhostMove
    cmp eax, 0
    je undoMoveRight1
    jmp doneGhost1
undoMoveRight1:
    dec ghostX
    jmp doneGhost1
moveLeft1:
    dec ghostX
    call isValidGhostMove
    cmp eax, 0
    je undoMoveLeft1
    jmp doneGhost1
undoMoveLeft1:
    inc ghostX
    jmp doneGhost1
moveUp1:
    dec ghostY
    call isValidGhostMove
    cmp eax, 0
    je undoMoveUp1
    jmp doneGhost1
undoMoveUp1:
    inc ghostY
    jmp doneGhost1
moveDown1:
    inc ghostY
    call isValidGhostMove
    cmp eax, 0
    je undoMoveDown1
    jmp doneGhost1
undoMoveDown1:
    dec ghostY
doneGhost1:
    popad
    pushad
    mov al, ghost2X
    cmp al, playerX
    je checkY2
    jl moveRight2
    jg moveLeft2
checkY2:
    mov al, ghost2Y
    cmp al, playerY
    je handleCollision2
    jl moveDown2
    jg moveUp2
    jmp doneGhost2
handleCollision2:
    dec lives
    mov playerX, 30
    mov playerY, 12
    jmp doneGhost2
moveRight2:
    inc ghost2X
    call isValidGhost2Move
    cmp eax, 0
    je undoMoveRight2
    jmp doneGhost2
undoMoveRight2:
    dec ghost2X
    jmp doneGhost2
moveLeft2:
    dec ghost2X
    call isValidGhost2Move
    cmp eax, 0
    je undoMoveLeft2
    jmp doneGhost2
undoMoveLeft2:
    inc ghost2X
    jmp doneGhost2
moveUp2:
    dec ghost2Y
    call isValidGhost2Move
    cmp eax, 0
    je undoMoveUp2
    jmp doneGhost2
undoMoveUp2:
    inc ghost2Y
    jmp doneGhost2
moveDown2:
    inc ghost2Y
    call isValidGhost2Move
    cmp eax, 0
    je undoMoveDown2
    jmp doneGhost2
undoMoveDown2:
    dec ghost2Y
doneGhost2:
    popad
    pushad
    mov al, ghost3X
    cmp al, playerX
    je checkY3
    jl moveRight3
    jg moveLeft3
checkY3:
    mov al, ghost3Y
    cmp al, playerY
    je handleCollision3
    jl moveDown3
    jg moveUp3
    jmp doneGhost3
handleCollision3:
    dec lives
    mov playerX, 30
    mov playerY, 12
    jmp doneGhost3
moveRight3:
    inc ghost3X
    call isValidGhost3Move
    cmp eax, 0
    je undoMoveRight3
    jmp doneGhost3
undoMoveRight3:
    dec ghost3X
    jmp doneGhost3
moveLeft3:
    dec ghost3X
    call isValidGhost3Move
    cmp eax, 0
    je undoMoveLeft3
    jmp doneGhost3
undoMoveLeft3:
    inc ghost3X
    jmp doneGhost3
moveUp3:
    dec ghost3Y
    call isValidGhost3Move
    cmp eax, 0
    je undoMoveUp3
    jmp doneGhost3
undoMoveUp3:
    inc ghost3Y
    jmp doneGhost3
moveDown3:
    inc ghost3Y
    call isValidGhost3Move
    cmp eax, 0
    je undoMoveDown3
    jmp doneGhost3
undoMoveDown3:
    dec ghost3Y
doneGhost3:
    popad
    call displayGhost
    ret
moveGhost ENDP

; Procedure to validate ghost 1 move
isValidGhostMove PROC
    push ebp
    mov ebp, esp
    movzx eax, ghostY
    sub eax, 1
    imul eax, 61
    movzx edx, ghostX
    add eax, edx
    mov dl, level1Maze[eax]
    cmp dl, '#'
    je invalid_ghost
    cmp dl, '|'
    je invalid_ghost
    cmp dl, '='
    je invalid_ghost
    mov eax, 1
    jmp done_ghost
invalid_ghost:
    mov eax, 0
done_ghost:
    pop ebp
    ret
isValidGhostMove ENDP

; Procedure to validate ghost 2 move
isValidGhost2Move PROC
    push ebp
    mov ebp, esp
    movzx eax, ghost2Y
    sub eax, 1
    imul eax, 61
    movzx edx, ghost2X
    add eax, edx
    mov dl, level1Maze[eax]
    cmp dl, '#'
    je invalid_ghost2
    cmp dl, '|'
    je invalid_ghost2
    cmp dl, '='
    je invalid_ghost2
    mov eax, 1
    jmp done_ghost2
invalid_ghost2:
    mov eax, 0
done_ghost2:
    pop ebp
    ret
isValidGhost2Move ENDP

; Procedure to validate ghost 3 move
isValidGhost3Move PROC
    push ebp
    mov ebp, esp
    movzx eax, ghost3Y
    sub eax, 1
    imul eax, 61
    movzx edx, ghost3X
    add eax, edx
    mov dl, level1Maze[eax]
    cmp dl, '#'
    je invalid_ghost3
    cmp dl, '|'
    je invalid_ghost3
    cmp dl, '='
    je invalid_ghost3
    mov eax, 1
    jmp done_ghost3
invalid_ghost3:
    mov eax, 0
done_ghost3:
    pop ebp
    ret
isValidGhost3Move ENDP

; Procedure to display lives at fixed position
displayLives PROC
    push ebp
    mov ebp, esp
    mov dl, 0
    mov dh, 28
    call Gotoxy
    mov eax, yellow
    call SetTextColor
    mov edx, OFFSET livesMsg
    call WriteString
    mov eax, lives
    call WriteDec
    mov eax, white
    call SetTextColor
    pop ebp
    ret
displayLives ENDP

main PROC
    call displayWelcome
    call displayMainMenu 
gameLoop:
    call displayLevel
    call displayGhost
    call displayPlayer
    call displayScore
    call displayLives
    call ReadChar
    mov inputChar, al
    cmp inputChar, 'x'
    je exitGame
    call movePlayer
    call moveGhost
    cmp lives, 0
    je gameOver
    jmp gameLoop
gameOver:
    call Clrscr
    mov edx, OFFSET gameOverMsg
    call WriteString
    call ReadKey
exitGame:
    call Clrscr
    exit
main ENDP

END main
