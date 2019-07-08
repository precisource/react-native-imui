//
//  StringExtension.swift
//  IMUIChat
//
//  Created by oshumini on 2017/3/7.
//  Copyright © 2017年 HXHG. All rights reserved.
//

import Foundation
import UIKit

public extension String {
  func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
    let boundingBox = self.sizeWithConstrainedWidth(with: width, font: font)
    return boundingBox.height
  }
  
  func sizeWithConstrainedWidth(with width: CGFloat, font: UIFont) -> CGSize {
    let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
    let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: convertToOptionalNSAttributedStringKeyDictionary([convertFromNSAttributedStringKey(NSAttributedString.Key.font): font]), context: nil)
    var tmpWidth = boundingBox.width
    if tmpWidth<30{
        tmpWidth = 30
    }
    return CGSize(width: tmpWidth, height: boundingBox.height)
  }
  
//    func  sizeWithTextContentWidth(with width:CGFloat, font:UIFont ,text:String) -> CGSize {
//        
//        
//        
//        return CGSize(width:0, height:0)
//    }
//    
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}
