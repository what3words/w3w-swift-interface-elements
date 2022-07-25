//
//  File.swift
//  
//
//  Created by Dave Duprey on 16/05/2022.
//

import UIKit
import W3WSwiftDesign
import W3WSwiftInterfaceCommon


public class W3WIconButton: W3WIcon {
  
  public var onTap: () -> () = { }
  
  public init(icon: W3WIconName, color: W3WColorSet = .blackGrayRed, frame: CGRect = W3WIcon.defaultFrame, padding: W3WPadding = .none, onTap: @escaping () -> () = { }) {
    self.onTap = onTap
    super.init(icon: icon, colors: color, frame: frame, padding: padding)
    configure()
  }
  
  
  public init(drawing: W3WDrawList, colors: W3WColorSet = .blackGrayRed, frame: CGRect = W3WIcon.defaultFrame, padding: W3WPadding = .none, onTap: @escaping () -> () = { }) {
    self.onTap = onTap
    super.init(drawing: drawing, colors: colors, frame: frame, padding: padding)
    configure()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  
  func configure() {
    let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.didTap))
    addGestureRecognizer(gesture)
  }
  
  
//  public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//    return bounds.insetBy(dx: -32.0, dy: -32.0).contains(point)
//  }

  public override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    let frame = self.bounds.insetBy(dx: -20, dy: -20)
    return frame.contains(point) ? self : nil
  }
  
  
  @objc
  func didTap() {
    onTap()
  }
  
  
//  var color: W3WColor
//  var padding: W3WPadding
//  var icon: W3WIconName
//
//  public init(icon: W3WIconName, color: W3WColor, frame: CGRect, padding: W3WPadding = .none) {
//    self.icon = icon
//    self.color = color
//    self.padding = padding
//
//    super.init(frame: frame)
//
//    setImage(W3WIcon(icon: icon, color: color, frame: frame, padding: W3WPadding(value: padding.value * 2.0)).uiImage(), for: .normal)
//
//    contentVerticalAlignment = .fill
//    contentHorizontalAlignment = .fill
//  }
//
//
//  override public init(frame: CGRect) {
//    self.icon = .search
//    self.color = .black
//    self.padding = .none
//    super.init(frame: frame)
//  }
//
//
//  required init?(coder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//
//
//  // MARK: Layout
//
//  public override func layoutSubviews() {
//    super.layoutSubviews()
//  }

  
}
