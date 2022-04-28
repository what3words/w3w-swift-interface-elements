//
//  File.swift
//  
//
//  Created by Dave Duprey on 21/04/2022.
//

import Foundation
import W3WSwiftDesign


/// defaults to the correct colours for all things microphone
public class W3WSuLogoColors {
  
  public init(slashes: W3WColor? = nil, primaryTextColor: W3WColor? = nil, secondaryTextColor: W3WColor? = nil, highlightColor: W3WColor? = nil) {
      if let s = slashes { self.slashes = s }
      if let p = primaryTextColor { self.primaryTextColor = p }
      if let s = secondaryTextColor { self.secondaryTextColor = s }
      if let h = highlightColor { self.highlightColor = h }
  }
  
  
  public var slashes = W3WColor(
    light: W3WCoreColor(red: 225/256,  green:  31/256,  blue:  38/256),
    dark: W3WCoreColor(red: 225/256,  green:  31/256,  blue:  38/256)
  )

  public var primaryTextColor = W3WColor(
    light: W3WCoreColor(red: 1.0,  green:  1.0,  blue:  1.0),
    dark: W3WCoreColor(red: 1.0,  green:  1.0,  blue:  1.0)
  )

  public var secondaryTextColor = W3WColor(
    light: W3WCoreColor(red: 181/256, green:  181/256, blue:  181/256),
    dark: W3WCoreColor(red: 181/256, green:  181/256, blue:  181/256)
  )
  
  public var highlightColor = W3WColor(
    light: W3WCoreColor(red: 215/256, green:  0/256,   blue:  30/256),
    dark: W3WCoreColor(red: 215/256, green:  0/256,   blue:  30/256)
  )
  
}
