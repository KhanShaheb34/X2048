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

    static func moveLeft(_ grid: [[Int]]) -> [[Int]] {
        var newGrid = grid

        for i in 0..<4 {
            var row = newGrid[i].filter { $0 != 0 }
            if row.count > 0 {
                for j in 0..<(row.count - 1) {
                    if row[j] == row[j + 1] {
                        row[j] *= 2
                        row[j + 1] = 0
                    }
                }
            }
            row = row.filter { $0 != 0 }
            while row.count < 4 {
                row.append(0)
            }
            newGrid[i] = row
        }

        addRandomTile(to: &newGrid)
        return newGrid
    }


    static func moveRight(_ grid: [[Int]]) -> [[Int]] {
        var newGrid = grid
        
        for i in 0..<4 {
            var row = newGrid[i].reversed().filter { $0 != 0 }
            if row.count > 0 {
                for j in 0..<(row.count - 1) {
                    if row[j] == row[j + 1] {
                        row[j] *= 2
                        row[j + 1] = 0
                    }
                }
            }
            row = row.filter { $0 != 0 }
            while row.count < 4 {
                row.append(0)
            }
            newGrid[i] = row.reversed()
        }
        
        addRandomTile(to: &newGrid)
        return newGrid
    }

    static func moveUp(_ grid: [[Int]]) -> [[Int]] {
        var newGrid = grid
        
        for j in 0..<4 {
            var col = newGrid.map(\.self[j]).filter{ $0 != 0 }
            if(col.count > 0) {
                for i in 0..<(col.count - 1) {
                    if col[i] == col[i + 1] {
                        col[i] *= 2
                        col[i + 1] = 0
                    }
                }
            }
            col = col.filter { $0 != 0 }
            while col.count < 4 {
                col.append(0)
            }
            
            for(i, value) in col.enumerated() {
                newGrid[i][j] = value
            }
        }
        
        addRandomTile(to: &newGrid)
        return newGrid
    }

    static func moveDown(_ grid: [[Int]]) -> [[Int]] {
        var newGrid = grid
        
        for j in 0..<4 {
            var col = newGrid.map(\.self[j]).reversed().filter{ $0 != 0 }
            if(col.count > 0) {
                for i in 0..<(col.count - 1) {
                    if col[i] == col[i + 1] {
                        col[i] *= 2
                        col[i + 1] = 0
                    }
                }
            }
            
            col = col.filter { $0 != 0 }
            while col.count < 4 {
                col.append(0)
            }
            
            for(i, value) in col.reversed().enumerated() {
                newGrid[i][j] = value
            }
        }
        
        addRandomTile(to: &newGrid)
        return newGrid
    }
    

}
