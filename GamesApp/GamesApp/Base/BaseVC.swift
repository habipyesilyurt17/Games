//
//  BaseVC.swift
//  GamesApp
//
//  Created by Habip Yeşilyurt on 14.06.2023.
//

import UIKit
import RxSwift

class BaseVC<T>: UIViewController where T: BaseVM {
    
    var viewModel: T?
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
