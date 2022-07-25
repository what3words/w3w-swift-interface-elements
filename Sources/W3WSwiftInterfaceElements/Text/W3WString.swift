//
//  W3WString.swift
//  
//
//  Created by Dave Duprey on 2022-07-20.
//

import Foundation
import UIKit
import W3WSwiftDesign



public func +(left: W3WString, right: W3WString) -> W3WString {
  left.string.append(right.string)
  return left
}


//extension UIFont {
//
//  func bold() -> UIFont {
//    return UIFont(descriptor: fontDescriptor.withSymbolicTraits(.traitBold)!, size: pointSize)
//  }
//
//}


public class W3WString {

  var string = NSMutableAttributedString()

  public init() {
  }


  public init(_ str: String = "", font: UIFont? = nil) {
    string = NSMutableAttributedString(string: str)
  }


  public init(_ str: String, colour: W3WColor? = nil, font: UIFont? = nil) {
    string = NSMutableAttributedString(string: str)
    _ = style(colour: colour, font: font)
  }


  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  public func asAttributedString() -> NSAttributedString {
    return string
  }


  func makeAttributes(colour: W3WColor? = nil, font: UIFont? = nil) -> [NSAttributedString.Key: AnyObject] {
    var style = [NSAttributedString.Key: AnyObject]()
    if let c = colour?.current.uiColor {
      style[.foregroundColor] = c
    }
    if let f = font {
      style[.font] = f
    }

    return style
  }


  public func style(colour: W3WColor? = nil, font: UIFont? = nil) -> W3WString {
    let style = makeAttributes(colour: colour, font: font)
    string.setAttributes(style, range: NSRange(location: 0, length: string.length))

    return self
  }


  public func highlight(word: String, colour: W3WColor? = nil, font: UIFont? = nil) {
    let style = makeAttributes(colour: colour, font: font)

    if let regex = try? NSRegularExpression(pattern: word, options: .caseInsensitive) {
      let matches = regex.matches(in: string.string, range: NSRange(location: 0, length: string.length))
      for match in matches {
        string.addAttributes(style, range: match.range)
      }
    }

  }


  static public func +=( lhs: inout W3WString, rhs: W3WString) {
    lhs = lhs + rhs
  }

}
