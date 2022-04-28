//
//  ContentView.swift
//  Buttons
//
//  Created by Dave Duprey on 27/04/2022.
//

import SwiftUI
import W3WSwiftApi
import W3WSwiftUIInterfaceElements


struct ContentView: View {
  
  let api = What3WordsV3(apiKey: "YourApiKey")
  
  var body: some View {
    ScrollView {
      
      // Show some three word addresses vertically
      VStack(spacing: 24.0) {
        HStack {
          W3WSuVerticalWords(words: "filled.count.soap")
            .frame(width: 70.0, height: 64.0)
            .background(.black)
          
          W3WSuVerticalWords(words: "filled.count.soap", w3w: api)
            .frame(width: 148.0, height: 70.0)
            .background(.black)
        }

        // Show some slashes: animating, dots, and still
        HStack {
          W3WSuSlashes(state: .animating)
            .frame(width: 32.0, height: 32.0, alignment: .top)
            .border(Color.gray)

          W3WSuSlashes(state: .animating)
            .frame(width: 32.0, height: 64.0, alignment: .top)
            .border(Color.gray)

          W3WSuSlashes(state: .slashes)
            .frame(width: 12.0, height: 32.0, alignment: .top)
            .border(Color.gray)
          
          W3WSuSlashes(state: .slashes)
            .frame(width: 128.0, height: 32.0, alignment: .top)
            .border(Color.gray)
          
          W3WSuSlashes(state: .dots)
            .frame(width: 32.0, height: 32.0, alignment: .top)
            .border(Color.gray)
        }
        
        // show some mic icons at different sizes
        HStack {
          W3WSuMicIcon(animate: .animating)
            .frame(width: 16.0, height: 64.0)
            .background(.black)
            .border(Color.gray)

          W3WSuMicIcon(animate: .animating)
            .frame(width: 164.0, height: 64.0)
            .background(.black)
            .border(Color.gray)

          W3WSuMicIcon(animate: .animating)
            .frame(width: 64.0, height: 64.0)
            .background(.black)
            .border(Color.gray)
        }
        
        // show some mic buttons
        HStack {
          W3WSuMicrophoneButtonRound() {
            print("TAP")
          }
          .frame(width: 100.0, height: 32.0)
          .border(Color.gray)
          
          W3WSuMicrophoneButtonRound() {
            print("TAP")
          }
          .frame(width: 64.0, height: 64.0)
          .border(Color.gray)
          
          W3WSuMicrophoneButtonRound() {
            print("TAP")
          }
          .frame(width: 16.0, height: 64.0)
          .border(Color.gray)

        }
        
        // show some micorphone views
        VStack {
          HStack {
            Spacer()
            W3WSuMicrophoneView(state: .idle, recordingLevel: 0.0, maxRecordingLevel: 1.0)
              .frame(width: 132.0, height: 64.0)
              .border(Color.gray)
            Spacer()
            W3WSuMicrophoneView(state: .listening, recordingLevel: 0.25, maxRecordingLevel: 1.0)
              .frame(width: 132.0, height: 64.0)
              .border(Color.gray)
            Spacer()
          }
          
          HStack {
            Spacer()
            W3WSuMicrophoneView(state: .error, recordingLevel: 0.0, maxRecordingLevel: 1.0)
              .frame(width: 132.0, height: 64.0)
              .border(Color.gray)
            Spacer()
            W3WSuMicrophoneView(state: .sending, recordingLevel: 1.0, maxRecordingLevel: 1.0)
              .frame(width: 132.0, height: 64.0)
              .border(Color.gray)
            Spacer()
          }
        }

      }
    }
    .background(.black)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
