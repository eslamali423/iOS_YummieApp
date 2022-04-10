//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by Eslam Ali  on 09/04/2022.
//

import UIKit
import Kingfisher
import ProgressHUD

class DishDetailViewController: UIViewController {
    
    //MARK:- Vars
    
    static let identifier = "DishDetailViewController"
    
    private let dishImageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.contentCompressionResistancePriority(for: .vertical)
        return image
    }()
    
    private let titleLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .label
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let caloriesLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .red
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private let descriptionLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.textColor = .darkGray
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 15, weight: .regular)
        
        return label
    }()
    
    public let nameField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your Name"
        
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.layer.cornerRadius = 15
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        
        
        return textField
    }()
    
    public let orderButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Place Order", for: .normal)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 18, weight : .bold)
        return button
    }()
    
    
    var dish : Dish!
    var viewModel = OrderViewModel()
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        view.addSubview(dishImageView)
        view.addSubview(titleLabel)
        view.addSubview(caloriesLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(nameField)
        view.addSubview(orderButton)
        
        applyConstraints()
        configure()
        
        orderButton.addTarget(self, action: #selector(didTapOrderButton), for: .touchUpInside)
    }
    
  
    
    func applyConstraints() {
        
        NSLayoutConstraint.activate([
            
            
            
            orderButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            orderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            orderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            orderButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            orderButton.heightAnchor.constraint(equalToConstant: 50),
            
            nameField.bottomAnchor.constraint(equalTo: orderButton.topAnchor,constant: -10),
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            nameField.heightAnchor.constraint(equalToConstant: 50),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: nameField.topAnchor,constant: -10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            
           

            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor,constant: -10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -120),
            
            caloriesLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            caloriesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            caloriesLabel.widthAnchor.constraint(equalToConstant: 100),
            
       dishImageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant:  -10),
            dishImageView.topAnchor.constraint(equalTo: view.topAnchor),
            dishImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dishImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            dishImageView.heightAnchor.constraint(equalToConstant: view.frame.size.height / 1.6)
       
        ])
        
        
    }
    func configure(){
        titleLabel.text = dish.name
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
        
        guard let url = URL(string: dish.image ?? "") else {return}
        dishImageView.kf.setImage(with: url)
        
        
        
    }
    
    
    //MARK:- Did tap Order Button
    @objc func didTapOrderButton(){
        guard let text = nameField.text , !text.isEmpty else {
            ProgressHUD.showError("Please, Enter your name")
            return
        }
        viewModel.placeOrder(name: text, dish: dish) { isSuccess in
            DispatchQueue.main.async {
                if isSuccess {
                    ProgressHUD.showSuccess("Your order has been received. 👨🏼‍🍳")

                    
                }
            }
            
        }
        
        
    }
    
}
