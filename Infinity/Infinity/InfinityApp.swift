/* FILE = InfinityApp.swift
 AUTHOR = Berk Dogan
 PROJECT = Infinity
 URL = https://github.com/berkiyo/infinity
 */

import SwiftUI


/**
 Identify the device our app is running on
 */
extension UIDevice {
    static var idiom: UIUserInterfaceIdiom {
        UIDevice.current.userInterfaceIdiom
    }
    static var isiPad: Bool {
        idiom == .pad
    }
    
    static var isiPhone: Bool {
        idiom == .phone
    }
}

@main
struct InfinityApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    // the body
    var body: some Scene {
        // TODO: Have iPad and iPhone support
        WindowGroup {
            NavigationView {
                HomeView()
                    .environmentObject(listViewModel)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
