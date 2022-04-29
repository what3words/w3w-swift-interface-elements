//
//  File.swift
//  
//
//  Created by Dave Duprey on 21/04/2022.
//

import Foundation
import W3WSwiftDesign


/// defaults to the correct colours for buttons
public class W3WSuButtonColors {
  
  public var xMarkColor = W3WColor(
    light: W3WCoreColor(grey: 0.5, alpha: 0.8),
    dark: W3WCoreColor(grey: 0.5, alpha: 0.8)
  )

  public init(xMarkColor: W3WColor? = nil) {
    if let x = xMarkColor { self.xMarkColor = x }
  }
  
}
