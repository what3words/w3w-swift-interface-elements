//
//  File.swift
//  
//
//  Created by Dave Duprey on 19/05/2022.
//

import Foundation
import UIKit
import W3WSwiftDesign


public class W3WHandleIndicator: UIView {
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    position()
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    position()
  }
  
  
  public func position() {
    let indicatorSize = CGSize(width: 32.0, height: W3WPadding.thin.value)
    var indicatorX = W3WPadding.heavy.value
    backgroundColor = W3WColor.tertiaryLabel.current.uiColor

    if let parentView = superview {
      indicatorX = (parentView.frame.width - indicatorSize.width) / CGFloat(2)
    }

    self.frame = CGRect(origin: CGPoint(x: indicatorX, y: W3WPadding.bold.value), size: indicatorSize)
    layer.cornerRadius = indicatorSize.height / CGFloat(2.0)
  }
  
  
  public override func layoutSubviews() {
    position()
  }
  
  
}
