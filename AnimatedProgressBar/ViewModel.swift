//
//  ViewModel.swift
//  AnimatedProgressBar
//
//  Created by Irina Saf on 2025-10-28.
//

import Foundation
import SwiftUI
import Combine   // 👈 Обязательно для ObservableObject
import FirebaseDatabase

@MainActor
class ProgressViewModel: ObservableObject {
    @Published var progress: Double = 0.0
    private let ref = Database.database().reference()
    private let userID = "demoUser123"

    init() {
        loadProgress()
    }

    func loadProgress() {
        ref.child("users/\(userID)/progress").observeSingleEvent(of: .value) { snapshot in
            if let value = snapshot.value as? Double {
                DispatchQueue.main.async {
                    self.progress = value
                }
            } else {
                print("⚠️ No progress found for user \(self.userID)")
            }
        }
    }

    func saveProgress() {
        ref.child("users/\(userID)/progress").setValue(progress) { error, _ in
            if let error = error {
                print("❌ Error saving progress: \(error.localizedDescription)")
            } else {
                print("✅ Progress saved: \(self.progress)")
            }
        }
    }
}
