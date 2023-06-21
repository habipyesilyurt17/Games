//
//  TabBarCoordinator.swift
//  GamesApp
//
//  Created by Habip Yeşilyurt on 21.06.2023.
//

import UIKit
import RxSwift

class TabBarCoordinator: ReactiveCoordinator<Void> {
    let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() -> Observable<Void> {
        let tabBarVC = TabBarVC()
        rootViewController.navigationController?.pushViewController(tabBarVC, animated: true)
        return  Observable.never()
    }
}
