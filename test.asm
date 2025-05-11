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
             BYTE "Collect dots (.) for 1 point", 0ah
             BYTE "Collect fruits (@) for 50 points", 0ah
             BYTE "=================================", 0ah
             BYTE "Press B to return to menu", 0ah, 0

    ; High score screen (placeholder)
    highScoreMsg BYTE "========== High Scores ==========", 0ah
                 BYTE "(Scores will be displayed here)", 0ah
                 BYTE "=================================", 0ah
                 BYTE "Press M to return to menu", 0ah, 0

    ; Level 1 maze (60x25) with fruit at (10,5)
    level1Maze BYTE "============================================================", 0ah
           BYTE "|                                                          |", 0ah
           BYTE "|   ####   .........   ####   .........   ####   .......   |", 0ah
           BYTE "|   #  #   .........   #  #   .........   #  #   .......   |", 0ah
           BYTE "|   #  #   ###   ###   #  #   ###   ###   #  #   ### ###   |", 0ah
           BYTE "|   #  #   @....   #   #  #   #       #   #  #   #     #   |", 0ah
           BYTE "|   ####   #       #   ####   #       #   ####   #     #   |", 0ah
           BYTE "|          #       #          #       #          #     #   |", 0ah
           BYTE "|   ####   #       #   ####   #       #   ####   #     #   |", 0ah
           BYTE "|   #  #   ###   ###   #  #   ###   ###   #  #   ### ###   |", 0ah
           BYTE "|   #  #   .........   #  #   .........   #  #   .......   |", 0ah
           BYTE "|   #  #   .........   #  #   .........   #  #   .......   |", 0ah
           BYTE "|   ####   #### ####   ####   #### ####   ####   #######   |", 0ah
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

    ; Level 2 maze with fruit at (20,10)
    Level2Maze BYTE "########################################################################################", 0ah
           BYTE "# ...................................................................................  #", 0ah
           BYTE "# .. ########################## ........########################################## ..  #", 0ah
           BYTE "# .. ##                                                                         ## ..  #", 0ah
           BYTE "# .. ##     ############################################         ############ .......  #", 0ah
           BYTE "# .. ##                                                             ....   ####### ..  #", 0ah
           BYTE "# .. ##                 ......   #################    .....                     ## ..  #", 0ah
           BYTE "# .. ## ..  ##       ##############   .......   ##############                  ## ..  #", 0ah
           BYTE "# .. ## ..  ##                                                                  ## ..  #", 0ah
           BYTE "# .. ## ..  ##    ###########.@#########..##################..###############   ## ..  #", 0ah
           BYTE "# .. ## ..  ##                                                                  ## ..  #", 0ah
           BYTE "# .. ## ..  ##                                                                  ## ..  #", 0ah
           BYTE "# ........  ##    ###########         #################      ## .      ##       .. ..  #", 0ah
           BYTE "# .. ## ..  ##                                               ## .      ##       ## ..  #", 0ah
           BYTE "# .. ## ..  ##       ........                             .. ## .      ##       ## ..  #", 0ah
           BYTE "# .. ## ..  ##       ########          ## . ##     ## .. ########      ##       ## ..  #", 0ah
           BYTE "# .. ## ..  ##       ## .. ##          ## . ##     ## .. ## . .        ##       ## ..  #", 0ah
           BYTE "# .. ## ..  ##       ## .. ##    ######## . ##     ## .. ## .          ##       ## ..  #", 0ah
           BYTE "# .. ## ..  ##       ## .. ##     .... ## . ##     ######## .          ##       ## ..  #", 0ah
           BYTE "# .. ## ..  ##                         ## . ##                         ##       ## ..  #", 0ah
           BYTE "# ........  ##  ######################### . #############################       ## ..  #", 0ah
           BYTE "# .. ## ..  ##                                                                  ## ..  #", 0ah
           BYTE "# .. ############################################# ....... ####################### ..  #", 0ah           
           BYTE "# ...................................................................................  #", 0ah
           BYTE "########################################################################################", 0

    ; Level 3 maze
    Level3Maze BYTE "########################################################################################", 0ah
           BYTE "#                                                       ...                            #", 0ah
           BYTE "#                                                 ...  ######     ##        ######     #", 0ah
           BYTE "#      #############       ##               ...  ######           ##        ## ..      #", 0ah
           BYTE "#      ####### .....       ## ...     ...  ######            ...  ##        ## ..      #", 0ah
           BYTE "#                 ##       ######## .######                 ########        ## ..      #", 0ah
           BYTE "#######           ##       ##               ...                   ##    ##########     #", 0ah
           BYTE "# ....            ##       ##   ....       ###### ...             ##                   #", 0ah
           BYTE "#                 ##       ##    ....       ...  ###### ...                     ### .. #", 0ah
           BYTE "########## . #########     ##     ....            ...  ######   ########### . ##########", 0ah
           BYTE "########## . #########                                  ...     ########### . ##########", 0ah
           BYTE "########## . #########                                          ########### . ##########", 0ah
           BYTE " .........                     ########################        ...........             ", 0ah
           BYTE "########## . #########                                          ########### . ##########", 0ah
           BYTE "########## . #########                                ####      ########### . ##########", 0ah
           BYTE "########## . #########      ############              .. #      ########### . ##########", 0ah
           BYTE "#   ..  ##                  ## .................                                       #", 0ah
           BYTE "#   ..  ##                  ## .### .#############. ####          ##                   #", 0ah
           BYTE "#   ..  ##  .....           ## .### .#############. ####          ## .#####            #", 0ah
           BYTE "#   ..  ##########          ## .######## ...... ##. ####          ## .#####            #", 0ah
           BYTE "#   ####  ...... #####      ## .###### .. ####  ... ####          ## ...........       #", 0ah
           BYTE "#         ###   ......      ## .###### .################          ##############       #", 0ah
           BYTE "#           ####                                                    ........  ##       #", 0ah
           BYTE "#                                                                                      #", 0ah
           BYTE "########################################################################################", 0 

    gameWon BYTE "               ___    ___  ________   ___  ___          ___       __    ________   ________           ___         ", 0ah  
        BYTE "              |\  \  /  /||\   __  \ |\  \|\  \        |\  \     |\  \ |\   __  \ |\   ___  \        |\  \        ", 0ah  
        BYTE "              \ \  \/  / /\ \  \|\  \\ \  \\\  \       \ \  \    \ \  \\ \  \|\  \\ \  \\ \  \       \ \  \       ", 0ah  
        BYTE "               \ \    / /  \ \  \\\  \\ \  \\\  \       \ \  \  __\ \  \\ \  \\\  \\ \  \\ \  \       \ \  \      ", 0ah  
        BYTE "                \/  /  /    \ \  \\\  \\ \  \\\  \       \ \  \|\__\_\  \\ \  \\\  \\ \  \\ \  \       \ \__\     ", 0ah  
        BYTE "              __/  / /       \ \_______\\ \_______\       \ \____________\\ \_______\\ \__\\ \__\       \|__|     ", 0ah  
        BYTE "             |\___/ /         \|_______| \|_______|        \|____________| \|_______| \|__| \|__|           ___   ", 0ah  
        BYTE "             \|___|/                                                                                       |\__\ ", 0ah   
        BYTE "                                                                                                           \|__| ", 0  

    ; Game end screen
    game_end_screen BYTE "  ______    ______   __       __  ________         ______   __     __  ________  _______  ",0ah  
        BYTE " /      \  /      \ |  \     /  \|        \       /      \ |  \   |  \|        \|       \  ",0ah 
        BYTE "|  $$$$$$\|  $$$$$$\| $$\   /  $$| $$$$$$$$      |  $$$$$$\| $$   | $$| $$$$$$$$| $$$$$$$\",0ah
        BYTE "| $$ __\$$| $$__| $$| $$$\ /  $$$| $$__          | $$  | $$| $$   | $$| $$__    | $$__| $$",0ah
        BYTE "| $$|    \| $$    $$| $$$$\  $$$$| $$  \         | $$  | $$ \$$\ /  $$| $$  \   | $$    $$",0ah
        BYTE "| $$ \$$$$| $$$$$$$$| $$\$$ $$ $$| $$$$$         | $$  | $$  \$$\  $$ | $$$$$   | $$$$$$$\",0ah
        BYTE "| $$__| $$| $$  | $$| $$ \$$$| $$| $$_____       | $$__/ $$   \$$ $$  | $$_____ | $$  | $$",0ah
        BYTE " \$$    $$| $$  | $$| $$  \$ | $$| $$     \       \$$    $$    \$$$   | $$     \| $$  | $$",0ah
        BYTE "  \$$$$$$  \$$   \$$ \$$      \$$ \$$$$$$$$        \$$$$$$      \$     \$$$$$$$$ \$$   \$$ ",0ah

    ; Player variables
    playerX BYTE 30  ; Starting position (30,12)
    playerY BYTE 12
    inputChar BYTE 0
    lastInput BYTE 'd'  ; Default starting direction (right)
    playerMoveCounter DWORD 0  ; Counter for player movement frequency

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
    currentLevel BYTE 1  ; Tracks current level (1, 2, or 3)
    scoreMsg BYTE "Score: ", 0
    randomSeed DWORD ?   ; For random number generator
    moveCounter DWORD 0  ; Counter for ghost movement frequency
    gameWonFlag BYTE 0   ; Flag to indicate game won

