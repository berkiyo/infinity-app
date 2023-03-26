import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("About Infinity")
                    .font(.title)
                    .bold()
                    .padding()
                
                Text("Infinity is personal streak/habit tracking application designed to be elegant and simple.")
                    .padding()
                
                Spacer()
                
                Text("Version 1.0")
                    .padding()
                
                Spacer()
                
                Text("Made with ❤️ by Tekbyte.")
                
                Spacer()
                
            }
        }
    }
}
