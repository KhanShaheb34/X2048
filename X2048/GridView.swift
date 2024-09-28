import SwiftUI

struct GridView: View {
    @Binding var grid: [[Int]]
    
    var body: some View {
        VStack(spacing: 5) {
            ForEach(0..<4, id: \.self) { row in
                HStack(spacing: 5) {
                    ForEach(0..<4, id: \.self) {col in
                        CellView(value: self.grid[row][col])
                    }
                }
            }
        }
    }
}

struct CellView: View {
    
    var value: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.gray)
                .frame(width: 70, height: 70)
            if value != 0 {
                Text("\(value)")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
    }
}
