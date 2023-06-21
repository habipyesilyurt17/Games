//
//  OnboardingCoordinator.swift
//  GamesApp
//
//  Created by Habip Yeşilyurt on 15.06.2023.
//

import UIKit
import RxSwift

class OnboardingCoordinator: ReactiveCoordinator<Void> {
    let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() -> Observable<Void> {
        let onboardingVC = OnboardingVC()
        let onboardingVM = OnboardingVM()
        onboardingVC.viewModel = onboardingVM
        
        rootViewController.navigationController?.pushViewController(onboardingVC, animated: true)        
        return Observable.never()
    }
}
