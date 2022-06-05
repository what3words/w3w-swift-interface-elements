//
//  File.swift
//  
//
//  Created by Dave Duprey on 19/05/2022.
//

import UIKit
import W3WSwiftDesign


open class W3WViewController: UIViewController {
  
  public var colors: W3WColorSet = .lightDarkMode
  var handleIndicator = W3WHandleIndicator()
  
  
  public var showHandle: Bool {
    get {
      return !handleIndicator.isHidden
    }
    set {
      handleIndicator.isHidden = !newValue
    }
  }
  
  
  override open func viewDidLoad() {
    updateColors()
    
    //if isBeingPresented {
      view.addSubview(handleIndicator)
    //}
  }
  
  
  /// respond to dark/light mode updates
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    updateColors()
  }
  
  
  func updateColors() {
    view.backgroundColor = colors.background.current.uiColor
    view.layer.backgroundColor = colors.background.current.cgColor
  }

  
  open override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    handleIndicator.position()
  }

}
