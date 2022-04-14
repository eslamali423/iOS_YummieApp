//
//  HomeViewController.swift
//  Yummie
//
//  Created by Eslam Ali  on 07/04/2022.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {
    
    //MARK:- Vars
    @IBOutlet weak var chefsSpecialsCollectionView: UICollectionView!
    @IBOutlet weak var popularDishesCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categoryViewModel = CategorayViewModel()
    var popularDishesViewModel = PopularDishesViewModel()
    var chefsSpecialViewModel = ChefsSpecialsViewModel()

 
    
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Yummie"
        registerCells()
        
        ProgressHUD.show()
        getCategories()
        getPopularDishs()
       getChefSpecials()
        
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        popularDishesCollectionView.delegate = self
        popularDishesCollectionView.dataSource = self
        
        chefsSpecialsCollectionView.delegate = self
        chefsSpecialsCollectionView.dataSource = self
        
        
        
    }
    
    //MARK:- Get All Categories
    func getCategories()  {
        
        categoryViewModel.fetchCategory { (isSuccess) in
            DispatchQueue.main.async { [weak self] in
                if isSuccess{
                 
                    self?.categoryCollectionView.reloadData()
                }
            }
            
        }
    }
    
    //MARK:- Get All Popular Dishs
    func getPopularDishs()  {
        popularDishesViewModel.fetchPopularDishes { (isSuccess) in
            DispatchQueue.main.async { [weak self] in
                if isSuccess{
                    ProgressHUD.dismiss()
                    self?.popularDishesCollectionView.reloadData()
                }
            }
            
        }
    }
    
    //MARK:- Get All Popular Dishs
    func getChefSpecials()  {
        chefsSpecialViewModel.getChefSpecials { (isSuccess) in
            DispatchQueue.main.async { [weak self] in
                if isSuccess{
                    self?.chefsSpecialsCollectionView.reloadData()
                }
            }
            
        }
    }
    
    
    //MARK:- Register Cells To Our Collection Views
    func registerCells()  {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifer)
        
        popularDishesCollectionView.register(UINib(nibName: PopularDishCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularDishCollectionViewCell.identifier)
        
     
      
        chefsSpecialsCollectionView.register(UINib(nibName: ChefSpecialsCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ChefSpecialsCollectionViewCell.identifier)
    }
    
    
    @IBAction func didTabCartButton(_ sender: Any) {
        let dishVC = storyboard?.instantiateViewController(identifier: "OrdersViewController") as! OrdersViewController
        
        
        navigationController?.pushViewController(dishVC, animated: true)
    }
    
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoryCollectionView :
            return categoryViewModel.categories.count
        case popularDishesCollectionView :
            return popularDishesViewModel.dishs.count
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
            
            cell.configure(model: popularDishesViewModel.dishs[indexPath.row])
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)  {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        
        if collectionView == categoryCollectionView {
            let dishListVC = storyboard?.instantiateViewController(identifier: "DishListViewController") as! DishListViewController
            
           
            dishListVC.category = categoryViewModel.categories[indexPath.row]
         
            
            
            
            navigationController?.pushViewController(dishListVC, animated: true)
        }else {
            let dish = collectionView == popularDishesCollectionView ? popularDishesViewModel.dishs[indexPath.row] : chefsSpecialViewModel.dishes[indexPath.row]
            
            let dishVC = storyboard?.instantiateViewController(identifier: "DishDetailViewController") as! DishDetailViewController
            dishVC.dish = dish
            navigationController?.pushViewController(dishVC, animated: true)
            
        }
        
        
    }
}
