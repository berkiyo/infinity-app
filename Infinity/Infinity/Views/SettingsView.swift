import SwiftUI
import StoreKit

struct SettingsView: View {
    @Environment(\.requestReview) var requestReview
    @State var isNotPro: Bool = true
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    List {
                        // GUIDE
                        NavigationLink { GuideView() } label: {
                            Text("❓ How To Guide")
                        }
                        // PURCHASE PRO
                         NavigationLink { ProView() } label: {
                         Text("💎 Infinity Pro")
                         }
                        
                        // CHANGE ICON VIEW
                        NavigationLink { ChangeIconView() } label: {
                            Text("📱 Change App Icon (Pro)")
                        }
                        .disabled(isNotPro)
                        
                        // Apple Watch Complications View
                        NavigationLink { AppleWatchView() } label: {
                            Text("⌚️ Apple Watch Complications (Pro)")
                        }
                        .disabled(isNotPro)
                        
                        //
                        NavigationLink { QuotesView() } label: {
                            Text("😤 Motivational Quotes (Pro)")
                        }
                        .disabled(isNotPro)
                        
                        // NOTIFICATION VIEW
                        NavigationLink { NotificationView() } label: {
                            Text("🔔 Notifications")
                        }
                         
                        // ABOUT VIEW
                        NavigationLink { AboutView() } label: {
                            Text("🧐 About Infinity")
                        }
                        
                        // GIVE FEEDBACK
                        Link("✉️ Give Feedback", destination: URL(string: "mailto:qwerty@tekbyte.net")!)
                        
                        // LEAVE A REVIEW
                        Button("⭐️ Leave a review") {
                            requestReview()
                        }
                    }
                }
            }
        }
    }
    
}
