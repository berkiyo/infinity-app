import SwiftUI
import UserNotifications

struct NotificationView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Notifications")
                    .font(.title)
                    .bold()
                    .padding()
                
                Button("Request Permission") {
                    // first, if user grants permission, then we can start to schedule notifications
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("All set!")
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                    
                }
                
                Button("Schedule Notification") {
                    let content = UNMutableNotificationContent()
                    content.title = "Never give up!"
                    content.subtitle = "This is the way."
                    content.sound = UNNotificationSound.default

                    // show this notification five seconds from now
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

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
