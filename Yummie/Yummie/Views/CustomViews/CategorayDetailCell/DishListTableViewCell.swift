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
        titleLabel.text = model.name
        descriptionLabel.text = model.discription
        guard let url = URL(string: model.image ?? "") else {return}
        dishImageView.kf.setImage(with: url)
    }
    
    //MARK:- Configure with order
      func configure (model : Order){
          titleLabel.text = model.name
        descriptionLabel.text = model.dish?.name
        guard let url = URL(string: model.dish?.image ?? "") else {return}
          dishImageView.kf.setImage(with: url)
      }
    
}