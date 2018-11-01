//
//  IMUIFileMessageCell.swift
//  RCTAuroraIMUI
//
//  Created by jialing Lee on 2018/10/31.
//  Copyright © 2018 HXHG. All rights reserved.
//

import UIKit

class IMUIFileMessageCell: IMUIBaseMessageCell {
  
  var backView = UIView()
  var iconImg = UIImageView()
  var fileSizeLabel = UILabel()
  var fileNameLabel = UILabel()
  let screenW = UIScreen.main.bounds.size.width
  
  static public var pdfIcon:UIImage?
  
  static public var unknownIcon:UIImage?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backView.backgroundColor = UIColor.clear
    iconImg.contentMode = UIViewContentMode.scaleAspectFill
    
    fileNameLabel.textColor = UIColor(rgb: 0x333333, a: 15)
    fileNameLabel.font = UIFont(name: "PingFangSC-Regular", size: 15)
    fileNameLabel.numberOfLines = 2
    fileNameLabel.textAlignment = NSTextAlignment.left
    
    fileSizeLabel.textColor = UIColor(rgb: 0x666666, a: 1)
    fileSizeLabel.font = UIFont(name: "PingFangSC-Regular", size: 15)
    fileSizeLabel.numberOfLines = 1
    fileSizeLabel.textAlignment = NSTextAlignment.left
    
    
    bubbleView.addSubview(backView)
    backView.addSubview(iconImg)
    backView.addSubview(fileSizeLabel)
    backView.addSubview(fileNameLabel)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  override func presentCell(with message: IMUIMessageModelProtocol, viewCache: IMUIReuseViewCache , delegate: IMUIMessageMessageCollectionViewDelegate?) {
    super.presentCell(with: message, viewCache: viewCache, delegate: delegate)
    let layout = message.layout
    
    self.backView.frame = CGRect(origin: CGPoint.zero, size: layout.bubbleFrame.size)
    let tmpDict = message.customDict
    let fileSize = tmpDict.object(forKey: "size") as! Float;
    let strFileSize = String(format: "%.2fMB", fileSize / 1024 / 1024)
    let fileName = tmpDict.object(forKey: "displayName") as! String
//    let path = tmpDict.object(forKey: "path") as! String
//    let url = tmpDict.object(forKey: "url") as! String
    let ext = tmpDict.object(forKey: "extension") as! String;
    fileNameLabel.text = fileName
    fileSizeLabel.text = strFileSize
    
    if(ext == "pdf"){
      if(IMUIFileMessageCell.pdfIcon == nil){
        IMUIFileMessageCell.pdfIcon = UIImage.imuiImage(with: "pdf")
      }
      iconImg.image = IMUIFileMessageCell.pdfIcon
    }else{
      if(IMUIFileMessageCell.unknownIcon == nil){
        IMUIFileMessageCell.unknownIcon = UIImage.imuiImage(with: "unknown")
      }
      iconImg.image = IMUIFileMessageCell.unknownIcon
    }
    
    if(fileName == "习近平总数据重要讲话思维导图.pdf"){
      print("here")
    }
    // 显示文件名的Label宽高
    let fileNameLabelSize = IMUIFileMessageCell.calculateTextContentSize(label: fileNameLabel, isOutGoing: message.isOutGoing)
    // 显示文件大小的Label宽高
    let fileSizeLabelSize = IMUIFileMessageCell.calculateTextContentSize(label: fileSizeLabel, isOutGoing: message.isOutGoing)
    // 上下内边距
    let paddingV = CGFloat(12) * 2
    // 左右内边距
    let paddingH = CGFloat(15) * 2
    // 右边图标距离左边文字内容的距离
    let iconMarginLeft = CGFloat(5)
    // 图标大小
    let iconSize = CGFloat(63)
    // 左边文字内容宽度（上：文件名，下：文件大小，取最宽的）
    let textContentW = fileNameLabelSize.width > fileSizeLabelSize.width ? fileNameLabelSize.width : fileSizeLabelSize.width
    // 左边文字内容区域高度
    let textContentH = CGFloat(68.5)
    
    let width = paddingH + textContentW + iconMarginLeft + iconSize
    let height = paddingV + textContentH
    
    let nameX = CGFloat(15)
    let nameY = CGFloat(12)
    fileNameLabel.frame = CGRect(x:nameX,y:nameY,width:fileNameLabelSize.width,height:CGFloat(42))
    
    let sizeX = CGFloat(15)
    let sizeY = CGFloat(55)
    fileSizeLabel.frame = CGRect(x:sizeX,y:sizeY,width:fileSizeLabelSize.width,height:CGFloat(25.5))
    
    let iconX = width - paddingH / 2 - iconSize
    let iconY = (height - iconSize) / 2
    iconImg.frame = CGRect(x:iconX,y:iconY,width:iconSize,height:iconSize)
    
    let origin = bubbleView.frame.origin
    bubbleView.frame = CGRect(x: origin.x, y: origin.y, width: width, height: height)
  }
  
  func heightWithFont(font : UIFont, fixedWidth : CGFloat, text : String) -> CGSize {
    guard text.count > 0 && fixedWidth > 0 else {
      
      return CGSize.zero
    }
    let size = CGSize(width:fixedWidth, height:CGFloat(MAXFLOAT))
    let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: [NSFontAttributeName : font], context:nil)
    
    return rect.size
  }
  
  static func calculateTextContentSize(label: UILabel, isOutGoing: Bool) -> CGSize {
    let tmpLabel = YYLabel()
    tmpLabel.font = label.font
    tmpLabel.setupYYText(label.text ?? "", andUnunderlineColor: UIColor.clear)
    tmpLabel.numberOfLines = (UInt)(label.numberOfLines)
    
    return tmpLabel.getTheLabelBubble(CGSize(width: IMUIMessageCellLayout.bubbleMaxWidth - CGFloat(63 + 5), height: CGFloat(42)))
  }
}


