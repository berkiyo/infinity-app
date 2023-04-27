import SwiftUI
import StoreKit


struct ProView: View {
    

    @EnvironmentObject var storeVM: StoreViewModel
    @State var isPurchased = false
    
    var body: some View {
        ZStack {
            
            
            if storeVM.purchasedSubscriptions.isEmpty {
                // subscriptionview
                
                VStack {
                    Text("Infinity Pro!")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    HStack {
                        // Exclusive Features
                        Image(systemName: "gift.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.orange)
                        VStack(alignment: .leading){
                            Text("Goodies")
                                .bold()
                            Text("The pro version comes with daily quote notifications, custom icon picker and a widget!")
                        }
                    }
                    .padding(.vertical)
                    
                    HStack {
                        // Icon on left
                        Image(systemName: "crown.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.orange)
                        VStack(alignment: .leading){
                            Text("New Planned Features")
                                .bold()
                            Text("By purchasing/subscribing, you will get any new exclusive premium features.")
                        }
                    }
                    .padding(.vertical)
                    
                    HStack {
                        // Icon on left
                        Image(systemName: "cup.and.saucer.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.orange)
                        VStack(alignment: .leading){
                            Text("Support Development")
                                .bold()
                            Text("Your support allows us to maintain and develop Infinity.")
                        }
                    }
                    .padding(.vertical)
                    
                    Spacer()
                    // Buttons for payment goes here
                    // BUTTONS
                    
                    VStack {
                        // Button to subscribe (monthly)
                        Button(action: {
                            Task {
                                await buy(product: storeVM.subscriptions[0])
                            }
                        }) {
                            VStack {
                                Text("Subscribe for $2.99 AUD monthly")
                                    .bold()
                            }
                            
                        }
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(22)
                        .shadow(radius: 10)
                        
                        // blank space
                        Text("")
                            .padding(3)
                        
                        
                        
                        // Button to subscribe (yearly)
                        Button(action: {
                            Task {
                                await buy(product: storeVM.subscriptions[1])
                            }
                        }) {
                            VStack {
                                Text("Subscribe for $17.99 AUD yearly")
                                    .bold()
                                Text("Save 50% off monthly + 7 day trial included")
                                    .font(.caption)
                                    .padding(.top, 1)
                            }
                        }
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(22)
                        .shadow(radius: 10)

                        Text("Cancel Anytime. Family Sharing Included.")
                            .font(.caption)
                            .padding(.top, 5)
                        
                        Spacer()
                        
                        // Restore purchases
                        Button(action: {
                            Task {
                                // This will restore the purchased items for the user.
                                try? await AppStore.sync()
                            }
                        }) {
                            Text("Restore Purchases")
                                .font(.caption)
                        }
                        .padding(.top, 8)
                    }
                    
                    Spacer()
                }
                .padding(20)
                
                
                // END IF
            } else {
                VStack {
                    Text("You are a Pro!")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 20)
                    Text("Thank you for your support.")
                        .font(.title2)
                }
            }
            
            
            
            
            
            
        }
    }
    
    // Function to buy
    func buy(product: Product) async {
        do {
            if try await storeVM.purchase(product) != nil {
                isPurchased = true
            }
        } catch {
            print("Purchase failed, please try again.")
        }
    }
}
