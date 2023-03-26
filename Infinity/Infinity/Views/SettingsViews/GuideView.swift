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
                
                Text("This app will send you reminders everyday to check off your task and then it will add 1 day to your streak (i.e. every 24 hours).")
                    .padding()

                Spacer()
            }
            .padding()
        }
    }
}
