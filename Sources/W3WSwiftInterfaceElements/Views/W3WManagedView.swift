//
//  File.swift
//  
//
//  Created by Dave Duprey on 24/06/2022.
//

import UIKit


/// Holds a UIView and closure that defines its position
public class W3WManagedView<UIType: UIView> {
  
  public var view: UIType
  public var frame: () -> (CGRect) = { return .zero }
  
  
  public init(view: UIType? = nil, frame: @escaping () -> (CGRect) = { return .zero }) {
    self.view = view ?? UIType(frame: frame())
    self.frame = frame
  }
  
  
  public func updatePosition() {
    view.frame = frame()
  }
  
}
