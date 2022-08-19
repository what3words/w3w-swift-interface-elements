//
//  SwiftUIView.swift
//  
//
//  Created by Dave Duprey on 15/11/2021.
//

import SwiftUI
import W3WSwiftApi
import W3WSwiftDesign
import W3WSwiftInterfaceCommon


/// A view that shows an animating microphone for UI use with audio recording
@available(iOS 13.0, watchOS 6.0, *)
public struct W3WSuListen: View {
  
  /// default colour set
  let colors: W3WColorSet

  /// internal state of this component
  var state: W3WVoiceViewState = .idle
  
  /// the current recoring level to display on ascale of 0.0 -> `maxRecordingLevel`
  var recordingLevel: Double = 0.0
  
  /// the maximum `recordingLevel` to be expected, used with `recordingLevel` to calibrate the size of the halo
  var maxRecordingLevel: Double = 0.0
  
  /// closure called when the user taps this item
  var onTap: () -> () = { }
  
  /// closure called when the user taps the cancel button
  var onCancel: () -> () = { }
  
  /// A view that shows an animating microphone for UI use with audio recording
  /// - parameter state: internal state of this component
  /// - parameter recordingLevel: the current recoring level to display on ascale of 0.0 -> `maxRecordingLevel`
  /// - parameter maxRecordingLevel: the maximum `recordingLevel` to be expected, used with `recordingLevel` to calibrate the size of the halo
  /// - parameter colors: optional, default colour set
  /// - parameter onTap: optional, closure called when the user taps this item
  /// - parameter onCancel: optional, closure called when the user taps the cancel button
  public init(state: W3WVoiceViewState, recordingLevel: Double, maxRecordingLevel: Double, colors: W3WColorSet = .whiteGrayRed, onTap: @escaping () -> () = { }, onCancel: @escaping () -> () = { }) {
    self.state    = state
    self.recordingLevel = recordingLevel
    self.maxRecordingLevel = maxRecordingLevel
    self.colors   = colors
    self.onTap    = onTap
    self.onCancel = onCancel
  }

  
  public var body: some View {
    ZStack {
      
      // message at the top, depends on the state
      VStack {
        if state == .error {
          Text("Please try again")
        } else if state == .idle {
          Text("Tap to begin")
        }
        Spacer()
      }
      
      // the meat of this view
      VStack {
        Spacer()
        W3WSuMicrophoneView(state: state, recordingLevel: recordingLevel, maxRecordingLevel: maxRecordingLevel, colors: colors) {
          onTap()
        }
        Spacer()
      }
        
      // message at the bottom of the screen, depends on state
      VStack {
        Spacer()
        if state != .idle {
          Text(state != .error ? "Say a what3words address" : "Don't say a street address,")
            .font(.footnote)
            .bold()
            .foregroundColor(colors.foreground.current.suColor)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .scaledToFit()
          
          Text(state != .error ? "eg: limit broom flip" : "we only accept what3words addresses")
            .font(.footnote)
            .fontWeight(.light)
            .foregroundColor(colors.foreground.current.suColor)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .scaledToFit()
        }
      }
      
      // if the audio recording is finished and the data is already being sent, then we can't cancel
      if state != .sending {
        W3WSuCancelButton() {
          onCancel()
        }
      }
    }
  }

  
}


