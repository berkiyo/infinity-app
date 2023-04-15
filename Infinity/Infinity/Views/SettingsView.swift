import SwiftUI
import StoreKit

struct SettingsView: View {
    @Environment(\.requestReview) var requestReview
    
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    List {
                        NavigationLink { GuideView() } label: {
                            Text("❓ How To Guide")
                        }
                        /* TODO
                        NavigationLink { ChangeIconView() } label: {
                            Text("📱 Change App Icon")
                        }
                         NavigationLink { PremiumView() } label: {
                         Text("💎 Infinity Premium")
                         }
                         */
                        NavigationLink { AboutView() } label: {
                            Text("🧐 About Infinity")
                        }
                        Link("✉️ Give Feedback", destination: URL(string: "mailto:qwerty@tekbyte.net")!)
                        
                        Button("⭐️ Leave a review") {
                            requestReview()
                        }
                    }
                }
            }
        }
    }
    
}
