//
//  File.swift
//  
//
//  Created by Dave Duprey on 16/05/2022.
//

import Foundation
import UIKit
import W3WSwiftDesign
import W3WSwiftInterfaceCommon
import SwiftUI


public class W3WTextField: UITextField, UITextFieldDelegate {
 
  // MARK: Vars
  
  public var onTextChange: (String) -> () = { _ in }
  
  var colors = W3WColorSet.searchBox
  
  var icons = W3WIconRow()
  

  // MARK: Init

  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    configure()
  }
  
  
  /// set up the UI stuff and more
  func configure() {
    delegate = self
    
    // set up this view
    placeholder = "Search"
    clearButtonMode = .always
    layer.backgroundColor = colors.background.current.cgColor
    layer.cornerRadius = W3WCornerRadius.soft.value

    // icon sizes
    let iconSize = CGRect(x: 0.0, y: 0.0, width: frame.height, height: frame.height)

    // put search icon on left side
    leftView = W3WIcon(icon: .search, colors: .searchIcon, frame: iconSize, padding: .light)
    leftViewMode = .always

    // put icon buttons on the right hand side
    icons.frame = CGRect(x: bounds.width - icons.frame.width, y: 0.0, width: 0.0, height: frame.height / 2.0)
    icons.clipsToBounds = true
    icons.backgroundColor = .clear
    rightView = icons
    rightViewMode = .unlessEditing
    
    // voice icon
//    let voiceButton = W3WIconButton(drawing: W3WDrawList.micWithSlashes, colors: .microphoneGray, frame: iconSize, padding: .none) {
//      print("TAP 3")
//    }
//    
//    add(button: voiceButton)
  }
  

  // MARK: Accessors

  
  public func add(button: W3WIconButton) {
    icons.add(icon: button)
  }
  
  
  public func add(plugin: W3WPlugin) {
    add(button: plugin.button)
  }
  
  
  public func set(text: String) {
    self.text = text
    resignFirstResponder()
  }
  
  
  // MARK: UITextFieldDelegate
  
  
  /// called when the text contents change
  public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    if let t = text {
      let newText = t.replacingCharacters(in: Range(range, in: t)!, with: string)
      onTextChange(newText)
    }
    
    return true
  }

  
  
  // MARK: UI Overrides
  
  // Provides left padding for images
  public override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: 0.0, y: 0.0, width: frame.height, height: frame.height)
  }
  
  
  // Provides left padding for images
  public override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
    //return CGRect(x: bounds.width - icons.frame.width, y: 0.0, width: icons.frame.width, height: frame.height)
    return CGRect(x: bounds.width - icons.frame.width - W3WPadding.thin.value, y: W3WPadding.light.value, width: icons.getWidth(), height: bounds.height - W3WPadding.light.value * 2.0)
  }
  
  
  
  // MARK: Layout
  
//
//  func iconsWidth() -> CGFloat {
//    var width = CGFloat(0.0)
//
//    for view in icons.arrangedSubviews {
//      width += view.frame.width
//    }
//
//    return width
//  }
//

//  func iconsFrame() -> CGRect {
//    return CGRect(x: frame.width - icons.frame.width, y: 0.0, width: iconsWidth(), height: frame.height)
//  }

  
  public override func layoutSubviews() {
    super.layoutSubviews()
    
    icons.frame = rightViewRect(forBounds: bounds)
    icons.layoutSubviews()
    
//    for view in icons.arrangedSubviews {
//      view.sizeToFit()
//    }
  }

}
