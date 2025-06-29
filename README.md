# Pac-Man Game in Assembly

## Overview
This is a console-based Pac-Man game implemented in x86 Assembly language using the Irvine32 library. The game features multiple levels, a player-controlled character, ghosts, and a scoring system, replicating the classic Pac-Man experience with ASCII graphics.

## Features
- **Three Levels**: Progress through increasingly complex mazes.
- **Player Controls**: Use W (up), A (left), S (down), D (right), P (pause), and X (exit).
- **Scoring System**: Collect dots (1 point) and fruits (50 points).
- **Ghosts**: Avoid ghosts that move randomly. Levels 1 and 2 have three ghosts; Level 3 has five.
- **Lives**: Start with three lives, lose one upon ghost collision.
- **Sound Effects**: Includes sounds for game start, pellet/fruit collection, player death, and game over.
- **Menu System**: Welcome screen, main menu, instructions, and high score display.

## Prerequisites
- **MASM (Microsoft Macro Assembler)**: Required to assemble the code.
- **Irvine32 Library**: Provides console I/O and utility functions.
- **Windows OS**: The game uses `Winmm.lib` for sound playback.
- **Sound Files**: Ensure `startSound.wav`, `DeathSound.wav`, `FoodSound.wav`, `WakaSound.wav`, and `GameOverSound.wav` are in the project directory.

## Setup Instructions
1. **Install MASM**: Set up MASM in your development environment (e.g., Visual Studio).
2. **Install Irvine32 Library**:
   - Download the Irvine32 library from [Kip Irvine's website](http://kipirvine.com/asm/) or a trusted source.
   - Place `Irvine32.inc` and `Irvine32.lib` in your project directory.
   - Link `Winmm.lib` for sound functionality.
3. **Add Sound Files**: Place the required `.wav` files in the same directory as `pacman.asm`.
4. **Assemble and Link**:
   - Open a command prompt or use an IDE configured for MASM.
   - Assemble: `ml /c /Zd /Zi pacman.asm`
   - Link: `link pacman.obj Irvine32.lib Winmm.lib /SUBSYSTEM:CONSOLE`
5. **Run the Game**: Execute the generated `.exe` file.

## How to Play
1. **Start the Game**:
   - Run the executable.
   - Enter your name at the welcome screen.
   - Select "1" from the main menu to start.
2. **Gameplay**:
   - Navigate Pac-Man (X) through the maze to collect dots (.) and fruits (@).
   - Avoid ghosts (G) to prevent losing lives.
   - Progress through levels by reaching score thresholds (254 for Level 2, 989 for Level 3).
   - Win the game by collecting all items in Level 3 (score of 1174).
3. **Controls**:
   - **W**: Move up
   - **A**: Move left
   - **S**: Move down
   - **D**: Move right
   - **P**: Pause the game
   - **X**: Exit the game
4. **Menu Options**:
   - **2**: View instructions
   - **3**: View high scores (placeholder, not implemented)
   - Press **B** to return from pause/instructions, **M** from high scores.

## File Structure
- `pacman.asm`: Main game source code.
- `startSound.wav`, `DeathSound.wav`, `FoodSound.wav`, `WakaSound.wav`, `GameOverSound.wav`: Sound files for game events.
- (Ensure `Irvine32.inc` and `Irvine32.lib` are in the project directory.)

## Known Limitations
- **High Scores**: Not fully implemented; displays a placeholder message.
- **Ghost Movement**: Random movement may not challenge skilled players.
- **Sound Dependency**: Missing `.wav` files will prevent sound playback but not affect gameplay.
- **Console-Based**: Limited to ASCII graphics, no GUI.

## Future Improvements
- Implement high score saving and loading.
- Enhance ghost AI for smarter movement.
- Add power-ups or additional game mechanics.
- Improve visual feedback with colored ASCII characters.

## Contributing
Contributions are welcome! Please:
1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/YourFeature`).
3. Commit changes (`git commit -m "Add YourFeature"`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Open a pull request.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
