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
    }
}

#Preview {
    GameView()
}
