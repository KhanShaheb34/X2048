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
                
                Text("Game Over")
                    .font(.custom("Molot", size: 64))
                    .foregroundColor(Color(red: 200/255, green: 150/255, blue: 150/255))
                    .padding()
                
                Spacer()
                
                Text("You score: \(self.score)")
                    .font(.title)
                    .foregroundColor(Color(red: 186/255, green: 173/255, blue: 158/255))
                
                Text ("High Score: \(self.highScore)")
                    .font(.title)
                    .foregroundColor(Color(red: 186/255, green: 173/255, blue: 158/255))
                
                Spacer()
                
                Button(action: {
                    onRestart()
                }) {
                    Text("Play Again")
                        .font(.custom("Molot", size: 32))
                        .foregroundColor(Color(red: 186/255, green: 173/255, blue: 158/255))
                }
                .padding()
                
                Spacer()
            }
        }
    }
}
