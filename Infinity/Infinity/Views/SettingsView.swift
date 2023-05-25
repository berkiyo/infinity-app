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
                        // Removed, will probably add it in a later version.
                        
                         NavigationLink { ProView() } label: {
                         Text("💎 Infinity Pro")
                         }
                        
                        
                        // Icon Changer View
                        // Pro Feature
                        NavigationLink { ChangeAppIconView() } label: {
                            Text("📱 Change App Icon (Pro)")
                        }
                        .disabled(storeVM.purchasedSubscriptions.isEmpty)
                        
                        
                        
                        // Apple Watch Complications View
                        // For future release
                        /*
                        NavigationLink { AppleWatchView() } label: {
                            Text("⌚️ Apple Watch (Coming soon)")
                        }
                        .disabled(true)
                        */
                        
                        
                        // Quotes View
                        // Pro Feature
                        // This will come in the next version, for now, we'll focus on cleanup.
                        /*
                        NavigationLink { QuotesView() } label: {
                            Text("😤 Quotes (Coming soon)")
                        }
                        .disabled(true)
                        */
                        // Notification View
                        // Pro Feature
                        NavigationLink { NotificationView() } label: {
                            Text("🔔 Custom Notifications (Pro)")
                        }
                        .disabled(storeVM.purchasedSubscriptions.isEmpty)
                         
                        // About View
                        NavigationLink { AboutView() } label: {
                            Text("🧐 About Infinity")
                        }
                        
                        
                        // Feedback Hyperlink (Email)
                        Link("✉️ Give Feedback", destination: URL(string: "mailto:mail@berkdogan.com")!)
                        
                        
                        // Review prompt
                        Button("⭐️ Leave a review") {
                            requestReview()
                        }
                        
                        // DEV PURPOSES
                        // For API Scraping
                        /*
                        Button("Ping Quote") {
                            Task {
                                do {
                                    try await getQuotes()
                                } catch {
                                    print("Error, please try again.", error)
                                }
                            }
                        }
                        */
                        // Just running some tests
                        
                        
                    } // END LIST
                } // END NAVSTACK
            } // END VSTACK
        } // END ZSTACK
    }
    
    /**
     getQuotes()
     This is used for getting the quotes from the internet.
     For the API, we are using "https://api.goprogram.ai/inspiration/" as it is open.
     We want this behaviour:
     
     - fetch quotes periodically
     - send out notifications periodically (user decides)
     - This can work with the widget
     */
    
    func getQuotes() async throws {
        
        struct Quote: Decodable {
            var quote: String
            var author: String
        }
        
        guard let url = URL(string: "https://api.goprogram.ai/inspiration/") else { fatalError("Unable to fetch quote, please try again later.") }
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)

            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data")
            }
        let decodedFood = try JSONDecoder().decode(Quote.self, from: data)
        print(decodedFood)
    }
    
}
