//
//  OnboardingCollectionViewCell.swift
//  GamesApp
//
//  Created by Habip Yeşilyurt on 12.07.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lottieView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configureOnboardingCell(_ model: OnboardingModel) {
        lottieView = onboardingLottieView(name: model.lottieViewStr)
        titleLabel.text = model.title
        descriptionLabel.text = model.description
    }
    
    private func onboardingLottieView(name: String) -> UIView? {
        if lottieView != nil {
            LottieManager.shared.playLottie(view: lottieView, lottieName: name)
            return lottieView
        }
        return nil
    }

    override func prepareForReuse() {
        lottieView = nil
    }

}
