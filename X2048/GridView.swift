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
                .fill(colorForValue(value))
                .frame(width: 70, height: 70)
                .cornerRadius(8)
            if value != 0 {
                Text("\(value)")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
    }
    
    func colorForValue(_ value: Int) -> Color {
        switch value {
        case 2:
            return Color(red: 186/255, green: 173/255, blue: 158/255) // Slightly darker beige
        case 4:
            return Color(red: 186/255, green: 144/255, blue: 108/255) // Darker beige
        case 8:
            return Color(red: 242/255, green: 177/255, blue: 121/255) // Dark orange
        case 16:
            return Color(red: 245/255, green: 149/255, blue: 99/255) // Light red
        case 32:
            return Color(red: 246/255, green: 124/255, blue: 95/255) // Dark red
        case 64:
            return Color(red: 246/255, green: 94/255, blue: 59/255) // Bright red
        case 128:
            return Color(red: 237/255, green: 207/255, blue: 114/255) // Light yellow
        case 256:
            return Color(red: 237/255, green: 204/255, blue: 97/255) // Dark yellow
        case 512:
            return Color(red: 237/255, green: 200/255, blue: 80/255) // Gold
        case 1024:
            return Color(red: 237/255, green: 197/255, blue: 63/255) // Light green
        case 2048:
            return Color(red: 237/255, green: 194/255, blue: 46/255) // Dark green
        default:
            return Color.gray // Default color for larger numbers
        }
    }
}
