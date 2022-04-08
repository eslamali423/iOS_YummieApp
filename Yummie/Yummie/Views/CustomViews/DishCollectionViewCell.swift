//
//  DishCollectionViewCell.swift
//  Yummie
//
//  Created by Eslam Ali  on 08/04/2022.
//

import UIKit
import Kingfisher

class DishCollectionViewCell: UICollectionViewCell {
    
    //MARK:- Vars
    
    static let identifier = "DishCollectionViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!

    
    //MARK:- Configure Cell
    func configure (model : Dish)  {
        titleLabel.text = model.name
        descriptionLabel.text = model.discription
        caloriesLabel.text = model.formattedCalories
        guard let url = URL(string: model.image ?? "") else {return}
        dishImageView.kf.setImage(with: url)
        
        
    }
    
    
    
    
}
