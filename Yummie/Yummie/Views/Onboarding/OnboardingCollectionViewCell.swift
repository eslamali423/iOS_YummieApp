//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by Eslam Ali  on 07/04/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
 
    //MARK:- Vars
    static let identifier = "OnboardingCollectionViewCell"
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!


    //MARK:- Configure Function
    func configure(slide : OnboardingSlide)  {
        slideImageView.image = slide.image
        titleLabel.text = slide.title
        descriptionLabel.text = slide.description
    }


}


