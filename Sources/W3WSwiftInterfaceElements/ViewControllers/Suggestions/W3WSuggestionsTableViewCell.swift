//
//  File.swift
//  
//
//  Created by Dave Duprey on 19/05/2022.
//

import UIKit
import W3WSwiftApi
import W3WSwiftDesign


/// A UITableViewCell for displaying a what3words address.
/// the heavy lifting is done in W3WSuggestionViewLayout
public class W3WSuggestionsTableViewCell: UITableViewCell, W3WSuggestionViewLayout {
  
  public var colors: W3WColorSet = .blackGrayRed
  
  public var suggestion: W3WSuggestion?
  
  public var highlight: Bool = false
  
  public var disableDarkmode: Bool = false
  
  public var wordsLabel: UILabel?
  
  public var nearestPlaceLabel: UILabel?
  
  public var distanceLabel: UILabel?
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    self.arrangeViews()
    updateColors()
  }
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    instantiateUIElements()
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    instantiateUIElements()
  }

  
  /// respond to dark/light mode updates
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    updateColors()
  }

  
}
