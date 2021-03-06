//
//  DishListTableViewCell.swift
//  Yummie
//
//  Created by Eslam Ali  on 09/04/2022.
//

import UIKit

class DishListTableViewCell: UITableViewCell {

    //MARK:- Vars
    static let identifier = "DishListTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    
  //MARK:- Configure with dish
    func configure (model : Dish){
        dishImageView.layer.cornerRadius = 10

        titleLabel.text = model.name
        descriptionLabel.text = model.description
        guard let url = URL(string: model.image ?? "") else {return}
        dishImageView.kf.setImage(with: url)
    }
    
    //MARK:- Configure with order
      func configure (model : Order){
        dishImageView.layer.cornerRadius = 10

        titleLabel.text = model.dish?.name
        descriptionLabel.text = model.name
        guard let url = URL(string: model.dish?.image ?? "") else {return}
          dishImageView.kf.setImage(with: url)
      }
    
}
