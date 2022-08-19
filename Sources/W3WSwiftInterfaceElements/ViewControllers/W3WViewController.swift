//
//  File.swift
//  
//
//  Created by Dave Duprey on 19/05/2022.
//

import UIKit
import W3WSwiftDesign


/// convenience class overwriting UIViewController that
/// manages sub views.  Subviews can be passed in with
/// a closure defining it's position
open class W3WViewController: UIViewController {
  
  public var onDismiss: () -> () = { }
  
  public var colors: W3WColorSet = .lightDarkMode
  var handleIndicator = W3WHandleIndicator()
  var managedViews = [W3WManagedView]()
  
  public var showHandle: Bool {
    get {
      return !handleIndicator.isHidden
    }
    set {
      handleIndicator.isHidden = !newValue
    }
  }
  
  
  /// determines if the view was presented modally or as a regular view
  func isPresentedModally() -> Bool {
    if self.presentingViewController != nil {
        return true
    }
    
    if self.navigationController?.presentingViewController?.presentedViewController == self.navigationController {
        return true
    }
    
    if self.tabBarController?.presentingViewController?.isKind(of: UITabBarController.self) ?? false { //  isKindOfClass:[UITabBarController class]])
        return true
    }
    
    return false
  }
  
  
  override open func viewDidLoad() {
    super.viewDidLoad()
    
    updateColors()
    
    if isPresentedModally() {
      view.addSubview(handleIndicator)
    }
  }
  
  
  public func add(view: UIView, frame: @escaping () -> (CGRect)) {
    let managedView = W3WManagedView(view: view, frame: frame)
    managedViews.append(managedView)
    
    self.view.addSubview(view)
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
    
    for managedView in managedViews {
      managedView.updatePosition()
    }
  }
  
  
  public override func viewWillDisappear(_ animated: Bool) {
    onDismiss()
    super.viewWillDisappear(animated)
  }

}
