//
//  CancelButton.swift
//  AddressValidation
//
//  Created by Dave Duprey on 07/03/2022.
//

import SwiftUI


@available(iOS 13.0, watchOS 6.0, *)
struct W3WSuCancelButton: View {
  
  var onTap: () -> ()
  
  var body: some View {
    HStack {
      VStack {
        Image(systemName: "xmark").foregroundColor(Color.gray.opacity(0.8))
        Spacer()
      }.padding(.top, 12.0)
      Spacer()
    }.padding(.leading, 12.0)
      .edgesIgnoringSafeArea(.all)
      .onTapGesture {
        self.onTap()
      }
      .navigationBarHidden(true)
  }
}

