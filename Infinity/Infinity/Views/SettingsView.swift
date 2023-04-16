import SwiftUI
import StoreKit

struct SettingsView: View {
    @Environment(\.requestReview) var requestReview
    @EnvironmentObject var storeVM: StoreViewModel
    
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    List {
                        // Guide View
                        NavigationLink { GuideView() } label: {
                            Text("❓ How To Guide")
                        }
                        
                        
                        // Pro View
                         NavigationLink { ProView() } label: {
                         Text("💎 Infinity Pro")
                         }
                        
                        
                        // Icon Changer View
                        NavigationLink { ChangeAppIconView() } label: {
                            Text("📱 Change App Icon (Pro)")
                        }
                        .disabled(storeVM.purchasedSubscriptions.isEmpty)
                        
                        
                        
                        // Apple Watch Complications View
                        // For future release
                        /*
                        NavigationLink { AppleWatchView() } label: {
                            Text("⌚️ Apple Watch Complications (Pro)")
                        }
                        .disabled(storeVM.purchasedSubscriptions.isEmpty)
                        */
                        
                        
                        // Quotes View
                        NavigationLink { QuotesView() } label: {
                            Text("😤 Motivational Quotes (Pro)")
                        }
                        .disabled(storeVM.purchasedSubscriptions.isEmpty)
                        
                        
                        // Notification View
                        // For future release
                        /*
                        NavigationLink { NotificationView() } label: {
                            Text("🔔 Notifications")
                        }
                        */
                        
                        
                         
                        // About View
                        NavigationLink { AboutView() } label: {
                            Text("🧐 About Infinity")
                        }
                        
                        
                        // Feedback Hyperlink (Email)
                        Link("✉️ Give Feedback", destination: URL(string: "mailto:qwerty@tekbyte.net")!)
                        
                        
                        // Review prompt
                        Button("⭐️ Leave a review") {
                            requestReview()
                        }
                    }
                }
            }
        }
    }
    
}
