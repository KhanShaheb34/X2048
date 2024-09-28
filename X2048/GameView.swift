import SwiftUI
import UIKit

struct GameView: View {
    @State private var grid = Array(repeating: Array(repeating: 0, count: 4), count: 4)
    @State private var isGameOver = false
    @State private var score = 0
    @State private var highScore = UserDefaults.standard.integer(forKey: "HighScore")
    
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    init() {
        _grid = State(initialValue: GameLogic.createInitialGrid())
    }

    var body: some View {
        ZStack {
            Color(red: 234/255, green: 236/255, blue: 226/255).edgesIgnoringSafeArea(.all)
            VStack {
                Text("\(self.score)")
                    .font(.custom("Molot", size: 80))
                    .foregroundColor(Color(red: 186/255, green: 173/255, blue: 158/255))
                    .padding()
                GridView(grid: $grid)
            }
            .padding()
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
                    
                    feedbackGenerator.impactOccurred()
                    feedbackGenerator.prepare()
                }
        )
        .fullScreenCover(isPresented: $isGameOver, content: {
            GameOverView(score: score, highScore: highScore, onRestart: {
                restartGame()
            })
        })
        .onChange(of: self.grid, initial: true) { _, newGrid in
            if GameLogic.isGameOver(newGrid) {
                self.isGameOver = true
            }
            self.score = calculateScore()
            if self.score > self.highScore {
                UserDefaults.standard.set(self.score, forKey: "HighScore")
            }
        }
        .onAppear {
            self.feedbackGenerator.prepare()
        }
    }
    
    func calculateScore() -> Int {
        return grid.flatMap { $0 }.reduce(0, +)
    }
    
    func restartGame() {
        self.isGameOver = false
        self.grid = GameLogic.createInitialGrid()
        self.score = 0
    }
}

#Preview {
    GameView()
}
