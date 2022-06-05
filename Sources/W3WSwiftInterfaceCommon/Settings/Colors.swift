//
//  File.swift
//  
//
//  Created by Dave Duprey on 18/05/2022.
//

import W3WSwiftDesign



extension W3WColorSet {
  
  static public let searchBox      = W3WColorSet(foreground: .black, background: W3WColor(all: W3WCoreColor(hex: 0x767680, alpha: 0.12)), highlight: .labelColourLight, secondary: .labelColourLight)
  
  static public let searchIcon     = W3WColorSet(foreground: .iosSecondaryLabel, background: .clear, highlight: .iosSecondaryLabel,   secondary: .iosSecondaryLabel)

  static public let microphoneOff  = W3WColorSet(foreground: .red,   background: .clear,       highlight: .white, secondary: .red)
  static public let microphoneOn   = W3WColorSet(foreground: .red,   background: .clear,       highlight: .red,   secondary: .red)
  static public let microphoneGray = W3WColorSet(foreground: .iosSecondaryLabel, background: .clear, highlight: .iosSecondaryLabel,   secondary: .iosSecondaryLabel)

}
