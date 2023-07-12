//
//  SplashVC.swift
//  GamesApp
//
//  Created by Habip Yeşilyurt on 14.06.2023.
//

import UIKit

class SplashVC: BaseVC<SplashVM> {
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var animationContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSplashScreen()
    }
    
    private func configureSplashScreen() {
        LottieManager.shared.playLottie(view: animationContainer, lottieName: LottieNames.games.rawValue)
        appNameLabel.text = "GAMES APP"
        appNameLabel.alpha = 0
        
        UIView.animate(withDuration: 3) { [weak self] in
            guard let self = self else { return }
            self.appNameLabel.alpha = 1
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !LaunchOnboardingManager.shared.isNewUser() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.viewModel?.goToOnboardingPage.onNext(())
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.viewModel?.goToHomePage.onNext(())
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        LottieManager.shared.stopLottie()
    }
}
