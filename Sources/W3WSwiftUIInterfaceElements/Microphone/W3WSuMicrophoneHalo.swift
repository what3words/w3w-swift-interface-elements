//
//  MicrophoneView.swift
//  ThreeWordGo WatchKit Extension
//
//  Created by Dave Duprey on 30/03/2020.
//  Copyright © 2020 Dave Duprey. All rights reserved.
//

#if os(watchOS) || os(iOS)

import SwiftUI
import W3WSwiftApi


/// Visual Representation of the recording showing circles responding to recording levels
@available(iOS 13.0, watchOS 6.0, *)
struct W3WSuMicrophoneHalo: View {
  
  /// the microphone volume 0.0->1.0 for display uses
  let volume: Double
  
  /// colour to use
  let color: Color
  

  var body: some View {
    
    GeometryReader { geometry in
      ZStack {

        // large backgorund circle
        Circle()
          .foregroundColor(color)
          .frame(
            width: self.scaleFactor(min: self.minCircle(frame: geometry), max: self.maxCircle(frame: geometry) * 0.3333, factor: self.volume),
            height: self.scaleFactor(min: self.minCircle(frame: geometry), max: self.maxCircle(frame: geometry) * 0.3333, factor: self.volume)
          )
          .opacity(0.32)

        // medium background circle
        Circle()
          .foregroundColor(color)
          .frame(
            width: self.scaleFactor(min: self.minCircle(frame: geometry), max: self.maxCircle(frame: geometry) * 0.6666, factor: self.volume),
            height: self.scaleFactor(min: self.minCircle(frame: geometry), max: self.maxCircle(frame: geometry) * 0.6666, factor: self.volume)
          )
          .opacity(0.16)

        // smal background circle
        Circle()
          .foregroundColor(color)
          .frame(
            width: self.scaleFactor(min: self.minCircle(frame: geometry), max: self.maxCircle(frame: geometry) * 1.0, factor: self.volume),
            height: self.scaleFactor(min: self.minCircle(frame: geometry), max: self.maxCircle(frame: geometry) * 1.0, factor: self.volume)
          )
          .opacity(0.08)
      }
      .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
      .animation(.linear(duration: 0.15))
    }
  }

  
  
  func minCircle(frame: GeometryProxy) -> CGFloat {
    var diameter = W3WSuMicrophoneSettings.micCircle
    
    //min(frame.size.width, frame.size.height)
    if diameter > min(frame.size.width, frame.size.height) * 0.5 {
      diameter = min(frame.size.width, frame.size.height) * 0.5
    }

    return diameter
  }
  
  
  func maxCircle(frame: GeometryProxy) -> CGFloat {
    return min(frame.size.width, frame.size.height) * 2.0
  }
  

  /// calculates a 0 -> 1 visual scale factor given the min and max volume levels
  /// - Parameters:
  ///     - min: the minimal size
  ///     - max: the maximum size
  ///     - factor: the current amplitude
  func scaleFactor(min:CGFloat, max:CGFloat, factor:Double) -> CGFloat {
    var f = CGFloat(factor) // / 2.0)

    if (f > 0.5) {
      f = 0.5
    }
    if (f < 0.0) {
      f = 0.0
    }

    let x = f == 0.0 ? 0.0 : (max - min) * CGFloat(f) + min
    
    return x
  }
}

#endif
