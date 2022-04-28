//
//  File.swift
//  
//
//  Created by Dave Duprey on 21/04/2022.
//

import Foundation
import W3WSwiftDesign


/// defaults to the correct colours for all things microphone
public class W3WSuButtonColors {
  
  public init(forground: W3WColor? = nil, background: W3WColor? = nil) {
    if let f = forground { utilityButtonForegroundColor = f }
    if let b = background { utilityButtonBackgroundColor = b }
  }
  
  public var utilityButtonForegroundColor = W3WColor(
    light: W3WCoreColor(red: 225/256,  green:  31/256,  blue:  38/256),
    dark: W3WCoreColor(red: 225/256,  green:  31/256,  blue:  38/256)
  )
  
  public var utilityButtonBackgroundColor = W3WColor(
    light: W3WCoreColor(red: 225/256,  green:  31/256,  blue:  38/256),
    dark: W3WCoreColor(red: 225/256,  green:  31/256,  blue:  38/256)
  )
  
}
