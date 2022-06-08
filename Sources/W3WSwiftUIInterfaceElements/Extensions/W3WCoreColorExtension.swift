//
//  File.swift
//  
//
//  Created by Dave Duprey on 07/06/2022.
//

#if os(watchOS) || os(iOS)


import SwiftUI
import W3WSwiftDesign


extension W3WCoreColor {
  

  /// init from a SwiftUI Color
  @available(iOS 13.0, watchOS 7.0, *)
  public init(suColor: Color) {
    if let cgColor = suColor.cgColor, let (red, green, blue, alpha) = W3WCoreColor.toRGB(cgColor: cgColor) {
      self.init(red: red, green: green, blue: blue, alpha: alpha)
    } else {
      self = .black
    }
  }
  
  /// returns a SwiftUI Color color
  @available(iOS 13.0, watchOS 6.0, macOS 11, tvOS 14, *)
  public var suColor: Color { get { return Color(red: red, green: green, blue: blue).opacity(alpha) } }

  
}

#endif
