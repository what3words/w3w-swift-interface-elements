//
//  File.swift
//  
//
//  Created by Dave Duprey on 21/04/2022.
//

import Foundation
import W3WSwiftDesign


/// defaults to the correct colours for all things microphone
public class W3WSuIconColors {

  static public let defaultMicIcon       = W3WColorSet(foreground: .red, background: .red, highlight: .white, secondary: .clear)
  static public let defaultSlashes       = W3WColor.red
  static public let defaultVerticalWords = W3WColorSet.whiteGrayRed //W3WColorSet(foreground: .text, background: .clear, highlight: .red, secondary: W3WColor(all: W3WCoreColor(hex: 0xB5B5B5)))

  public var micIcon: W3WColorSet
  public var slashes: W3WColor
  public var verticalWords: W3WColorSet
  
  public init(micIcon: W3WColorSet = W3WSuIconColors.defaultMicIcon, slashes: W3WColor = W3WSuIconColors.defaultSlashes, verticalWords: W3WColorSet = W3WSuIconColors.defaultVerticalWords) {
    self.micIcon = micIcon
    self.slashes = slashes
    self.verticalWords = verticalWords
  }
  
  
//  public init(slashes: W3WColor? = nil, primaryTextColor: W3WColor? = nil, secondaryTextColor: W3WColor? = nil, highlightColor: W3WColor? = nil) {
//      if let s = slashes { self.slashes = s }
//      if let p = primaryTextColor { self.primaryText = p }
//      if let s = secondaryTextColor { self.secondaryText = s }
//      if let h = highlightColor { self.highlight = h }
//  }
//
//
//  public var slashes = W3WColor(
//    light: W3WCoreColor(red: 225/256,  green:  31/256,  blue:  38/256),
//    dark: W3WCoreColor(red: 225/256,  green:  31/256,  blue:  38/256)
//  )
//
//  public var primaryText = W3WColor(
//    light: W3WCoreColor(red: 1.0,  green:  1.0,  blue:  1.0),
//    dark: W3WCoreColor(red: 1.0,  green:  1.0,  blue:  1.0)
//  )
//
//  public var secondaryText = W3WColor(
//    light: W3WCoreColor(red: 181/256, green:  181/256, blue:  181/256),
//    dark: W3WCoreColor(red: 181/256, green:  181/256, blue:  181/256)
//  )
//
//  public var highlight = W3WColor(
//    light: W3WCoreColor(red: 215/256, green:  0/256,   blue:  30/256),
//    dark: W3WCoreColor(red: 215/256, green:  0/256,   blue:  30/256)
//  )
  
  
  //public var microphoneButtonBackground = W3WColor.ctaBodyBackground3

  //public var microphoneButtonForground  = W3WColor.ctaBodyText1
  
  
}
