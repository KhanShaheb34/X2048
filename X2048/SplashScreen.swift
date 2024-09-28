import SwiftUI

struct SplashScreen: View {
    var body: some View {
        VStack {
            Text("X2048")
                .font(.custom("Molot", size: 80))
                .padding()
                .foregroundColor(Color(red: 186/255, green: 173/255, blue: 158/255))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 234/255, green: 236/255, blue: 226/255))
        .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    SplashScreen()
}
