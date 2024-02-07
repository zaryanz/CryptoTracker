//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Aryan Singh on 05/02/24.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView().navigationBarHidden(true)
            }.environmentObject(vm)
        }
    }
}
