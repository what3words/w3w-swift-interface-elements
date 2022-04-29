//
//  ListeningView.swift
//  ThreeWordGo WatchKit Extension
//
//  Created by Dave Duprey on 15/04/2020.
//  Copyright © 2020 Dave Duprey. All rights reserved.
//

import SwiftUI
import W3WSwiftApi


public enum W3WMicrophoneSwiftUIState {
  case listening
  case sending
  case error
  case idle
}


/// Shows the microphone and icons and text depending on if we are listening to a pick-up address or a drop-off address
@available(iOS 13.0, watchOS 6.0, *)
public struct W3WSuMicrophoneView: View {
  
  /// the current recoring level to display on ascale of 0.0 -> `maxRecordingLevel`
  var recordingLevel: Double

  /// the maximum `recordingLevel` to be expected, used with `recordingLevel` to calibrate the size of the halo
  var maxRecordingLevel: Double

  /// the animation state for the slashes in the icon
  var slashesState: W3WSlashesState

  /// colour for the halo
  var haloColor: Color

  /// default colour set
  var colours: W3WSuMicrophoneColors

  /// closure called when the user taps this item
  var onTap: () -> () = { }
  
  var state = W3WMicrophoneSwiftUIState.idle


  /// Shows the microphone and icons and text depending on if we are listening to a pick-up address or a drop-off address
  /// - paramter state: the animation state for the slashes in the icon
  /// - paramter recordingLevel: the current recoring level to display on ascale of 0.0 -> `maxRecordingLevel`
  /// - paramter maxrecordingLevel: the maximum `recordingLevel` to be expected, used with `recordingLevel` to calibrate the size of the halo
  /// - paramter colors: optional, colours to use
  /// - paramter onTap: optional, closure called when the user taps this item
  public init(state: W3WMicrophoneSwiftUIState, recordingLevel: Double, maxRecordingLevel: Double, colors: W3WSuMicrophoneColors = W3WSuMicrophoneColors(), onTap: @escaping () -> () = { } ) {
    self.colours            = colors
    self.state              = state
    self.recordingLevel     = recordingLevel
    self.maxRecordingLevel  = maxRecordingLevel
    self.slashesState       = state == .sending ? .animating : .slashes
    self.haloColor          = colors.micHalo.current.suColor
    self.onTap             = onTap
  }
  

  /// figure out the color for the mic lines given the state of the model
  /// - Parameters:
  ///     - volume: the current amplitude
  func lineColourFromState(state: W3WMicrophoneSwiftUIState) -> Color {
    if state == .error || state == .idle {
      return colours.micOff.current.suColor
    } else {
      return colours.micOn.current.suColor
    }
  }
  
  
  /// figure out the color for the mic fill given the state of the model
  /// - Parameters:
  ///     - volume: the current amplitude
  func fillColourFromState(state: W3WMicrophoneSwiftUIState) -> Color {
    if state == .sending {
      return .clear
    } else {
      return colours.micOn.current.suColor
    }
  }
  
  
  /// figure out the color for the w3w slashes given the state of the model
  /// - Parameters:
  ///     - volume: the current amplitude
  func slashesColourFromState(state: W3WMicrophoneSwiftUIState) -> Color {
    if state == .sending {
      return colours.slashes.current.suColor
    } else {
      return colours.micOff.current.suColor
    }
  }
  
  
  
  public var body: some View {
    
    #if os(watchOS)
    GeometryReader { geometry in
      ZStack {

        if state == .error || state == .idle {
          Circle()
            .fill(colours.micOn.current.suColor)
            .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.3, alignment: .center)
            .offset(x: 0.0, y: min(geometry.size.height, geometry.size.width) * -0.01)

        } else {
          W3WSuMicrophoneHalo(volume: self.normalizeVolume(volume: recordingLevel, maxVolume: maxRecordingLevel), color: haloColor)
            .frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
            .offset(x: 0.0, y: min(geometry.size.height, geometry.size.width) * -0.01)
        }
        
        W3WSuMicIcon(animate: slashesState, colors: colours) //(animate: slashesState, lineColor: lineColourFromState(state: state), fillColor: fillColourFromState(state: state), slashesColor: slashesColourFromState(state: state))
          .frame(width: geometry.size.width * 0.18, height: geometry.size.width * 0.18, alignment: .center)
        
      }
      .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
      .gesture(TapGesture().onEnded { _ in
        onTap()
      })
    }
    
    #else

    VStack {
      ZStack {
        W3WSuMicrophoneHalo(volume: self.normalizeVolume(volume: recordingLevel, maxVolume: maxRecordingLevel), color: haloColor)
          .frame(width: 128.0, height: 128.0, alignment: .center)

        W3WSuMicIcon(animate: slashesState, colors: colours)
          .frame(width: 28.0, height: 28.0, alignment: .center)
      }
      .frame(width: 150.0, height: 150.0, alignment: .center)
      .gesture(TapGesture().onEnded { _ in
        onTap()
      })
      Spacer()
    }

    #endif

  }
  
    
  /// calculate a continuous stream of numbers from ~0.0 to ~1.0 to use to animate the microphone
  /// - Parameters:
  ///     - volume: the current amplitude
  ///     - maxVolume: the maximum amplitude
  func normalizeVolume(volume:Double, maxVolume:Double) -> Double {
    
    // protect against divide by zero
    if (maxVolume == 0) {
      return 0.0
      
      // make the normalized volume a percent of the actual volume devided by the maximum recorded value, unless the max value is small
    } else {
      var normalizedLevel = volume / maxVolume
      
      if (maxVolume < W3WSuMicrophoneSettings.smallestMaxVolume) {
        normalizedLevel = volume
      }
      
      // print(normalizedLevel, volume, maxVolume)
      
      return normalizedLevel
    }
  }
  
  
}

@available(iOS 13.0, watchOS 6.0, *)
struct W3WMicrophoneSuiView_Previews: PreviewProvider {
    static var previews: some View {
      W3WSuMicrophoneView(state: .sending, recordingLevel: 0.3, maxRecordingLevel: 1.0)
    }
}
