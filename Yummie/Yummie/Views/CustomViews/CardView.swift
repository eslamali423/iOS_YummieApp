//
//  CardView.swift
//  Yummie
//
//  Created by Eslam Ali  on 08/04/2022.
//

import UIKit

class CardView : UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    configure()
    }
    
    private func configure () {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 12
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.3
        
        
    }
    
}
