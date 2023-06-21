//
//  SplashVM.swift
//  GamesApp
//
//  Created by Habip Yeşilyurt on 14.06.2023.
//

import Foundation
import RxSwift


class SplashVM: BaseVM {
    let goToOnboardingPage = PublishSubject<Void>()
    let goToHomePage = PublishSubject<Void>()
}
