//
//  LaunchOnboardingManager.swift
//  GamesApp
//
//  Created by Habip Yeşilyurt on 15.06.2023.
//

import Foundation

class LaunchOnboardingManager {
    static let shared = LaunchOnboardingManager()
    
    private let newUserKey = "isNewUser"
    
    private init() {}
        
    func setNewUser() {
        UserDefaults.standard.set(true, forKey: newUserKey)
    }
    
    func isNewUser() -> Bool {
        UserDefaults.standard.bool(forKey: newUserKey)
    }
}
