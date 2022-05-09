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
  
  public var cancelButton: W3WColor
  public var microhoneButton: W3WTwoColor
  
  public init(cancelButton: W3WColor = W3WSuButtonColors.defaultCancelButtonColor, microhpneButton: W3WTwoColor = W3WSuButtonColors.defaultMicrophoneButtonColor) {
    self.cancelButton = cancelButton
    self.microhoneButton = microhpneButton
  }
  
  static public let defaultCancelButtonColor = W3WColor(all: W3WCoreColor.init(grey: 0.5, alpha: 0.8))
  
  static public let defaultMicrophoneButtonColor = W3WTwoColor(
    foreground: W3WColor.ctaBodyBackground3,
    background: W3WColor.ctaBodyText1
  )
}


//public class W3WSuMicrophoneButtonColor: W3WColorForeBackground {
//  public override init(
//    foreground: W3WColor = W3WColor.ctaBodyBackground3,
//    background: W3WColor = W3WColor.ctaBodyText1
//  ) {
//    super.init(foreground: foreground, background: background)
//  }
//}
//
//
//public class W3WSuCancelButtonColor: W3WSuColorForeground {
//  public override init(
//    foreground: W3WColor = W3WColor(all: W3WCoreColor.init(grey: 0.5, alpha: 0.8))
//  ) {
//    super.init(foreground: foreground)
//  }
//}


