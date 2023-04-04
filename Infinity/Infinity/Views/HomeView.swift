import SwiftUI


/**
 Begin "HomeView"
 */
struct HomeView: View {
    
    @State var selection = 1
    
    var body: some View {
        
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

