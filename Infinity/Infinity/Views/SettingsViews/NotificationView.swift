import SwiftUI
import UserNotifications


// THIS IS UNDER CONSTRUCTION :)
struct NotificationView: View {
    
    @State private var showingAlert = false // used for the popups
    @State private var isScheduleOn = false // notification scheduler
    @State private var pickedRepeat: Bool = false // repeat on/off
    @State private var hour: Int = 9
    @State private var minute: Int = 30
    
    
    var body: some View {
        ZStack {
            VStack {
                Text("Notifications")
                    .font(.title)
                    .bold()
                    .padding()
                
                // START FORM
                Form {
                    
                    Text("Enable Notifications")
                        .onTapGesture {
                            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                if success {
                                    showingAlert = true
                                } else if let error = error {
                                    print(error.localizedDescription)}
                            }
                        }
                        .alert("Permission is already allowed.", isPresented: $showingAlert) { Button("Got it!", role: .cancel) {}}
                    
                    HStack {
                        Toggle("Notification Scheduler", isOn: $isScheduleOn)
                            .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                        Text(Image(systemName: "questionmark.circle"))
                            .onTapGesture {
                                showingAlert = true
                            }
                            .alert("Notification Scheduler?", isPresented: $showingAlert) { Button("Got it!", role: .cancel) {}}
                            .foregroundColor(.orange)
                            .padding(.leading, 5)
                    }
                    
                    HStack {
                        Toggle("Repeat Notification", isOn: $pickedRepeat)
                            .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                        Text(Image(systemName: "questionmark.circle"))
                            .onTapGesture {
                                showingAlert = true
                            }
                            .alert("Repeat Notification?", isPresented: $showingAlert) { Button("Got it!", role: .cancel) {}}
                            .foregroundColor(.orange)
                            .padding(.leading, 5)
                    }

                }
            }
        }
    }
}
