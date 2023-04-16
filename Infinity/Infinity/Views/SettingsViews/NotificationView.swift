import SwiftUI
import UserNotifications

struct NotificationView: View {

    @State private var showingAlert = false // used for the popup (i.e. assuming if notification perms are good, show this popup if the user taps on it again.
    @State private var isScheduleOn = false // notification scheduler
    
    @State private var pickedSeconds: Double = 0 // value picked in seconds for interval
    @State private var pickedRepeat: Bool = false // do you want it to repeat?

    
    var body: some View {
        ZStack {
            VStack {
                Text("Notifications")
                    .font(.title)
                    .bold()
                    .padding()
                
                /// Request permission
                /// This is temporary, we will move this into the "Notification Scheduler" area
                ///
                Button(action: {
                    // first, if user grants permission, then we can start to schedule notifications
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            showingAlert = true
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                }) {
                    VStack {
                        Text("Enable Notifications")
                            .bold()
                        Text("Testing Button")
                            .font(.caption)
                            .padding(.top, 1)
                    }
                        
                }
                .alert("Permission is already allowed.", isPresented: $showingAlert) {
                    Button("Got it!", role: .cancel) { }
                }
                
                .padding()
                .background(.orange)
                .foregroundColor(.white)
                .cornerRadius(22)
                /// END BUTTON
                
                Divider()
                    .padding(20)
                
                /// Notification scheduler
                /// Schedule the notifications here
                HStack {
                    Toggle("Notification Scheduler", isOn: $isScheduleOn)
                        .padding(10)
                    Text(Image(systemName: "questionmark.circle"))
                        .onTapGesture {
                            print("help tapped 1")
                        }
                        .foregroundColor(.orange)
                }
                
                /// Whether to repeat or schedule notifications
                /// More functionality on the way
                HStack {
                    Toggle("Repeat Notification", isOn: $pickedRepeat)
                        .padding(10)
                    Text(Image(systemName: "questionmark.circle"))
                        .onTapGesture {
                            print("help tapped 1")
                        }
                        .foregroundColor(.orange)
                }
                
                
                
                /// This code will need some refactoring
                Button("Schedule Notification") {
                    let content = UNMutableNotificationContent()
                    content.title = "Never give up!"
                    content.subtitle = "This is the way."
                    content.sound = UNNotificationSound.default

                    // show this notification five seconds from now
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: pickedSeconds, repeats: pickedRepeat)

                    // choose a random identifier
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                    // add our notification request
                    UNUserNotificationCenter.current().add(request)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}
