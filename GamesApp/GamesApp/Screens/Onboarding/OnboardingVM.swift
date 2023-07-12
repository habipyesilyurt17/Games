//
//  OnboardingVM.swift
//  GamesApp
//
//  Created by Habip Yeşilyurt on 15.06.2023.
//

import Foundation
import RxSwift

class OnboardingVM: BaseVM {
    let onboardList = PublishSubject<[OnboardingModel]>()
    let goToHomePage = PublishSubject<Void>()
    private var list: [OnboardingModel] = []

    func getOnboardList() {
        list.append(OnboardingModel(title: "Games", description: "Millions of game content", lottieViewStr: LottieNames.gamesOnboarding.rawValue))
        list.append(OnboardingModel(title: "Favorites", description: "Add games to favorite", lottieViewStr: LottieNames.favorites.rawValue))
        list.append(OnboardingModel(title: "Notes", description: "Add notes for selected games", lottieViewStr: LottieNames.notes.rawValue))
        list.append(OnboardingModel(title: "Languages", description: "Turkish and English language support", lottieViewStr: LottieNames.languages.rawValue))
        onboardList.onNext(list)
    }
    
    func getSlideModel(at index: Int) -> OnboardingModel {
        return list[index]
    }
    
    func countListItem() -> Int {
        list.count
    }
}
