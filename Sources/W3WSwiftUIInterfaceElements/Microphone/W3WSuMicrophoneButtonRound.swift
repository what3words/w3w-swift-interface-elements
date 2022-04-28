//
//  SwiftUIView.swift
//  
//
//  Created by Dave Duprey on 18/11/2021.
//

import SwiftUI
import W3WSwiftApi



@available(iOS 13.0, watchOS 6.0, *)
public struct W3WSuMicrophoneButtonRound: View {

  let colors: W3WSuMicrophoneColors
  var onTap: () -> () = { }

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
        W3WSuMicIcon(animate: .slashes, lineColor: colors.text.current.suColor, fillColor: .clear, slashesColor: colors.text.current.suColor)
          .frame(width: min(g.size.width, g.size.height) / 2.0, height: min(g.size.width, g.size.height) / 2.0, alignment: .center)
          .offset(x: g.size.width / 2.0 - min(g.size.width, g.size.height) / 2.0, y: g.size.height / 2.0 - min(g.size.width, g.size.height) / 2.0)
      }
      .onTapGesture {
        onTap()
      }
    }
  }

    
    
//    GeometryReader { g in
//    W3WSuMicIcon(animate: .slashes, lineColor: colors.text.current.suColor, fillColor: .clear, slashesColor: colors.text.current.suColor)
//      .frame(width: 24.0, height: 24.0, alignment: .center)
////      .frame(width: min(g.size.width, g.size.height) * 0.375, height: min(g.size.width, g.size.height) * 0.375, alignment: .center)
//      .padding()
//      .background(Circle().foregroundColor(colors.buttonBackground.current.suColor))
//      .onTapGesture {
//        onTap()
//      }
//    }
//  }
}

//struct W3WMicrophoneButtonRoundSwiftUI_Previews: PreviewProvider {
//    static var previews: some View {
//      W3WMicrophoneButtonRoundSwiftUI()
//    }
//}
