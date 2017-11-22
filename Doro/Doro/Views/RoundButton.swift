//
//  RoundButton.swift
//  Doro
//
//  Created by Adly Thebaud on 11/22/17.
//  Copyright © 2017 ThebaudHouse. All rights reserved.
//

import UIKit

@IBDesignable class RoundButton: UIButton {
   
   
//   override init(frame: CGRect) {
//      super.init(frame: frame)
//   }
//   
//   required init?(coder: NSCoder) {
//      super.init(coder: coder)
//   }
   
   /*
    // Add constraints
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
    button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
    */
   @IBInspectable var height: CGFloat = 10.0 {
      didSet {
         self.heightAnchor.constraint(equalToConstant: height).isActive = true
      }
   }
   
   @IBInspectable var width: CGFloat = 10.0 {
      didSet {
         self.widthAnchor.constraint(equalToConstant: width).isActive = true
      }
   }
}
