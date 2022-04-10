//
//  OrdersViewController.swift
//  Yummie
//
//  Created by Eslam Ali  on 09/04/2022.
//

import UIKit

class OrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel = OrderViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()

        getOrder()
      
        
        tableView.delegate = self
        tableView.dataSource = self
        
}

    func registerCell()  {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
   
        
    }
    
    //MARK:- Get Orders
    func getOrder()  {
        viewModel.getOrders { (isSuccess) in
            DispatchQueue.main.async { [weak self] in
                if isSuccess {
                    self?.tableView.reloadData()
                }
            }
        }
    }

    
    
    
}

extension OrdersViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return viewModel.orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as? DishListTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(model: viewModel.orders[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        DispatchQueue.main.async { [weak self] in
            let dishVC = DishDetailViewController() 
            dishVC.dish = self?.viewModel.orders[indexPath.row].dish
            dishVC.orderButton.isHidden = false
            dishVC.nameField.isHidden = true
            self?.navigationController?.pushViewController(dishVC, animated: true)
        }
    }
    
    
    
}