.code
; Initialize random seed
initRandom PROC
    push eax
    call Randomize
    pop eax
    ret
initRandom ENDP

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

; Procedure to display game won screen
displayGameWon PROC
    call Clrscr
    mov eax, yellow
    call SetTextColor
    mov edx, OFFSET gameWon
    call WriteString
    mov eax, white
    call SetTextColor
    call ReadKey
    ret
displayGameWon ENDP

; Procedure to display Level maze
displayLevel PROC
    push ebp
    mov ebp, esp
    mov dl, 0
    mov dh, 1
    call Gotoxy
    mov eax, green
    call SetTextColor
    cmp currentLevel, 1
    je displayLevel1
    cmp currentLevel, 2
    je displayLevel2
    mov edx, OFFSET Level3Maze
    jmp displayMaze
displayLevel1:
    mov edx, OFFSET level1Maze
    jmp displayMaze
displayLevel2:
    mov edx, OFFSET Level2Maze
displayMaze:
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
    mov ecx, 61                  ; Row length for level 1
    cmp currentLevel, 1
    je setRowLength
    mov ecx, 89                  ; Row length for level 2 and 3
setRowLength:
    imul eax, ecx                ; Multiply by row length
    movzx edx, playerX
    add eax, edx
    cmp currentLevel, 1
    je checkLevel1
    cmp currentLevel, 2
    je checkLevel2
    mov dl, Level3Maze[eax]
    jmp checkValid
