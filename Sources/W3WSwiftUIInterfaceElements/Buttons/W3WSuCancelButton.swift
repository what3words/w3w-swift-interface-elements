//
//  CancelButton.swift
//  AddressValidation
//
//  Created by Dave Duprey on 07/03/2022.
//

import SwiftUI


/// a button composed of a simple X with an onTap() closure
/// - parameter colors: optional, provides defult colours to button objects
/// - parameter onTap: closure to call when button tapped
@available(iOS 13.0, watchOS 6.0, *)
struct W3WSuCancelButton: View {
  
  /// optional, provides defult colours to button objects
  var colors: W3WSuButtonColors = W3WSuButtonColors()
  
  /// closure to call when button tapped
  var onTap: () -> ()
  
  var body: some View {
    HStack {
      VStack {
        
        // the key part - the 'X'
        Image(systemName: "xmark").foregroundColor(colors.xMarkColor.current.suColor)
        Spacer()
        
      }.padding(.top, 12.0)
      Spacer()
      
    }.padding(.leading, 12.0)
      .edgesIgnoringSafeArea(.all)
      .onTapGesture {
        // call the closure on tap
        self.onTap()
      }
      .navigationBarHidden(true)
  }
}

