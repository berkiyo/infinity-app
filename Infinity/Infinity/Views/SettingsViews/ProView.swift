import SwiftUI

struct ProView: View {
    
    
    
    var body: some View {
        ZStack {
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
                        Text("Update Icons")
                            .bold()
                        Text("The pro version comes with widgets, Apple Watch support and more!")
                    }
                }
                .padding(.vertical)
                
                HStack {
                    // Icon on left
                    Image(systemName: "crown.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.orange)
                    VStack(alignment: .leading){
                        Text("Premium For Life")
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
                
                VStack {
                    // Button to subscribe (monthly)
                    Button(action: {
                        print("Subscribe Tapped")
                    }) {
                        VStack {
                            Text("Subscribe for $2.99 monthly")
                                .bold()
                            Text("7 day trial included")
                                .font(.caption)
                        }
                        
                    }
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(22)

                    Text("")
                        .padding(5)
                    
                    // Button to subscribe (yearly)
                    Button(action: {
                        print("Subscribe Tapped")
                    }) {
                        VStack {
                            Text("Subscribe for $17.99 yearly")
                                .bold()
                            Text("7 day trial included")
                                .font(.caption)
                        }
                    }
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(22)

                    Text("Cancel anytime.")
                        .font(.caption)
                        .padding(.top, 5)
                    
                    Spacer()
                    
                    // Restore purchases
                    Button(action: {
                        print("Restore Purchases Tapped!")
                    }) {
                        Text("Restore Purchases")
                            .font(.caption)
                    }
                    .padding(.top, 8)
                }
                
                Spacer()
            }
            .padding(20)
        }
    }
}
