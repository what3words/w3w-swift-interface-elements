//
//  File.swift
//  
//
//  Created by Dave Duprey on 17/05/2022.
//

import UIKit
import W3WSwiftDesign


public typealias W3WDrawList1 = [W3WDrawItem]


public struct W3WDrawList: Sequence, IteratorProtocol, ExpressibleByArrayLiteral {

  public typealias ArrayLiteralElement = W3WDrawItem
  
  var count: Int
  
  var list = [W3WDrawItem]()

  //public var colors: W3WColorSet = .whiteGrayRed

  
  public init(arrayLiteral elements: W3WDrawItem...) {
    self.count = 0
    self.list = elements
  }
  
  
  public init(items: [W3WDrawItem]) {
    self.count = 0
    self.list = items
  }
  

  public subscript(index: Int) -> W3WDrawItem {
    return list[index]
  }

  
  public mutating func next() -> W3WDrawItem? {
    if count >= list.count || count < 0 {
      return nil
    } else {
      defer { count += 1 }
      return list[count]
    }
  }
  
  
  static func +(left: W3WDrawList, right: W3WDrawList) -> W3WDrawList {
    var newList = left.list
    newList.append(contentsOf: right.list)
    
    return W3WDrawList(items: newList)
  }
  
}


extension W3WDrawList {
  
