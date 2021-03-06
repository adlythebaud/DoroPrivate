//
//  RoundButton.swift
//  Doro
//
//  Created by Adly Thebaud on 11/22/17.
//  Copyright © 2017 ThebaudHouse. All rights reserved.
//

import UIKit

@IBDesignable class RoundButton: UIButton {
   
   @IBInspectable var height: CGFloat = 30.0 {
      didSet {
         
         self.heightAnchor.constraint(equalToConstant: height).isActive = true
         
         // this sets the height in IB
         self.frame.size.height = height
      }
   }
   
   @IBInspectable var width: CGFloat = 30.0 {
      didSet {
         
         self.widthAnchor.constraint(equalToConstant: width).isActive = true
         
         // this sets the width in IB
         self.frame.size.width = width
      }
   }
   
   @IBInspectable var cornerRadius: CGFloat = 0 {
      didSet {
         self.layer.cornerRadius = cornerRadius
      }
   }
   

   
}
