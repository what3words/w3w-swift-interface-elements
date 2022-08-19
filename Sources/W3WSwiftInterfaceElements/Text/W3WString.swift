//
//  W3WString.swift
//  
//
//  Created by Dave Duprey on 2022-07-20.
//

import Foundation
import UIKit
import W3WSwiftDesign


/// + operator for W3WString
public func +(left: W3WString, right: W3WString) -> W3WString {
  left.string.append(right.string)
  return left
}


/// A utility class to simplify using NSAttributedString.
/// Allows simple concatination via +, and uses W3WColor
public class W3WString {

  var string = NSMutableAttributedString()

  public init() {
  }


  public init(_ str: String = "", font: UIFont? = nil) {
    string = NSMutableAttributedString(string: str)
  }


  public init(_ str: String, color: W3WColor? = nil, font: UIFont? = nil) {
    string = NSMutableAttributedString(string: str)
    _ = style(color: color, font: font)
  }


  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  public func asAttributedString() -> NSAttributedString {
    return string
  }


  func makeAttributes(color: W3WColor? = nil, font: UIFont? = nil) -> [NSAttributedString.Key: AnyObject] {
    var style = [NSAttributedString.Key: AnyObject]()
    if let c = color?.current.uiColor {
      style[.foregroundColor] = c
    }
    if let f = font {
      style[.font] = f
    }

    return style
  }


  public func style(color: W3WColor? = nil, font: UIFont? = nil) -> W3WString {
    let style = makeAttributes(color: color, font: font)
    string.setAttributes(style, range: NSRange(location: 0, length: string.length))

    return self
  }
  
  
  public func trim(characterSet: CharacterSet) {
    let mString = NSMutableAttributedString(attributedString: string)
    mString.mutableString.trimmingCharacters(in: characterSet)
    string = mString
  }
  
  
  public func withSlashes(color: W3WColor = .red) -> W3WString {
    trim(characterSet: CharacterSet(charactersIn: "/"))
    return W3WString("///", color: color, font: nil) + self
  }
  

  public func highlight(word: String, color: W3WColor? = nil, font: UIFont? = nil) {
    let style = makeAttributes(color: color, font: font)

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