checkLevel1:
    mov dl, level1Maze[eax]
    jmp checkValid
checkLevel2:
    mov dl, Level2Maze[eax]
checkValid:
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

; Procedure to move player and handle pellet and fruit eating
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
    movzx eax, playerY
    sub eax, 1
    mov ecx, 61                  ; Row length for level 1
    cmp currentLevel, 1
    je setRowLengthPellet
    mov ecx, 89                  ; Row length for level 2 and 3
setRowLengthPellet:
    imul eax, ecx                ; Multiply by row length
    movzx edx, playerX
    add eax, edx
    cmp currentLevel, 1
    je checkLevel1Pellet
    cmp currentLevel, 2
    je checkLevel2Pellet
    mov bl, Level3Maze[eax]
    cmp bl, '.'
    je collectPellet
    cmp bl, '@'
    je collectFruit
    jmp check_collisions
checkLevel1Pellet:
    mov bl, level1Maze[eax]
    cmp bl, '.'
    je collectPellet1
    cmp bl, '@'
    je collectFruit1
    jmp check_collisions
checkLevel2Pellet:
    mov bl, Level2Maze[eax]
    cmp bl, '.'
    je collectPellet2
    cmp bl, '@'
    je collectFruit2
    jmp check_collisions
collectPellet:
    mov byte ptr Level3Maze[eax], ' '
    add score, 1
    jmp checkWinCondition
collectFruit:
    mov byte ptr Level3Maze[eax], ' '
    add score, 50
    jmp checkWinCondition
collectPellet1:
    mov byte ptr level1Maze[eax], ' '
    add score, 1
    jmp checkLevelTransition
collectFruit1:
    mov byte ptr level1Maze[eax], ' '
    add score, 50
    jmp checkLevelTransition
collectPellet2:
    mov byte ptr Level2Maze[eax], ' '
    add score, 1
    jmp checkLevelTransition
collectFruit2:
    mov byte ptr Level2Maze[eax], ' '
    add score, 50
    jmp checkLevelTransition

