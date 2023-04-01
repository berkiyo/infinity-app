import SwiftUI


/**
 Begin "HomeView"
 */
struct HomeView: View {
    
    @State var selection = 1
    
    var body: some View {
        /**
         Check and see if 24 hours has passed.
         */
        TabView(selection: $selection) {
            ListView()
                .tabItem {
                    Label("Goals", systemImage: "infinity")
                }
                .tag(1)
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(2)
        }
        .navigationTitle(selection == 1 ? "Goals" : "Settings")
        .navigationBarTitleDisplayMode(.inline)// << here !!

    }
}