  public static let x: W3WDrawList = [
    .line(W3WDrawLine(start: .zero, end: CGPoint(x: 1.0, y: 1.0), color: .foreground, width: 0.05)),
    .line(W3WDrawLine(start: CGPoint(x: 0.0, y: 1.0), end: CGPoint(x: 1.0, y: 0.0), color: .foreground, width: 0.05)),
  ]

  
  public static let mic: W3WDrawList = [
    // base
    .line(W3WDrawLine(start: CGPoint(x: 0.37,  y: 0.975), end: CGPoint(x: 0.63, y: 0.975), color: .foreground, width: 0.05)),
    .line(W3WDrawLine(start: CGPoint(x: 0.50,  y: 1.00),  end: CGPoint(x: 0.50, y: 0.85),  color: .foreground, width: 0.05)),
    
    // base line ends
    .circle(W3WDrawCircle(center: CGPoint(x: 0.37,  y: 0.975), radius: 0.025, color: .foreground)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.63, y: 0.975), radius: 0.025, color: .foreground)),

    // oval handle
    .arc(W3WDrawArc(center:  CGPoint(x: 0.50,  y: 0.50), radius: 0.35, start: 0.0, end: .pi, color: .foreground, width: 0.05)),
    .line(W3WDrawLine(start: CGPoint(x: 0.15,  y: 0.45),  end: CGPoint(x: 0.15,  y: 0.50), color: .foreground, width: 0.05)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.15,  y: 0.45), radius: 0.025, color: .foreground)),
    .line(W3WDrawLine(start: CGPoint(x: 0.85,  y: 0.45),  end: CGPoint(x: 0.85,  y: 0.50), color: .foreground, width: 0.05)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.85,  y: 0.45), radius: 0.025, color: .foreground)),

    // ovel bottom
    .arc(W3WDrawArc(center:  CGPoint(x: 0.50,  y: 0.50), radius: 0.25, start: 0.0, end: .pi, color: .foreground, width: 0.05)),
    
    // oval sides
    .line(W3WDrawLine(start: CGPoint(x: 0.75, y: 0.25), end: CGPoint(x: 0.75, y: 0.5), color: .foreground, width: 0.05)),
    .line(W3WDrawLine(start: CGPoint(x: 0.25, y: 0.25), end: CGPoint(x: 0.25, y: 0.5), color: .foreground, width: 0.05)),
    
    // oval top
    .arc(W3WDrawArc(center:  CGPoint(x: 0.50,  y: 0.25 + 0.025), radius: 0.25, start: .pi, end: .pi * 2.0, color: .foreground, width: 0.05)),
  ]

  
  public static let micSlashes: W3WDrawList = [
    .line(W3WDrawLine(start: CGPoint(x: 0.54,  y: 0.275), end: CGPoint(x: 0.46, y: 0.525), color: .highlight, width: 0.05)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.54, y: 0.275), radius: 0.025, color: .highlight)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.46, y: 0.525), radius: 0.025, color: .highlight)),
    
    .line(W3WDrawLine(start: CGPoint(x: 0.54 - 0.1,  y: 0.275), end: CGPoint(x: 0.46 - 0.1, y: 0.525), color: .highlight, width: 0.05)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.54 - 0.1, y: 0.275), radius: 0.025, color: .highlight)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.46 - 0.1, y: 0.525), radius: 0.025, color: .highlight)),
    
    .line(W3WDrawLine(start: CGPoint(x: 0.54 + 0.1,  y: 0.275), end: CGPoint(x: 0.46 + 0.1, y: 0.525), color: .highlight, width: 0.05)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.54 + 0.1, y: 0.275), radius: 0.025, color: .highlight)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.46 + 0.1, y: 0.525), radius: 0.025, color: .highlight)),

  ]

  
  public static let micWithSlashes: W3WDrawList = .mic + .micSlashes

  
  public static let ocrOutline: W3WDrawList = .makeOcrOutline()
 
  
  public static func makeOcrOutline(lineWidth: CGFloat = 0.05, length: CGFloat = 0.2) -> W3WDrawList {
    return [
      .line(W3WDrawLine(start: CGPoint(x: 0.0, y: 0.0), end: CGPoint(x: length, y: 0.0), color: .foreground, width: lineWidth)),
      .line(W3WDrawLine(start: CGPoint(x: 0.0, y: 0.0), end: CGPoint(x: 0.0, y: length), color: .foreground, width: lineWidth)),
      
        .line(W3WDrawLine(start: CGPoint(x: 0.0, y: 1.0), end: CGPoint(x: 0.0, y: 1.0 - length), color: .foreground, width: lineWidth)),
      .line(W3WDrawLine(start: CGPoint(x: 0.0, y: 1.0), end: CGPoint(x: length, y: 1.0), color: .foreground, width: lineWidth)),
      
      .line(W3WDrawLine(start: CGPoint(x: 1.0, y: 1.0), end: CGPoint(x: 1.0, y: 1.0 - length), color: .foreground, width: lineWidth)),
      .line(W3WDrawLine(start: CGPoint(x: 1.0, y: 1.0), end: CGPoint(x: 1.0 - length, y: 1.0), color: .foreground, width: lineWidth)),
      
      .line(W3WDrawLine(start: CGPoint(x: 1.0, y: 0.0), end: CGPoint(x: 1.0, y: length), color: .foreground, width: lineWidth)),
      .line(W3WDrawLine(start: CGPoint(x: 1.0, y: 0.0), end: CGPoint(x: 1.0 - length, y: 0.0), color: .foreground, width: lineWidth)),
    ]
  }
  
  
  public static func makeSlashes(offset: CGFloat = 0.1, spacing: CGFloat = 0.3, width: CGFloat = 0.1, verticalInset: CGFloat = 0.2) -> W3WDrawList {
    
    let l0top     = CGPoint(x: 0.5 + offset,  y: verticalInset)
    let l0bottom  = CGPoint(x: 0.5 - offset, y: 1.0 - verticalInset)
    
    let l1top     = CGPoint(x: 0.5 + offset - spacing,  y: verticalInset)
    let l1bottom  = CGPoint(x: 0.5 - offset - spacing, y: 1.0 - verticalInset)
    
    let l2top     = CGPoint(x: 0.5 + offset + spacing,  y: verticalInset)
    let l2bottom  = CGPoint(x: 0.5 - offset + spacing, y: 1.0 - verticalInset)

    return [
      .line(W3WDrawLine(start: l0top, end: l0bottom, color: .highlight, width: width)),
      .circle(W3WDrawCircle(center: l0top,    radius: width / 2.0, color: .highlight)),
      .circle(W3WDrawCircle(center: l0bottom, radius: width / 2.0, color: .highlight)),
      
      .line(W3WDrawLine(start: l1top, end: l1bottom, color: .highlight, width: width)),
      .circle(W3WDrawCircle(center: l1top,    radius: width / 2.0, color: .highlight)),
      .circle(W3WDrawCircle(center: l1bottom, radius: width / 2.0, color: .highlight)),

      .line(W3WDrawLine(start: l2top, end: l2bottom, color: .highlight, width: width)),
      .circle(W3WDrawCircle(center: l2top,    radius: width / 2.0, color: .highlight)),
      .circle(W3WDrawCircle(center: l2bottom, radius: width / 2.0, color: .highlight)),
    ]
  }
  
  
  public static let ocr = .makeOcrOutline(lineWidth: 0.1, length: 0.25) + .makeSlashes(offset: 0.075, spacing: 0.175, width: 0.06, verticalInset: 0.28)
  
  
}