checkWinCondition:
    cmp score, 865
    jne checkLevelTransition
    cmp currentLevel, 3
    jne checkLevelTransition
    mov gameWonFlag, 1
    jmp doneMove

checkLevelTransition:
    cmp score, 254
    jne checkLevel3
    cmp currentLevel, 1
    jne checkLevel3
    mov currentLevel, 2
    ; Reset player and ghost positions
    mov playerX, 30
    mov playerY, 12
    mov ghostX, 30
    mov ghostY, 8
    mov ghost2X, 15
    mov ghost2Y, 8
    mov ghost3X, 45
    mov ghost3Y, 8
    call clearPlayer
    call clearGhost
    call displayLevel
    call displayGhost
    call displayPlayer
    jmp check_collisions
checkLevel3:
    cmp score, 680
    jne check_collisions
    cmp currentLevel, 2
    jne check_collisions
    mov currentLevel, 3
    ; Reset player and ghost positions
    mov playerX, 30
    mov playerY, 12
    mov ghostX, 30
    mov ghostY, 8
    mov ghost2X, 15
    mov ghost2Y, 8
    mov ghost3X, 45
    mov ghost3Y, 8
    call clearPlayer
    call clearGhost
    call displayLevel
    call displayGhost
    call displayPlayer

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

; Procedure to move ghosts randomly
moveGhost PROC
    pushad
    call clearGhost
    inc moveCounter
    cmp moveCounter, 5   ; Move every 5th loop (~100ms)
    jb skipGhostMove
    mov moveCounter, 0   ; Reset counter

    ; Move Ghost 1
    call Random32
    and eax, 3           ; Random 0-3 (up, down, left, right)
    cmp eax, 0
    je tryUp1
    cmp eax, 1
    je tryDown1
    cmp eax, 2
    je tryLeft1
    jmp tryRight1
tryUp1:
    dec ghostY
    call isValidGhostMove
    cmp eax, 0
    je undoUp1
    jmp doneGhost1
undoUp1:
    inc ghostY
    jmp doneGhost1
tryDown1:
    inc ghostY
    call isValidGhostMove
    cmp eax, 0
    je undoDown1
    jmp doneGhost1
undoDown1:
    dec ghostY
    jmp doneGhost1
tryLeft1:
    dec ghostX
    call isValidGhostMove
    cmp eax, 0
    je undoLeft1
    jmp doneGhost1
undoLeft1:
    inc ghostX
    jmp doneGhost1
tryRight1:
    inc ghostX
    call isValidGhostMove
    cmp eax, 0
    je undoRight1
    jmp doneGhost1
undoRight1:
    dec ghostX
doneGhost1:

    ; Move Ghost 2
    call Random32
    and eax, 3
    cmp eax, 0
    je tryUp2
    cmp eax, 1
    je tryDown2
    cmp eax, 2
    je tryLeft2
    jmp tryRight2
tryUp2:
    dec ghost2Y
    call isValidGhost2Move
    cmp eax, 0
    je undoUp2
    jmp doneGhost2
undoUp2:
    inc ghost2Y
    jmp doneGhost2
tryDown2:
    inc ghost2Y
    call isValidGhost2Move
    cmp eax, 0
    je undoDown2
    jmp doneGhost2
undoDown2:
    dec ghost2Y
    jmp doneGhost2
tryLeft2:
    dec ghost2X
    call isValidGhost2Move
    cmp eax, 0
    je undoLeft2
    jmp doneGhost2
undoLeft2:
    inc ghost2X
    jmp doneGhost2
tryRight2:
    inc ghost2X
    call isValidGhost2Move
    cmp eax, 0
    je undoRight2
    jmp doneGhost2
undoRight2:
    dec ghost2X
doneGhost2:

    ; Move Ghost 3
    call Random32
    and eax, 3
    cmp eax, 0
    je tryUp3
    cmp eax, 1
    je tryDown3
    cmp eax, 2
    je tryLeft3
    jmp tryRight3
tryUp3:
    dec ghost3Y
    call isValidGhost3Move
    cmp eax, 0
    je undoUp3
    jmp doneGhost3
undoUp3:
    inc ghost3Y
    jmp doneGhost3
tryDown3:
    inc ghost3Y
    call isValidGhost3Move
    cmp eax, 0
    je undoDown3
    jmp doneGhost3
undoDown3:
    dec ghost3Y
    jmp doneGhost3
