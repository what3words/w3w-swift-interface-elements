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
import W3WSwiftDesign


/// shows three slashes animtaing
@available(iOS 13.0, watchOS 6.0, *)
public struct W3WSuSlashes: View {
  
  var state = W3WSlashesState.slashes
  var color = W3WSuIconColors().slashes.current.suColor
  
  var animateToLength = 1.0
  var animate = false

  let centre      = CGFloat(0.5)
  let slashOffset = CGFloat(0.38)
  let strokeWidth = CGFloat(0.12)
  let length      = CGFloat(0.8)
  
  @State private var animation0: CGFloat = -0.3
  @State private var animation1: CGFloat = -0.3
  @State private var animation2: CGFloat = -0.3

  // animation that makes the slashes "snap" shut
  let slashAnimaiton = Animation.timingCurve(1.0, 0.5, 0.0, 1.0, duration: 0.5)
  
  
  public init(state: W3WSlashesState = .slashes, color: Color = W3WSuIconColors().slashes.current.suColor) {
    self.color = color
    
    switch state {
      case .dots:
        animate = false
        animateToLength = 0.0
      case .slashes:
        animate = false
        animateToLength = 1.0
      case .animating:
        animate = true
        animateToLength = 1.0
    }
  }
  
  func unit(_ geometry: GeometryProxy) -> CGFloat {
    return min(geometry.size.width, geometry.size.height)
  }
  
  func unitX(_ geometry: GeometryProxy) -> CGFloat {
    return geometry.size.width
  }
  
  func unitY(_ geometry: GeometryProxy) -> CGFloat {
    return geometry.size.height
  }


  public var body: some View {
    GeometryReader { g in
      ZStack {
        
        W3WSuSlash(
          center: CGPoint(x: unitX(g) * centre - unit(g) * slashOffset, y: unitY(g) * centre),
          length: unit(g) * animation0 * length,
          width: unit(g) * strokeWidth
        )
          .fill(color)
          .animation(animate ? slashAnimaiton.repeatForever() : .easeInOut(duration: 0.05), value: animation0)

        W3WSuSlash(
          center: CGPoint(x: unitX(g) * centre, y: unitY(g) * centre),
          length: unit(g) * animation1 * length,
          width: unit(g) * strokeWidth
        )
          .fill(color)
          .animation(animate ? slashAnimaiton.repeatForever() : .easeInOut(duration: 0.05), value: animation1)

        W3WSuSlash(
          center: CGPoint(x: unitX(g) * centre + unit(g) * slashOffset, y: unitY(g) * centre),
          length: unit(g) * animation2 * length,
          width: unit(g) * strokeWidth
        )
          .fill(color)
          .animation(animate ? slashAnimaiton.repeatForever() : .easeInOut(duration: 0.05), value: animation2)
      }
      .onAppear {
        if animate {
          DispatchQueue.main.asyncAfter(deadline: .now()) {
            animation0 = animateToLength
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 / 3.0) {
              animation1 = animateToLength
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 / 3.0) {
                animation2 = animateToLength
              }
            }
          }
        } else {
          animation0 = animateToLength
          animation1 = animateToLength
          animation2 = animateToLength
        }
      }
    }
  }
  
}


@available(iOS 13.0, watchOS 6.0, *)
struct W3WAnimatingSlashes_Previews: PreviewProvider {
  
  static var previews: some View {
    VStack {
      W3WSuSlashes(state: .animating, color: .gray)
    }.frame(width: 128.0, height: 128.0, alignment: .center)
  }
  
}

#endif
