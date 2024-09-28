import SwiftUI

struct GameView: View {
    @State private var grid = Array(repeating: Array(repeating: 0, count: 4), count: 4)
    @State private var isGameOver = false
    
    init() {
        _grid = State(initialValue: GameLogic.createInitialGrid())
    }

    var body: some View {
        VStack {
            Text("Swift2048")
                .font(.largeTitle)
                .padding()
            GridView(grid: $grid)
        }
        .gesture(
            DragGesture()
                .onEnded { value in
                    let horizontalOffset = value.translation.width
                    let verticalOffset = value.translation.height
                    
                    if abs(horizontalOffset) > abs(verticalOffset) {
                        if(horizontalOffset < 0) {
                            self.grid = GameLogic.moveLeft(self.grid)
                        } else {
                            self.grid = GameLogic.moveRight(self.grid)
                        }
                    } else {
                        if(verticalOffset < 0) {
                            self.grid = GameLogic.moveUp(self.grid)
                        } else {
                            self.grid = GameLogic.moveDown(self.grid)
                        }
                    }
                    
                }
        )
        .alert(isPresented: $isGameOver) {
            Alert(title: Text("Game Over"),
                  message: Text("Your score was \(calculateScore())"),
                  dismissButton: .default(Text("Restart"), action: {
                self.grid = GameLogic.createInitialGrid()
            }))
        }
        .onChange(of: grid, perform: { _ in
            if GameLogic.isGameOver(grid) {
                self.isGameOver = true
            }
        })
    }
    
    func calculateScore() -> Int {
        return grid.flatMap { $0 }.reduce(0, +)
    }
}

#Preview {
    GameView()
}
