//
//  File.swift
//
//
//  Created by Dave Duprey on 21/04/2022.
//

import Foundation
import UIKit


/// settings local to the microphone stuff, soon to be replaced by the w3w design library
class W3WSuMicrophoneSettings {
  
  #if os(watchOS) || os(iOS)
  static let micCircle                  = CGFloat(10.0) // CGFloat(76.0)
  static let micCircleHalo3Small        = CGFloat(96.0)
  static let micCircleHalo3Large        = CGFloat(216.0)

  static let smallestMaxVolume          = 0.001
  #endif
}


