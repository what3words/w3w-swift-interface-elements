//
//  File.swift
//  
//
//  Created by Dave Duprey on 20/07/2022.
//

import UIKit
import W3WSwiftDesign


public class W3WWordsView: UILabel {
  
  
  var colors: W3WColorSet = .blackGrayRed
  var padding: W3WPadding = .bold
  //var font: UIFont = .systemFont(ofSize: 17.0, weight: .bold)


  public init(words: String = "---.---.---", colors: W3WColorSet = .blackGrayRed, font: UIFont? = nil) {
    self.colors = colors
    super.init(frame: .w3wWhatever)
    set(words: words, font: font)
  }
  
  
  public init(frame: CGRect, words: String = "---.---.---", colors: W3WColorSet = .blackGrayRed, font: UIFont? = nil) {
    self.colors = colors
    super.init(frame: frame)
    set(words: words, font: font)
  }
  

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    set(words: "---.---.---")
  }
  
  
  func set(words: String, font: UIFont? = nil) {
    let slashes = W3WString("///", colour: colors.highlight, font: font)
    let twa = W3WString(words, colour: colors.foreground, font: font)
    
    attributedText = (slashes + twa).asAttributedString()
    backgroundColor = colors.background.current.uiColor
  }
  

  public override func drawText(in rect: CGRect) {
    let insets: UIEdgeInsets = UIEdgeInsets(top: padding.value, left: padding.value, bottom: padding.value, right: padding.value)
    super.drawText(in: rect.inset(by: insets))
  }
  
  
}
