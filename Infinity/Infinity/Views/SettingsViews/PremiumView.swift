import SwiftUI

struct PremiumView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Infinity Premium!")
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
                        Text("The premium version gives you the ability to update the app icon!")
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
                
                // Buttons for payment goes here
                
                VStack {
                    Text("Subscribe for $4.99 yearly")
                        .bold()
                        .font(.caption)
                    Text("Cancel anytime.")
                        .font(.caption)
                    
                    Spacer()
                    
                    // Button to subscribe
                    Button(action: {
                        print("Subscribe Tapped")
                    }) {
                        Text("Start 7-day Free Trial")
                            .bold()
                    }
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(22)
                }
                
                Spacer()
            }
            .padding(20)
        }
    }
}
