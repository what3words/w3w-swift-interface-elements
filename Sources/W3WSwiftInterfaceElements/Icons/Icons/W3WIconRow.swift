//
//  File.swift
//  
//
//  Created by Dave Duprey on 16/05/2022.
//

import UIKit
import W3WSwiftDesign


/// A collection of icons for use on the side of in a TextField or other
public class W3WIconRow: UIView {
  
  /// the array of icons in the view
  var icons = [UIView]()
  
  /// size of the icons
  var iconSize: CGFloat = 0
  
  /// spacing
  //var spacing: W3WPadding = .light

  
  /// add a view to the row
  public func add(icon: UIView) {
    
    icons.append(icon)
    addSubview(icon)
    
    self.resize()
  }
  

  // MARK: Layout
  
  
  func resize() {
    iconSize = frame.height
    self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.iconSize * CGFloat(self.icons.count), height: self.iconSize)
  }
  
  
  public func getWidth() -> CGFloat {
    var x = 0.0
    
    for icon in icons {
      x += icon.frame.width
    }
    
    return x
  }
  
  
  public override func layoutSubviews() {
    super.layoutSubviews()

    iconSize = frame.height

    var x = 0.0
    for icon in icons {
      icon.frame = CGRect(x: x, y: 0.0, width: iconSize, height: iconSize)
      //print(icon.frame)
      x += iconSize
    }
  }
  
}
