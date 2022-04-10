//
//  ChefSpecialsCollectionViewCell.swift
//  Yummie
//
//  Created by Eslam Ali  on 08/04/2022.
//

import UIKit
import Kingfisher

class ChefSpecialsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    static let identifier = "ChefSpecialsCollectionViewCell"

    @IBOutlet weak var caloriesLabel: UILabel!
  
    @IBOutlet weak var dishImageView: UIImageView!
   
    //MARK:- Configure Cell
    func configure (model : Dish)  {
        dishImageView.layer.cornerRadius = 10

        titleLabel.text = model.name
        descriptionLabel.text = model.description
        caloriesLabel.text = model.formattedCalories
        guard let url = URL(string: model.image ?? "") else {return}
        dishImageView.kf.setImage(with: url)
        
        
    }
    
    
}
