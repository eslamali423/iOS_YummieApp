//
//  DishListViewController.swift
//  Yummie
//
//  Created by Eslam Ali  on 09/04/2022.
//

import UIKit

class DishListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = DishListViewModel()
    var category : DishCategory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
        registerCell()
        
        viewModel.getDishes()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    func registerCell()  {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
        
        
    }

   

}

extension DishListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as? DishListTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(model: viewModel.dishes[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        DispatchQueue.main.async { [weak self] in
            let dishVC = self?.storyboard?.instantiateViewController(identifier: "DishDetailViewController") as! DishDetailViewController
            dishVC.dish = self?.viewModel.dishes[indexPath.row]
            self?.navigationController?.pushViewController(dishVC, animated: true)
        }
    }
    
    
    
}
