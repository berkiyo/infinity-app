import SwiftUI
import UserNotifications


// THIS IS UNDER CONSTRUCTION :)
struct NotificationView: View {
    
    @State private var showingAlert = false // used for the popups
    @State private var textFieldTitle: String = ""
    @State private var textFieldMessage: String = ""
    @State private var currentDate = Date()
    @State private var repeatState = false


    
    var body: some View {
        ZStack {
            VStack {
                Text("Notifications")
                    .font(.title)
                    .bold()
                    .padding()
                
                Text("You can add your personalised daily reminder/notification to help you stay on track.")
                    .font(.body)
                    .padding()
                
                TextField("Title (e.g. Never give up!)", text: $textFieldTitle)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 5)
                
                TextField("Personal Message", text: $textFieldMessage)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 5)
                
                HStack {
                    Text("Pick scheduled time")
                        .font(.body)
                    
                    Spacer()
                    
                    DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                .padding(14)
                
                
                /**
                 Toggle goes here
                 */
                Toggle("Repeat notification", isOn: $repeatState)
                    .padding(14)
                    .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                
                Divider() // add a divider
                    .padding(.horizontal)
                    .padding(.vertical)
                
                HStack {
                    Button(action: scheduleNotification, label: {
                        Text("Schedule".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: 200)
                            .background(Color.accentColor)
                            .cornerRadius(10, antialiased: true)
                            .shadow(radius: 10)
                        
                        Button(action: clearButtonPressed, label: {
                            Text("Clear".uppercased())
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(height: 55)
                                .frame(maxWidth: 200)
                                .background(Color.gray)
                                .cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .shadow(radius: 10)
                        })
                    })
                }
                Spacer()
            }
            .padding(14) // add some padding
            
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = textFieldTitle
        content.subtitle = textFieldMessage
        content.sound = UNNotificationSound.default
        
        //var notifTime: Date
        let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: currentDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: repeatState)

        // show this notification five seconds from now
        // For testing:
        // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
    
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    //func convertDate
    
    func clearButtonPressed() {
        textFieldTitle = ""
        textFieldMessage = ""
    }
}
