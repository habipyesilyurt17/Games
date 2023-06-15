//
//  ReactiveCoordinator.swift
//  GamesApp
//
//  Created by Habip Yeşilyurt on 14.06.2023.
//

import Foundation
import RxSwift

class ReactiveCoordinator<ResultType>: NSObject {
    let disposeBag = DisposeBag()
    private let identifier = UUID()
    private var childCoordinators = [UUID: Any]()
    
    private func store<T>(coordinator : ReactiveCoordinator<T>){
        //  childCoordinators[coordinator.identifier] = coordinator
    }
    
    private func release<T>(coordinator: ReactiveCoordinator<T>) {
        //    childCoordinators[coordinator.identifier] = nil
    }
    
    func coordinate<T>(to coordinator: ReactiveCoordinator<T>) -> Observable<T> {
        return coordinator.start()
            .do(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.release(coordinator: coordinator) })
        
    }
    
    func start() -> Observable<ResultType> {
        fatalError("start() method must be implemented")
    }
}
