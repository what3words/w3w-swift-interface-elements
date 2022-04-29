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


/// shows a spinning set of red slashes to pacify the user
@available(iOS 13.0, watchOS 6.0, *)
public struct W3WSuMicIcon: View {
    
  var animate       = W3WSlashesState.slashes
  var lineColor     = W3WSuMicrophoneColors().micOn.current.suColor
  var fillColor     = Color.clear
  var slashesColor  = W3WSuMicrophoneColors().slashes.current.suColor
  
  let micRadius     = CGFloat(0.25)
  let baseWidth     = CGFloat(0.25)
  let centre        = CGFloat(0.5)
  let cupRim        = CGFloat(0.075)
  let stemHeight    = CGFloat(0.15)
  let slashesWidth  = CGFloat(0.3)
  let ovalWidth     = CGFloat(0.35)
  let ovalUpper     = CGFloat(0.25)
  let ovalLower     = CGFloat(0.5)
  let strokeWidth   = CGFloat(0.05)
  
  
  /// shows a spinning set of red slashes to pacify the user
  /// - parameter animate: the type of animation to show
  /// - parameter colors: optional, the colours to use, defaults to w3w colours
  public init(animate: W3WSlashesState, colors: W3WSuMicrophoneColors? = nil) {
    self.animate   = animate
    self.lineColor = colors?.micOn.current.suColor ?? W3WSuMicrophoneColors().micOn.current.suColor
    self.fillColor = Color.clear
    self.slashesColor = colors?.slashes.current.suColor ?? W3WSuMicrophoneColors().slashes.current.suColor
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
        
        // the cup that holds the mic
        Path { path in path = drawCup(geometry: g, path: path) }
          .stroke(lineColor, lineWidth: unit(g) * strokeWidth)

        // the oval that makes the mic
        Path { path in path = drawMic(unit: unit(g), path: path) }
          .fill(fillColor)
          .offset(x: (g.size.width - unit(g)) / 2.0, y: (g.size.height - unit(g)) / 2.0)

        // the oval that makes the mic
        Path { path in path = drawMic(unit: unit(g), path: path) }
          .stroke(lineColor, lineWidth: unit(g) * strokeWidth)
          .offset(x: (g.size.width - unit(g)) / 2.0, y: (g.size.height - unit(g)) / 2.0)

        // circular ends on lines
        Path { path in path = drawLineEnds(geometry: g, path: path) }
          .fill(lineColor)

        // the three slashes
        if animate == .animating {
          W3WSuSlashes(state: .animating, color: slashesColor)
            .frame(width: unit(g) * slashesWidth, height: unit(g) * slashesWidth, alignment: .center)
            .offset(x: 0.0, y: -unit(g) * micRadius / 2.0)
        } else if animate == .slashes {
          W3WSuSlashes(state: .slashes, color: slashesColor)
            .frame(width: unit(g) * slashesWidth, height: unit(g) * slashesWidth, alignment: .center)
            .offset(x: 0.0, y: -unit(g) * micRadius / 2.0)
        } else if animate == .dots {
          W3WSuSlashes(state: .dots, color: slashesColor)
            .frame(width: unit(g) * slashesWidth, height: unit(g) * slashesWidth, alignment: .center)
            .offset(x: 0.0, y: -unit(g) * micRadius / 2.0)
        }
      }
    }
  }
  
  
  /// the cup that holds the mic
  func drawCup(geometry g: GeometryProxy, path: Path) -> Path {
    var p = path
    
    let unit = unit(g)

    // base line
    p.move(to: CGPoint(x: unitX(g) * centre - (unit * baseWidth / 2.0), y: unitY(g) * centre + unit / 2.0))
    p.addLine(to: CGPoint(x: unitX(g) * centre + (unit * baseWidth / 2.0), y: unitY(g) * centre + unit / 2.0))
    
    // stem line
    p.move(to: CGPoint(x: unitX(g) * centre, y: unitY(g) * centre + unit / 2.0))
    p.addLine(to: CGPoint(x: unitX(g) * centre, y: (unitY(g) * centre + unit / 2.0 - unit * stemHeight)))
    
    // cup
    p.move(to: CGPoint(x: unitX(g) * centre + unit * ovalWidth, y: unitY(g) * centre - unit * cupRim))
    p.addLine(to: CGPoint(x: unitX(g) * centre + unit * ovalWidth, y: unitY(g) * ovalLower))
    p.addArc(
      center: CGPoint(x: unitX(g) * centre, y: unitY(g) * ovalLower),
      radius: unit * ovalWidth,
      startAngle: .radians(0.0),
      endAngle: .radians(.pi),
      clockwise: false)
    p.addLine(to: CGPoint(x: unitX(g) * centre - unit * ovalWidth, y: unitY(g) * centre - unit * cupRim))

    return p
  }
  
  
  /// circular ends on lines
  func drawLineEnds(geometry g: GeometryProxy, path: Path) -> Path {
    var p = path

    let unit = unit(g)

    // basline ends
    p.move(to: CGPoint(x: unitX(g) * centre - (unit * baseWidth / 2.0), y: unitY(g) * centre + unit / 2.0))
    p.addArc(center: CGPoint(x: unitX(g) * centre - (unit * baseWidth / 2.0), y: unitY(g) * centre + unit / 2.0), radius: unit * strokeWidth / 2.0, startAngle: .radians(0.0), endAngle: .radians(2.0 * .pi), clockwise: false)
    p.addArc(center: CGPoint(x: unitX(g) * centre + (unit * baseWidth / 2.0), y: unitY(g) * centre + unit / 2.0), radius: unit * strokeWidth / 2.0, startAngle: .radians(0.0), endAngle: .radians(2.0 * .pi), clockwise: false)
    
    // mic stand ends
    p.move(to: CGPoint(x: unitX(g) * centre + unit * ovalWidth, y: unitY(g) * centre - unit * cupRim))
    p.addArc(center: CGPoint(x: unitX(g) * centre + unit * ovalWidth, y: unitY(g) * centre - unit * cupRim), radius: unit * strokeWidth / 2.0, startAngle: .radians(0.0), endAngle: .radians(2.0 * .pi), clockwise: false)
    p.move(to: CGPoint(x: unitX(g) * centre - unit * ovalWidth, y: unitY(g) * centre - unit * cupRim))
    p.addArc(center: CGPoint(x: unitX(g) * centre - unit * ovalWidth, y: unitY(g) * centre - unit * cupRim), radius: unit * strokeWidth / 2.0, startAngle: .radians(0.0), endAngle: .radians(2.0 * .pi), clockwise: false)

    return p
  }
  
  
  /// the oval that makes the mic
  func drawMic(unit: CGFloat, path: Path) -> Path {
    var p = path
    
    // mic bottom arc
    p.move(to: CGPoint(x: unit * (centre + micRadius), y: unit * ovalLower))
    p.addArc(
      center: CGPoint(x: unit * ovalLower, y: unit * ovalLower),
      radius: unit * micRadius,
      startAngle: .radians(0.0),
      endAngle: .radians(.pi),
      clockwise: false)
    
    // mic left line
    p.addLine(to: CGPoint(x: unit * (centre - micRadius), y: unit * ovalUpper))
    
    // mic top arc
    p.addArc(
      center: CGPoint(x: unit * centre, y: unit * ovalUpper),
      radius: unit * micRadius,
      startAngle: .radians(.pi),
      endAngle: .radians(0.0),
      clockwise: false)
    
    // mic right line
    p.addLine(to: CGPoint(x: unit * (centre + micRadius), y: unit * ovalLower))
    
    return p
  }
  
  
}


@available(iOS 13.0, watchOS 6.0, *)
struct W3WMicIconSwiftUI_Previews: PreviewProvider {

  static var previews: some View {
    VStack {
      W3WSuMicIcon(animate: .animating)
    }.frame(width: 128.0, height: 128.0, alignment: .center)
  }

}

#endif
