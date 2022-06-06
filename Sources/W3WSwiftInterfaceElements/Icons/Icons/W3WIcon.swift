//
//  File.swift
//  
//
//  Created by Dave Duprey on 16/05/2022.
//

import UIKit
import W3WSwiftDesign
import W3WSwiftInterfaceCommon



public enum W3WIconName: String {
  case search = "magnifyingglass"
}


public class W3WIcon: UIView {
  
  static public let micOn   = W3WIcon(drawing: .micWithSlashes, colors: .microphoneOn)
  static public let micOff  = W3WIcon(drawing: .micWithSlashes, colors: .microphoneOff)
  static public let micGray = W3WIcon(drawing: .micWithSlashes, colors: .microphoneGray)
  static public let ocr     = W3WIcon(drawing: .ocr)

  
  static public let defaultFrame = CGRect(x: 0.0, y: 0.0, width: W3WRowHeight.extraSmall.value, height: W3WRowHeight.extraSmall.value)
  
  var image: UIView?
  var drawing: W3WDrawList?
  var colors: W3WColorSet?
  var padding: W3WPadding!
  
  
  public init(icon: W3WIconName, colors: W3WColorSet = .blackGrayRed, frame: CGRect = W3WIcon.defaultFrame, padding: W3WPadding = .none) {
    super.init(frame: frame)
    set(icon: icon, colors: colors, padding: padding)
  }
  
  
  public init(drawing: W3WDrawList, colors: W3WColorSet = .blackGrayRed, frame: CGRect = W3WIcon.defaultFrame, padding: W3WPadding = .none) {
    super.init(frame: frame)
    set(drawing: drawing, colors: colors, padding: padding)
  }
  

  required init?(coder: NSCoder) {
    self.colors = .blackGrayRed
    super.init(coder: coder)
  }
  
  
  // MARK: Accessors
  
  
  public func set(icon: W3WIconName, colors: W3WColorSet, padding: W3WPadding = .none) {
    self.padding = padding
    self.colors  = colors
    
    if #available(iOS 13.0, *) {
      image = UIImageView(image: UIImage(systemName: "magnifyingglass"))
    } else {
      // Fallback on earlier versions
    }
    
    image?.tintColor = colors.foreground.current.uiColor
    image?.frame = frame.inset(by: UIEdgeInsets(top: padding.value, left: padding.value, bottom: padding.value, right: padding.value))
    
    if let i = image {
        addSubview(i)
    }
  }
  
  
  public func set(drawing: W3WDrawList, colors: W3WColorSet, padding: W3WPadding = .none) {
    self.padding = padding
    self.colors  = colors
    self.drawing = drawing
    
    image = W3WDrawView(drawing: drawing, colors: colors, frame: frame.inset(by: UIEdgeInsets(top: padding.value, left: padding.value, bottom: padding.value, right: padding.value)))

    if let i = image {
      addSubview(i)
    }
  }
  
  
  func uiImage() -> UIImage {
    if #available(iOS 10.0, *) {
      let renderer = UIGraphicsImageRenderer(bounds: bounds)
      return renderer.image { rendererContext in
        layer.render(in: rendererContext.cgContext)
      }
    } else {
      UIGraphicsBeginImageContext(self.frame.size)
      self.layer.render(in:UIGraphicsGetCurrentContext()!)
      let image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      return UIImage(cgImage: image!.cgImage!)
    }
  }

  
  // MARK: Layout
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    image?.frame = CGRect(x: padding.value, y: padding.value, width: frame.width - padding.value * 2.0, height: frame.height - padding.value * 2.0)
    
//    if let d = drawing, let i = image {
//      d.draw(uiView: i)
//    }
  }
  
}
