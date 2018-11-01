//
//  UIImageMessageListExtension.swift
//  sample
//
//  Created by oshumini on 2017/5/19.
//  Copyright © 2017年 HXHG. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage {
  class func imuiImage(with name: String) -> UIImage? {
    let bundle = Bundle.imuiBundle()
    let imagePath = bundle.path(forResource: "IMUIAssets.bundle/image/\(name)", ofType: "png")
    return UIImage(contentsOfFile: imagePath!)
  }
}

public extension UIColor {
  convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
    self.init(
      red: CGFloat(red) / 255.0,
      green: CGFloat(green) / 255.0,
      blue: CGFloat(blue) / 255.0,
      alpha: a
    )
  }
  
  convenience init(rgb: Int, a: CGFloat = 1.0) {
    self.init(
      red: (rgb >> 16) & 0xFF,
      green: (rgb >> 8) & 0xFF,
      blue: rgb & 0xFF,
      a: a
    )
  }
}
