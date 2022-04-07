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
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.layer.cornerRadius = 15
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    


    @IBAction func nextButton(_ sender: Any) {
    }
    
}

extension OnboardingViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as? OnboardingCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
}
