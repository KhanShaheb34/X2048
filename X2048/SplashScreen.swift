import SwiftUI

struct SplashScreen: View {
    var body: some View {
        VStack {
            Text("Welcome to Swift2048")
                .font(.largeTitle)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 234/255, green: 236/255, blue: 226/255))
        .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    SplashScreen()
}
