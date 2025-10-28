//
//  AnimatedProgressBarApp.swift
//  AnimatedProgressBar
//
//  Created by Irina Saf on 2025-10-28.
//

import SwiftUI
import FirebaseCore

@main
struct MyApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

