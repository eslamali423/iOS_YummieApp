//
//  HomeViewController.swift
//  Yummie
//
//  Created by Eslam Ali  on 07/04/2022.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK:- Vars
    @IBOutlet weak var chefsSpecialsCollectionView: UICollectionView!
    @IBOutlet weak var popularDishesCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categoryViewModel = CategorayViewModel()
    
//MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Yummie"
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        registerCells() 
        categoryViewModel.getCategories()
        
        
    }
    
    
    func registerCells()  {
        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifer)
    }
    
    
    @IBAction func didTabCartButton(_ sender: Any) {
    }

}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryViewModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifer, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(model: categoryViewModel.categories[indexPath.row])
        
        return cell
    }
}
