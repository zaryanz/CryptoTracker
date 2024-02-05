//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Aryan Singh on 05/02/24.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView().navigationBarHidden(true)
            }
        }
    }
}
