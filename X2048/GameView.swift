import SwiftUI

struct GameView: View {
    @State private var grid = Array(repeating: Array(repeating: 0, count: 4), count: 4)
    
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
    }
}

#Preview {
    GameView()
}
