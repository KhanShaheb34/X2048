import SwiftUI

struct GameOverView: View {
    var score: Int
    var highScore: Int
    var onRestart: () -> Void
    
    
    var body: some View {
        ZStack {
            Color(red: 234/255, green: 236/255, blue: 226/255).edgesIgnoringSafeArea(.all)
            VStack {
                
                Spacer()
                
                Text("\(self.score)")
                    .font(.custom("Molot", size: 80))
                    .foregroundColor(Color(red: 186/255, green: 173/255, blue: 158/255))
                    .padding()
                
                Text("High Score: \(self.highScore)")
                    .font(.custom("Molot", size: 32))
                    .foregroundColor(Color(red: 186/255, green: 173/255, blue: 158/255))
                
                Spacer()
                
                Button(action: {
                    onRestart()
                }) {
                    Text("Play Again")
                        .font(.custom("Molot", size: 48))
                        .foregroundColor(Color(red: 234/255, green: 236/255, blue: 226/255))
                }
                .padding()
                .background(Color(red: 186/255, green: 173/255, blue: 158/255))
                .cornerRadius(8)
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    GameOverView(score: 100, highScore: 200, onRestart: {
        print("test")
    })
}
