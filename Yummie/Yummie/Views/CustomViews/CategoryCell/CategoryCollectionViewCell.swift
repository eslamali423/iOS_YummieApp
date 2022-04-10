//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by Eslam Ali  on 07/04/2022.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    //MARK:- Vars
   
    static let identifer = "CategoryCollectionViewCell"
    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK:- Configuration
    func configure (model : Category ) {
        titleLabel.text = model.title ?? "UNKONWN"
        guard let url = URL(string: model.image ?? "") else {return }
        categoryImageView.kf.setImage(with: url)


    }
    

}
