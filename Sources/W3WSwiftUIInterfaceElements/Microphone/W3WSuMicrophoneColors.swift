//
//  File.swift
//  
//
//  Created by Dave Duprey on 21/04/2022.
//

import Foundation
import W3WSwiftDesign


/// defaults to the correct colours for all things microphone
public class W3WSuMicrophoneColors {
  
  public var micIcon: W3WColorSet
  
  public init(micIcon: W3WColorSet = W3WSuIconColors.defaultMicIcon) {
    self.micIcon = micIcon
  }

  
  public init(micOn: W3WColor? = nil, micOff: W3WColor? = nil, micHalo: W3WColor? = nil, slashes: W3WColor? = nil, text: W3WColor? = nil) { //, buttonBackground: W3WColor? = nil) {
    
    self.micIcon = W3WColorSet(foreground: slashes ?? .red, background: slashes ?? .red, highlight: text ?? .white, secondary: .clear)

    if let m = micOn { self.micOn = m }
    if let m = micOff { self.micOff = m }
    if let m = micHalo { self.micHalo = m }
    if let s = slashes { self.slashes = s }
    if let t = text { self.text = t }
    //if let b = buttonBackground { self.buttonBackground = b }
  }

  public var micOn = W3WColor(
    light: W3WCoreColor(red: 225/256,  green:  31/256,  blue:  38/256),
    dark: W3WCoreColor(red: 225/256,  green:  31/256,  blue:  38/256)
  )

  public var micOff = W3WColor(
    light: W3WCoreColor(red: 256/256,  green: 256/256,  blue: 256/256),
    dark: W3WCoreColor(red: 256/256,  green: 256/256,  blue: 256/256)
  )

  public var micHalo = W3WColor(
    light: W3WCoreColor(red: 225/256,  green:  31/256,  blue:  38/256),
    dark: W3WCoreColor(red: 225/256,  green:  31/256,  blue:  38/256)
  )

  public var slashes = W3WColor(
    light: W3WCoreColor(red: 256/256,  green: 256/256,  blue: 256/256),
    dark: W3WCoreColor(red: 256/256,  green: 256/256,  blue: 256/256)
  )

  public var text = W3WColor(
    light: W3WCoreColor(red: 256/256,  green: 256/256,  blue: 256/256),
    dark: W3WCoreColor(red: 256/256,  green: 256/256,  blue: 256/256)
  )
  
//  public var buttonBackground = W3WColor(
//    light: W3WCoreColor(hex: 0x31383D),
//    dark: W3WCoreColor(hex: 0x31383D)
//  )

}
