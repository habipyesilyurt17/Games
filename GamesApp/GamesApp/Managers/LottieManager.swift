//
//  LottieManager.swift
//  GamesApp
//
//  Created by Habip Yeşilyurt on 15.06.2023.
//

import UIKit
import Lottie

enum LottieNames: String {
    case games = "games"
    case gamesOnboarding = "gamesOnboarding"
    case favorites = "favorites"
    case notes = "notes"
    case languages = "languages"
}

class LottieManager {
    static let shared = LottieManager()
    
    private var animationView: LottieAnimationView!
    
    private init() {}
    
    func playLottie(view: UIView, lottieName: String) {
        animationView = .init(name: lottieName)
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        view.addSubview(animationView)
        animationView.play()
    }
    
    func stopLottie() {
        animationView.stop()
    }
}
