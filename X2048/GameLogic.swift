import Foundation

struct GameLogic {
    static func createInitialGrid() -> [[Int]] {
        var grid = Array(repeating: Array(repeating: 0, count: 4), count: 4)
        addRandomTile(to: &grid)
        addRandomTile(to: &grid)
        return grid
    }
    
    static func addRandomTile(to grid: inout [[Int]]) {
        var emptyPositions = [(Int, Int)]()
        
        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                if grid[row][col] == 0 {
                    emptyPositions.append((row, col))
                }
            }
        }
        
        if let postion = emptyPositions.randomElement() {
            grid[postion.0][postion.1] = [2, 4].randomElement()!
        }
    }
}
