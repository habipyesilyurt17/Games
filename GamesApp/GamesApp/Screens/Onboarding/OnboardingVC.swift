//
//  OnboardingVC.swift
//  GamesApp
//
//  Created by Habip Yeşilyurt on 15.06.2023.
//

import UIKit
import RxSwift
import RxCocoa

class OnboardingVC: BaseVC<OnboardingVM> {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()

        configurePageControl()
        configureSkipButton()
        configureNextButton()
        
        bindOnboardingViewModel()
//        bindButtons()
    }
}

extension OnboardingVC {
    private func configureCollectionView() {
        collectionView.rx.setDelegate(self).disposed(by: disposeBag)
        collectionView.register(UINib(nibName: "OnboardingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
    }
    
    private func configurePageControl() {
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.numberOfPages = viewModel?.countListItem() ?? 0
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(pageControlTouch(_:)), for: .valueChanged)
    }
    
    @objc func pageControlTouch(_ sender : UIPageControl) {
        let page: Int? = sender.currentPage
        var frame: CGRect = self.collectionView.frame
        frame.origin.x = frame.size.width * CGFloat(page ?? 0)
        frame.origin.y = 0
        self.collectionView.scrollRectToVisible(frame, animated: true)
    }
    
    private func configureSkipButton() {
        skipButton.setTitle("Skip", for: .normal)
        skipButton.backgroundColor = .black
        skipButton.tintColor = .white
        skipButton.layer.cornerRadius = 5
    }
    
    private func configureNextButton() {
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = .black
        nextButton.tintColor = .white
        nextButton.layer.cornerRadius = 5
    }
    
    private func bindButtons() {
        nextButton.rx.tap.bind {
            if self.pageControl.currentPage < 2 {
//                self.collectionView.scrollToNextItem()
                LaunchOnboardingManager.shared.setNewUser()
            }
            else {
                self.pageControl.currentPage = 3
            }
            
        }.disposed(by: disposeBag)
        
        skipButton.rx.tap.bind {
            self.viewModel?.goToHomePage.onNext(())
        }.disposed(by: disposeBag)
    }
    
    private func bindOnboardingViewModel() {
        viewModel?.onboardList
            .bind(to: collectionView.rx.items(cellIdentifier: "OnboardingCollectionViewCell", cellType: OnboardingCollectionViewCell.self)) { _, data, cell in
                cell.configureOnboardingCell(data)
            }.disposed(by: disposeBag)
        viewModel?.getOnboardList()

    }
}

extension OnboardingVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}
