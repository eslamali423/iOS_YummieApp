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
    var popularDishesViewModel = PopularDishesViewModel()
    var chefsSpecialViewModel = ChefsSpecialsViewModel()
    
    var categories : [DishCategory] = []
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Yummie"
        registerCells()
        
        categoryViewModel.getCategories()
        popularDishesViewModel.getDishes()
        chefsSpecialViewModel.getDishes()
        
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        popularDishesCollectionView.delegate = self
        popularDishesCollectionView.dataSource = self
        
        chefsSpecialsCollectionView.delegate = self
        chefsSpecialsCollectionView.dataSource = self
        
        
        
    }
    
    
    func registerCells()  {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifer)
        
        popularDishesCollectionView.register(UINib(nibName: PopularDishCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularDishCollectionViewCell.identifier)
        
     
      
        chefsSpecialsCollectionView.register(UINib(nibName: ChefSpecialsCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ChefSpecialsCollectionViewCell.identifier)
    }
    
    
    @IBAction func didTabCartButton(_ sender: Any) {
    }
    
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoryCollectionView :
            return categoryViewModel.categories.count
        case popularDishesCollectionView :
            return popularDishesViewModel.dishes.count
        case chefsSpecialsCollectionView :
            return chefsSpecialViewModel.dishes.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifer, for: indexPath) as? CategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(model: categoryViewModel.categories[indexPath.row])
            
            return cell
        case popularDishesCollectionView :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularDishCollectionViewCell.identifier, for: indexPath) as? PopularDishCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(model: popularDishesViewModel.dishes[indexPath.row])
            return cell
        case chefsSpecialsCollectionView :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefSpecialsCollectionViewCell.identifier, for: indexPath) as? ChefSpecialsCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(model: chefsSpecialViewModel.dishes[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
        
        
        
    }
}
