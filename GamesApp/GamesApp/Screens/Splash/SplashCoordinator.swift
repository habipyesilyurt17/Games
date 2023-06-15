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
        return Observable.never()
    }
}
