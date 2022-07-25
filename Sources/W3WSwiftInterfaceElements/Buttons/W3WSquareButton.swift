//
//  File.swift
//  
//
//  Created by Dave Duprey on 06/07/2022.
//

import Foundation
import UIKit
import W3WSwiftDesign


public class W3WSquareButton: UIButton {
  
  public var onPress: () -> () = { }
  
  var colors: W3WColorSet!
  
  public init(frame: CGRect, title: String? = nil, image: UIImage? = nil, colors: W3WColorSet = .whiteGrayRed) {
    super.init(frame: frame)
    configure(title: title, image: image, colors: colors)
    addTarget(self, action: #selector(pressed), for: .touchUpInside)
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func configure(title: String? = nil, image: UIImage? = nil, colors: W3WColorSet = .whiteGrayRed) {
    self.colors = colors
    
    setTitle(title, for: .normal)
    titleLabel?.textAlignment = .center
    setImage(image, for: .normal)
//    alignImageAndTitleVertically()
    updateColors()
  }

  
  func updateColors() {
    layer.backgroundColor = colors.background.current.cgColor
    layer.cornerRadius = W3WCornerRadius.soft.value
    titleLabel?.textColor = colors.foreground.current.uiColor
  }
  
  
  @objc
  func pressed() {
    onPress()
  }

  
//  override public func layoutSubviews() {
//    super.layoutSubviews()
//
//    let imageSize = imageView?.frame.size.height ?? 0.0
//    let titleSize = titleLabel?.frame.size.height ?? 0.0
//
//    imageView?.center = CGPoint(x: center.x, y: center.y - imageSize / 2.0)
//    //titleLabel?.center = CGPoint(x: center.x, y: center.y + titleSize / 2.0)
//  }
  
  
//  func alignImageAndTitleVertically(padding: CGFloat = 4.0) {
//    let imageSize = imageView!.frame.size
//    let titleSize = titleLabel!.frame.size
//    let totalHeight = imageSize.height + titleSize.height + padding
//
//    imageEdgeInsets = UIEdgeInsets(
//      top: -(totalHeight - imageSize.height),
//      left: 0,
//      bottom: 0,
//      right: -titleSize.width
//    )
//
//    titleEdgeInsets = UIEdgeInsets(
//      top: 0,
//      left: -imageSize.width,
//      bottom: -(totalHeight - titleSize.height),
//      right: 0
//    )
//  }
  
}
