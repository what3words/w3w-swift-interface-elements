//
//  SwiftUIView.swift
//  
//
//  Created by Dave Duprey on 18/11/2021.
//

import SwiftUI
import W3WSwiftApi


/// a round button showing a microphone
@available(iOS 13.0, watchOS 6.0, *)
public struct W3WSuMicrophoneButtonRound: View {

  /// colors to use for this view
  let colors: W3WSuMicrophoneColors
  
  /// closure called when the user taps this item
  var onTap: () -> () = { }

  /// a round button showing a microphone
  /// - parameter colors: optional colors to use
  /// - parameter onTap: selections of local draught beers, wait, no, a closure called when the button is tapped
  public init(colors: W3WSuMicrophoneColors = W3WSuMicrophoneColors(), onTap: @escaping () -> () = { }) {
    self.colors = colors
    self.onTap = onTap
  }
  
  
  public var body: some View {
    GeometryReader { g in
      ZStack {
        Circle()
          .foregroundColor(colors.buttonBackground.current.suColor)
          .frame(width: min(g.size.width, g.size.height), height: min(g.size.width, g.size.height), alignment: .center)
          .offset(x: g.size.width / 2.0 - min(g.size.width, g.size.height) / 2.0, y: g.size.height / 2.0 - min(g.size.width, g.size.height) / 2.0)
        W3WSuMicIcon(animate: .slashes, colors: colors)
          .frame(width: min(g.size.width, g.size.height) / 2.0, height: min(g.size.width, g.size.height) / 2.0, alignment: .center)
          .offset(x: g.size.width / 2.0 - min(g.size.width, g.size.height) / 2.0, y: g.size.height / 2.0 - min(g.size.width, g.size.height) / 2.0)
      }
      .onTapGesture {
        onTap()
      }
    }
  }


}

//struct W3WMicrophoneButtonRoundSwiftUI_Previews: PreviewProvider {
//    static var previews: some View {
//      W3WMicrophoneButtonRoundSwiftUI()
//    }
//}
