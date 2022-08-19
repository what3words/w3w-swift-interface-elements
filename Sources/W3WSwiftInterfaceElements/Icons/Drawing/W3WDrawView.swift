//
//  File.swift
//  
//
//  Created by Dave Duprey on 17/05/2022.
//

import UIKit
import W3WSwiftDesign
import W3WSwiftInterfaceCommon
//import W3WSwiftComponents


/// Takes a W3WDrawList and renders it into this UIView
public class W3WDrawView: UIView {

  /// instructions on how to draw the thing
  var drawing: W3WDrawList
  var colors: W3WColorSet
  
  
  // MARK: Init
  
  public convenience init() {
    self.init(frame: CGRect(x: 0.0, y: 0.0, width: 32.0, height: 32.0))
  }
  
  
  public init(drawing: W3WDrawList, colors: W3WColorSet = .blackGrayRed, frame: CGRect) {
    self.drawing = drawing
    self.colors = colors
    super.init(frame: frame)
    instantiateUIElements()
  }
  
  
  public override init(frame: CGRect) {
    self.drawing = W3WDrawList.x
    self.colors = .blackGrayRed
    super.init(frame: frame)
    instantiateUIElements()
  }
  
  
  public required init?(coder: NSCoder) {
    self.drawing = W3WDrawList.x
    self.colors = .blackGrayRed
    super.init(coder: coder)
    instantiateUIElements()
  }
  
  
  /// set up all the UI stuff, called from the init() functions
  public func instantiateUIElements() {
    backgroundColor = .clear
  }
  

  // MARK: Acessors
  
  
  public func set(drawing: W3WDrawList) {
    self.drawing = drawing
  }
  
  
  func scale(point: CGPoint, rect: CGRect) -> CGPoint {
    let f = min(rect.width, rect.height)
    let xOffset = (rect.width  - f) / 2.0
    let yOffset = (rect.height - f) / 2.0
    return CGPoint(x: point.x * f + xOffset, y: point.y * f + yOffset)
  }
  
  
  func scale(float: CGFloat, rect: CGRect) -> CGFloat {
    let f = min(rect.width, rect.height)
    return float * f
  }
  
  
  func draw(_ line: W3WDrawLine, rect: CGRect) {
    let path = UIBezierPath()

    path.move(to: scale(point: line.start, rect: rect))
    path.addLine(to: scale(point: line.end, rect: rect))

    colors[line.color].current.uiColor.setStroke()
    path.lineWidth = scale(float: line.width, rect: rect)
    path.stroke()
    path.close()
  }
  
  
  func draw(_ circle: W3WDrawCircle, rect: CGRect) {
    let path = UIBezierPath(arcCenter: scale(point: circle.center, rect: rect), radius: scale(float: circle.radius, rect: rect), startAngle: 0.0, endAngle: 2.0 * CGFloat.pi, clockwise: true)
    
    colors[circle.color].current.uiColor.setFill()
    path.fill()
    path.close()
  }
  
  
  func draw(_ arc: W3WDrawArc, rect: CGRect) {
    let path = UIBezierPath(arcCenter: scale(point: arc.center, rect: rect), radius: scale(float: arc.radius, rect: rect), startAngle: arc.start, endAngle: arc.end, clockwise: true)

    colors[arc.color].current.uiColor.setStroke()
    path.lineWidth = scale(float: arc.width, rect: rect)
    path.stroke()
    path.close()
  }

  
  /// iOS UIView draw function
  open override func draw(_ rect: CGRect) {
    for i in drawing {
      switch i {
      case .line(let line):
        draw(line, rect: rect)
      case .circle(let circle):
        draw(circle, rect: rect)
      case .arc(let arc):
        draw(arc, rect: rect)
      }
    }
  }

  
}

