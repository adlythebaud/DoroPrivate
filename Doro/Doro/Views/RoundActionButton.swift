//
//  RoundActionButton.swift
//  Doro
//
//  Created by Adly Thebaud on 11/14/17.
//  Copyright © 2017 ThebaudHouse. All rights reserved.
//

import UIKit

@IBDesignable
class RoundActionButton: UIButton {

   @IBInspectable var cornerRadius: CGFloat = 0 {
      didSet {
         self.layer.cornerRadius = cornerRadius
      }
   }
   
}
