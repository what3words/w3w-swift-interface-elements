//
//  SwiftUIView.swift
//  
//
//  Created by Dave Duprey on 18/11/2021.
//

import SwiftUI
import W3WSwiftApi
import W3WSwiftDesign


/// a round button showing a microphone
@available(iOS 13.0, watchOS 6.0, *)
public struct W3WSuMicrophoneButtonRound: View {

  /// colors to use for this view
  let colors: W3WColorSet
  
  /// closure called when the user taps this item
  var onTap: () -> () = { }

  /// a round button showing a microphone
  /// - parameter colors: optional colors to use
  /// - parameter onTap: selections of local draught beers, wait, no, a closure called when the button is tapped
  public init(colors: W3WColorSet = .whiteGrayRed, onTap: @escaping () -> () = { }) {
    self.colors = colors
    self.onTap = onTap
  }
  
  
  public var body: some View {
    GeometryReader { g in
      ZStack {
        Circle()
          .foregroundColor(colors.background.current.suColor)
          .frame(width: min(g.size.width, g.size.height), height: min(g.size.width, g.size.height), alignment: .center)
          .offset(x: g.size.width / 2.0 - min(g.size.width, g.size.height) / 2.0, y: g.size.height / 2.0 - min(g.size.width, g.size.height) / 2.0)
        W3WSuMicIcon(animate: .slashes, colors: W3WColorSet(foreground: colors.foreground, background: .clear, highlight: colors.foreground, secondary: .clear))
                     //(slashes: colors.microhoneButton.foreground, primaryTextColor: colors.microhoneButton.foreground.current.suColor, secondaryTextColor: colors.microhoneButton.foreground.current.suColor, highlightColor: colors.microhoneButton.foreground.current.suColor))
          .frame(width: min(g.size.width, g.size.height) / 2.0, height: min(g.size.width, g.size.height) / 2.0, alignment: .center)
          .offset(x: g.size.width / 2.0 - min(g.size.width, g.size.height) / 2.0, y: g.size.height / 2.0 - min(g.size.width, g.size.height) / 2.0)
      }
      .onTapGesture {
        onTap()
      }
    }
  }


}