tryLeft3:
    dec ghost3X
    call isValidGhost3Move
    cmp eax, 0
    je undoLeft3
    jmp doneGhost3
undoLeft3:
    inc ghost3X
    jmp doneGhost3
tryRight3:
    inc ghost3X
    call isValidGhost3Move
    cmp eax, 0
    je undoRight3
    jmp doneGhost3
undoRight3:
    dec ghost3X
doneGhost3:

skipGhostMove:
    call displayGhost
    popad
    ret
moveGhost ENDP

; Procedure to validate ghost 1 move
isValidGhostMove PROC
    push ebp
    mov ebp, esp
    movzx eax, ghostY
    sub eax, 1
    mov ecx, 61                  ; Row length for level 1
    cmp currentLevel, 1
    je setRowLengthGhost
    mov ecx, 89                  ; Row length for level 2 and 3
setRowLengthGhost:
    imul eax, ecx                ; Multiply by row length
    movzx edx, ghostX
    add eax, edx
    cmp currentLevel, 1
    je checkLevel1Ghost
    cmp currentLevel, 2
    je checkLevel2Ghost
    mov dl, Level3Maze[eax]
    jmp checkValidGhost
checkLevel1Ghost:
    mov dl, level1Maze[eax]
    jmp checkValidGhost
checkLevel2Ghost:
    mov dl, Level2Maze[eax]
checkValidGhost:
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
    mov ecx, 61                  ; Row length for level 1
    cmp currentLevel, 1
    je setRowLengthGhost2
    mov ecx, 89                  ; Row length for level 2 and 3
setRowLengthGhost2:
    imul eax, ecx                ; Multiply by row length
    movzx edx, ghost2X
    add eax, edx
    cmp currentLevel, 1
    je checkLevel1Ghost2
    cmp currentLevel, 2
    je checkLevel2Ghost2
    mov dl, Level3Maze[eax]
    jmp checkValidGhost2
checkLevel1Ghost2:
    mov dl, level1Maze[eax]
    jmp checkValidGhost2
checkLevel2Ghost2:
    mov dl, Level2Maze[eax]
checkValidGhost2:
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
    mov ecx, 61                  ; Row length for level 1
    cmp currentLevel, 1
    je setRowLengthGhost3
    mov ecx, 89                  ; Row length for level 2 and 3
setRowLengthGhost3:
    imul eax, ecx                ; Multiply by row length
    movzx edx, ghost3X
    add eax, edx
    cmp currentLevel, 1
    je checkLevel1Ghost3
    cmp currentLevel, 2
    je checkLevel2Ghost3
    mov dl, Level3Maze[eax]
    jmp checkValidGhost3
checkLevel1Ghost3:
    mov dl, level1Maze[eax]
    jmp checkValidGhost3
checkLevel2Ghost3:
    mov dl, Level2Maze[eax]
checkValidGhost3:
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
    call initRandom
    call displayWelcome
    call displayMainMenu 
gameLoop:
    call displayLevel
    call displayGhost
    call displayPlayer
    call displayScore
    call displayLives

    ; Non-blocking input
    call ReadKey
    jz noNewInput
    mov inputChar, al
    cmp inputChar, 'w'
    je setInput
    cmp inputChar, 's'
    je setInput
    cmp inputChar, 'a'
    je setInput
    cmp inputChar, 'd'
    je setInput
    cmp inputChar, 'x'
    je gameOver
    jmp noNewInput
setInput:
    mov al, inputChar
    mov lastInput, al
noNewInput:
    mov al, lastInput
    mov inputChar, al

    ; Player movement with counter
    inc playerMoveCounter
    cmp playerMoveCounter, 5   ; Move player every 5th loop (~100ms)
    jb skipPlayerMove
    mov playerMoveCounter, 0   ; Reset counter
    call movePlayer
skipPlayerMove:

    call moveGhost
    cmp gameWonFlag, 1
    je gameWonScreen
    cmp lives, 0
    je gameOver

    mov eax, 20          ; 20ms delay for smooth updates
    call Delay
    jmp gameLoop

gameWonScreen:
    call displayGameWon
    jmp exitGame

gameOver:
    call Clrscr
    mov eax, yellow
    call SetTextColor
    mov edx, OFFSET game_end_screen
    call WriteString
    mov eax, white
    call SetTextColor
    call ReadKey

exitGame:
main ENDP

END main
