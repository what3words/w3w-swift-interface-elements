//
//  ActivityIndicator.swift
//  w3w-watchos WatchKit Extension
//
//  Created by Dave Duprey on 20/01/2020.
//  Copyright © 2020 Dave Duprey. All rights reserved.
//

#if os(watchOS) || os(iOS)

import SwiftUI
import W3WSwiftApi

/// shows a single what3words style slash, usually shown with two others next to it - ///
@available(iOS 13.0, watchOS 6.0, *)
struct W3WSuSlash: Shape {
  var center: CGPoint
  var length: CGFloat
  var width: CGFloat
  var angle: CGFloat = 0.3
  
  var animatableData: CGFloat {
    get { return length }
    set {
      length = newValue
    }
  }
  
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    
    let translation = CGAffineTransform(translationX: center.x, y: center.y)
    let rotation    = CGAffineTransform(rotationAngle: angle)
    
    let lengthAdjusted = max(0.0, length)
    
    let topY    =  lengthAdjusted / 2.0
    let bottomY = -lengthAdjusted / 2.0
    let leftX   = -width / 2.0
    let rightX  =  width / 2.0
    
    path.move(to:     CGPoint(x: leftX, y: topY))
    path.addArc(center: CGPoint(x: 0.0, y: topY), radius: width / 2.0, startAngle: .radians(.pi), endAngle: .radians(0.0), clockwise: true)
    path.addLine(to:  CGPoint(x: rightX, y: bottomY))
    path.addLine(to:  CGPoint(x: leftX,  y: bottomY))
    path.addArc(center: CGPoint(x: 0.0, y: bottomY), radius: width / 2.0, startAngle: .radians(0.0), endAngle: .radians(.pi), clockwise: true)
    
    return path.applying(rotation).applying(translation)
  }
}


#endif
