import SwiftUI

struct GuideView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("How to use Infinity?")
                    .font(.title)
                    .bold()
                    .padding()
                
                Text("Infinity is for tracking streaks and progress on various goals. You can use this to track how long you have been sticking to a habit or how long you have been avoiding a bad habit. The choice is up to you!")
                    .padding()
                
                Text("This app will let you set reoccuring reminders as well which you can set to a personalised message.")
                    .padding()
                
                Text("Infinity is designed to stay out of your way and let you track your goals, that's it!")
                    .padding()
 
                Spacer()
            }
            .padding()
        }
    }
}
