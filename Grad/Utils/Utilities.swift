//
//  Utilitiers.swift
//  Grad
//
//  Created by Oscar Garcia Vazquez on 10/9/20.
//

import UIKit

class Utilities {
    func inputContainerView(withImage image : UIImage, textField : UITextField) -> UIView {
        let view = UIView()
        let iv = UIImageView()
        iv.image = image
        
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(iv)
        iv.anchor(left: view.leftAnchor,
                  bottom: view.bottomAnchor,
                  paddingLeft: 8,
                  paddingBottom: 8)
        
        iv.setDimensions(width: 24,
                         height: 24)
        
        view.addSubview(textField)
        textField.anchor(left: iv.rightAnchor,
                         bottom: view.bottomAnchor,
                         paddingLeft: 8,
                         paddingBottom: 8)
        
        
        let dividerView = UIView()
        dividerView.backgroundColor = .black
        view.addSubview(dividerView)
        dividerView.anchor(left: view.leftAnchor,
                           bottom: view.bottomAnchor,
                           right: view.rightAnchor,
                           paddingLeft: 8,
                           height:  1)
        
        return view
    }
    
    func inputContainer(withPicker image : UIImage, picker : UIPickerView) -> UIView {
        let view = UIView()
        
        let iv = UIImageView()
        iv.image = image
        
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(iv)
        iv.anchor(left: view.leftAnchor,
                  bottom: view.bottomAnchor,
                  paddingLeft: 8,
                  paddingBottom: 5)
        iv.setDimensions(width: 35, height: 35)
        
        view.addSubview(picker)
        picker.anchor(top: view.topAnchor,
                      left: iv.rightAnchor,
                      bottom: view.bottomAnchor,
                      right: view.rightAnchor,
                      paddingLeft: 8,
                      paddingBottom: 8)
        
        let dividerView = UIView()
        dividerView.backgroundColor = .twitterBlue
        view.addSubview(dividerView)
        dividerView.anchor(left: view.leftAnchor,
                           bottom: view.bottomAnchor,
                           right: view.rightAnchor,
                           paddingLeft: 8,
                           height: 0.75)
        
        return view
    }
    
    func textField(withPlaceholder placeholder : String) -> UITextField {
        let tf = UITextField()
        
        tf.textColor = .black
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.attributedText = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        tf.textAlignment = .center
        tf.contentMode = .center
        
        return tf
    }
    
    func attributedButton(_ firstpart : String, _ secondPart : String) -> UIButton {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: firstpart, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.black])
        
        attributedTitle.append(NSAttributedString(string: secondPart, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.black]))
        
        button.setAttributedTitle(attributedTitle,
                                  for: .normal)
        
        return button
    }
    
    func attributedLabel(_ firstPart : String, _ secondPart : String) -> UILabel {
        let label = UILabel()
        
        let attributedTitle = NSMutableAttributedString(string: firstPart, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.black])
        
        attributedTitle.append(NSAttributedString(string: secondPart, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.black]))
        
        label.text = "\(attributedTitle)"
        
        return label
    }
    
    func button(withTitle title : String) -> UIButton {
        let btn = UIButton(type: .system)
        
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
        btn.layer.cornerRadius = 10
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        return btn
    }
}

