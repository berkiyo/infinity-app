/* FILE = InfinityApp.swift
 AUTHOR = Berk Dogan
 PROJECT = Infinity
 URL = https://github.com/berkiyo/infinity
 */

import SwiftUI

@main
struct InfinityApp: App {
    @StateObject var storeVM = StoreViewModel()
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    // the body
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .environmentObject(listViewModel)
                    .environmentObject(storeVM)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
