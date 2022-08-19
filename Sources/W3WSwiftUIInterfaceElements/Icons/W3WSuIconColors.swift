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
  
}
