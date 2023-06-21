//
//  SplashCoordinator.swift
//  GamesApp
//
//  Created by Habip Yeşilyurt on 14.06.2023.
//

import UIKit
import RxSwift

class SplashCoordinator: ReactiveCoordinator<Void> {
    let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() -> Observable<Void> {
        let splashVC = rootViewController as! SplashVC
        let splashVM = SplashVM()
        splashVC.viewModel = splashVM
        
        splashVM.goToOnboardingPage.subscribe { _ in
            let _ = self.coordinateToOnboarding()
        }.disposed(by: disposeBag)
        
        splashVM.goToHomePage.subscribe { _ in
            let _ = self.coordinateToTabBar()
        }.disposed(by: disposeBag)
        
        return Observable.never()
    }
    
    func coordinateToOnboarding() -> Observable<Void> {
        let coordinator = OnboardingCoordinator(rootViewController: rootViewController)
        return coordinate(to: coordinator)
    }
    
    func coordinateToTabBar() -> Observable<Void> {
        let coordinator = TabBarCoordinator(rootViewController: rootViewController)
        return coordinate(to: coordinator)
    }
}
