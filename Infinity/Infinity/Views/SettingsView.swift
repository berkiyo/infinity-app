import SwiftUI
import StoreKit

struct SettingsView: View {
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    List {
                        // Guide View
                        Section(header: Text("General")) {
                            // Guide view
                            NavigationLink { GuideView() } label: {
                                Text("❓ How To Guide")
                            }
                            // About View
                            NavigationLink { AboutView() } label: {
                                Text("🧐 About Infinity")
                            }
                        }
                        
                        
                        Section(header: Text("Pro Settings")) {
                            // Removed, will probably add it in a later version.
                             NavigationLink { ProView() } label: {
                                 Text("💎 Infinity Pro")
                             }
                            
                            // Icon Changer View
                            // Pro Feature
                            NavigationLink { ChangeAppIconView() } label: {
                                Text("📱 Change App Icon")
                            }
                            
                            // Notification View
                            // Pro Feature
                            NavigationLink { NotificationView() } label: {
                                Text("🔔 Custom Notifications")
                            }
                            
                            // Quotes View
                            // Pro Feature
                            NavigationLink { QuotesView() } label: {
                                Text("📖 Motivational Quotes")
                            }
                            
                            NavigationLink { JournalView() } label: {
                                Text("📝 Personal Journal")
                            }
                        }
                        
                        Section(header: Text("Feedback")) {
                            // Feedback Hyperlink (Email)
                            Link("✉️ Give Feedback", destination: URL(string: "mailto:mail@berkdogan.com")!)
                            
                            
                            // Review prompt
                            Button("⭐️ Leave a review") {
                                requestReview()
                            }
                        }
                        
                        
                    } // END LIST
                } // END NAVSTACK
            } // END VSTACK
        } // END ZSTACK
    }

}
