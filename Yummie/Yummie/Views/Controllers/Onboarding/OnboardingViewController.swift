//
//  OnboardingViewController.swift
//  Yummie
//
//  Created by Eslam Ali  on 07/04/2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    //MARK:- Vars
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    var viewModel = OnboardingViewModel()
    
    var currentPage = 0 {
        didSet {
            pageControll.currentPage = currentPage
            if currentPage == viewModel.slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            }else  {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 15
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        viewModel.getslides()
        pageControll.numberOfPages = viewModel.slides.count
        
    }
    
    
    //MARK:- Did Tap Next Button
    @IBAction func nextButton(_ sender: Any) {
        if currentPage == viewModel.slides.count - 1 {
            UserDefaults.standard.setValue(true, forKey: "OnBorded")
            let homeController =  (storyboard?.instantiateViewController(identifier: "HomeNavigationController"))! as UINavigationController
            homeController.modalPresentationStyle = .fullScreen
            homeController.modalTransitionStyle = .crossDissolve
            present(homeController, animated: true)
        }else  {

            currentPage  += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
}

extension OnboardingViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as? OnboardingCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(slide: viewModel.slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    // this function to set the current page in page controll
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}
