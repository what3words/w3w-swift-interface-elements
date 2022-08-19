//
//  File.swift
//  
//
//  Created by Dave Duprey on 20/07/2022.
//

import UIKit
import W3WSwiftDesign


/// Given a three word address, this is a UILabel that renders it correctly with slashes and colours
public class W3WWordsView: UILabel {
  
  var colors: W3WColorSet = .darkBlueGrayRed
  var padding: W3WPadding = .bold


  public init(words: String = "---.---.---", colors: W3WColorSet = .darkBlueGrayRed, font: UIFont? = nil) {
    self.colors = colors
    super.init(frame: .w3wWhatever)
    set(words: words, font: font)
  }
  
  
  public init(frame: CGRect, words: String = "---.---.---", colors: W3WColorSet = .darkBlueGrayRed, font: UIFont? = nil) {
    self.colors = colors
    super.init(frame: frame)
    set(words: words, font: font)
  }
  

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    set(words: "---.---.---")
  }
  
  
  func set(words: String, font: UIFont? = nil) {
    let slashes = W3WString("///", color: colors.highlight, font: font)
    let twa = W3WString(words, color: colors.foreground, font: font)
    
    attributedText = (slashes + twa).asAttributedString()
    backgroundColor = colors.background.current.uiColor
  }
  

  public override func drawText(in rect: CGRect) {
    let insets: UIEdgeInsets = UIEdgeInsets(top: padding.value, left: padding.value, bottom: padding.value, right: padding.value)
    super.drawText(in: rect.inset(by: insets))
  }
  
  
}
