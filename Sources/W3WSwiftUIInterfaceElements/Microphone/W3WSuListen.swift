//
//  SwiftUIView.swift
//  
//
//  Created by Dave Duprey on 15/11/2021.
//

import SwiftUI
import W3WSwiftApi
//import AddressValidation


@available(iOS 13.0, watchOS 6.0, *)
public struct W3WSuListen: View {
  
  let colors: W3WSuMicrophoneColors

  var state: W3WMicrophoneSwiftUIState = .idle
  var recordingLevel: Double = 0.0
  var maxRecordingLevel: Double = 0.0
  
  var onTap: () -> () = { }
  var onCancel: () -> () = { }
  
  public init(state: W3WMicrophoneSwiftUIState, recordingLevel: Double, maxRecordingLevel: Double, colors: W3WSuMicrophoneColors = W3WSuMicrophoneColors(), onTap: @escaping () -> () = { }, onCancel: @escaping () -> () = { }) {
    //self.model    = model
    self.state    = state
    self.recordingLevel = recordingLevel
    self.maxRecordingLevel = maxRecordingLevel
    self.colors   = colors
    self.onTap    = onTap
    self.onCancel = onCancel
  }

  
  public var body: some View {
    ZStack {
      VStack {
        if state == .error {
          Text("Please try again")
        } else if state == .idle {
          Text("Tap to begin")
        }
        Spacer()
      }
      
      VStack {
        Spacer()
        W3WSuMicrophoneView(state: state, recordingLevel: recordingLevel, maxRecordingLevel: maxRecordingLevel, colours: colors) {
          onTap()
        }
        Spacer()
      }
        
      VStack {
        Spacer()
        if state != .idle {
          Text(state != .error ? "Say a what3words address" : "Don't say a street address,")
            .font(.footnote)
            .bold()
            .foregroundColor(colors.text.current.suColor)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .scaledToFit()
          
          Text(state != .error ? "eg: limit broom flip" : "we only accept what3words addresses")
            .font(.footnote)
            .fontWeight(.light)
            .foregroundColor(colors.text.current.suColor)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .scaledToFit()
        }
      }
      
      if state != .sending {
        W3WSuCancelButton() {
          onCancel()
        }
      }
    }
  }

  
//  /// figure out the state for the mic given the state of the model
//  /// - Parameters:
//  ///     - volume: the current amplitude
//  func micStateFromModelState(state: W3WAddressModelState) -> W3WMicrophoneSwiftUIState {
//    return .idle
//    if state == .communicating {
//      return .sending
//    } else if state == .error {
//      return .error
//    } else if state == .listening {
//      if model.isRecording() {
//        return .listening
//      } else {
//        return .idle
//      }
//    } else {
//      return .error
//    }
//  }

}



//struct W3WListenSwiftUI_Previews: PreviewProvider {
//    static var previews: some View {
//      W3WListenSwiftUI()
//    }
//}
