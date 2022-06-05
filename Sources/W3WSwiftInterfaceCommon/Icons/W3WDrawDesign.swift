//
//  File.swift
//  
//
//  Created by Dave Duprey on 12/05/2022.
//

import UIKit
import W3WSwiftDesign




public protocol W3WDrawElement {
}


public struct W3WDrawLine: W3WDrawElement {
  public let start: CGPoint
  public let end: CGPoint
  public let color: W3WColorSetNames
  public let width: CGFloat
}


public struct W3WDrawCircle: W3WDrawElement {
  public let center: CGPoint
  public let radius: CGFloat
  public let color: W3WColorSetNames
}


public struct W3WDrawArc: W3WDrawElement {
  public let center: CGPoint
  public let radius: CGFloat
  public let start:  CGFloat
  public let end:    CGFloat
  public let color: W3WColorSetNames
  public let width: CGFloat
}


//public struct W3WSubDrawList: W3WDrawElement {
//  public let drawlist: W3WDrawList
//  public let bounds: CGRect
//}


public enum W3WDrawItem {
  case line(W3WDrawLine)
  case circle(W3WDrawCircle)
  case arc(W3WDrawArc)
//  case drawlist(W3WSubDrawList)
}

