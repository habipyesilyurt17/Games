//
//  AppCoordinator.swift
//  GamesApp
//
//  Created by Habip Yeşilyurt on 14.06.2023.
//

import UIKit
import RxSwift

class AppCoordinator: ReactiveCoordinator<Void> {
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let splashVC = SplashVC()
        let navigationController = UINavigationController(rootViewController: splashVC)
        let splashCoordinator = SplashCoordinator(rootViewController: splashVC)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        return coordinate(to: splashCoordinator)
    }
}
