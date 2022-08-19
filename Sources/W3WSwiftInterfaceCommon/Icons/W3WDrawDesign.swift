//
//  File.swift
//  
//
//  Created by Dave Duprey on 12/05/2022.
//

import UIKit
import W3WSwiftDesign



/// Base protocol for a piece of a drawing
public protocol W3WDrawElement {
}


/// A line
public struct W3WDrawLine: W3WDrawElement {
  public let start: CGPoint
  public let end: CGPoint
  public let color: W3WColorSetNames
  public let width: CGFloat
}


/// A circle
public struct W3WDrawCircle: W3WDrawElement {
  public let center: CGPoint
  public let radius: CGFloat
  public let color: W3WColorSetNames
}


/// An arc
public struct W3WDrawArc: W3WDrawElement {
  public let center: CGPoint
  public let radius: CGFloat
  public let start:  CGFloat
  public let end:    CGFloat
  public let color: W3WColorSetNames
  public let width: CGFloat
}


/// A datum that holds either a line, circle or arc
public enum W3WDrawItem {
  case line(W3WDrawLine)
  case circle(W3WDrawCircle)
  case arc(W3WDrawArc)
}

