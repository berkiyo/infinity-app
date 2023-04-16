import SwiftUI
import UserNotifications


// THIS IS UNDER CONSTRUCTION :)
struct NotificationView: View {
    
    @State private var showingAlert = false // used for the popups
    @State private var textFieldMessage: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                Text("Notifications")
                    .font(.title)
                    .bold()
                    .padding()
                
                TextField("Title (e.g. Never give up!)", text: $textFieldMessage)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .padding(.vertical)
                
                TextField("Personal Message", text: $textFieldMessage)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .padding(.vertical)
                
                // START FORM
                Form {
                    
                    // Message name
                    // Time
                    // Frequency?
                    
                    

                }
            }
            .padding(14) // add some paddingr
        }
    }
}
