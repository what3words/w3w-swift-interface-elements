//
//  SwiftUIView.swift
//  
//
//  Created by Dave Duprey on 11/01/2022.
//

import SwiftUI
import W3WSwiftApi
import W3WSwiftDesign


/// shows the three words on top of each other, used in tight spaces, like on watchOS screens
/// if the API, or SDK is provided, it can automatically show the nearest place
@available(iOS 13.0, watchOS 6.0, *)
public struct W3WSuVerticalWords: View {

  /// the three word address
  var words: String
  
  /// optional: if provided, this view will lookup and show the nearest place
  let w3w: W3WProtocolV3?
  
  /// optional: cnearest place to show
  var nearestPlace: String?
  
  /// optional: colours to use, defaults are provided if missing
  var colors: W3WColorSet
  
  @State var nearestPlaceLookup: String? = nil

  /// shows the three words on top of each other, used in tight spaces, like on watchOS screens
  /// - parameter words: the three word address
  /// - parameter nearestPlace: optional: cnearest place to show
  /// - parameter colors: optional: colours to use, defaults are provided if missing
  public init(words: String?, nearestPlace: String?, colors: W3WColorSet = .whiteGrayRed) {
    self.words = words ?? "----.----.----"
    self.w3w = nil
    self.nearestPlace = nearestPlace
    self.colors = colors
  }
  
  /// shows the three words on top of each other, used in tight spaces, like on watchOS screens
  /// - parameter words: the three word address
  /// - parameter w3w: optional: if provided, this view will lookup and show the nearest place
  /// - parameter colors: optional: colours to use, defaults are provided if missing
  public init(words: String?, w3w: W3WProtocolV3, colors: W3WColorSet = .whiteGrayRed) {
    self.words = words ?? "----.----.----"
    self.w3w = w3w
    self.nearestPlace = nil
    self.colors = colors
  }
  
  /// shows the three words on top of each other, used in tight spaces, like on watchOS screens
  /// - parameter words: the three word address
  /// - parameter colors: optional: colours to use, defaults are provided if missing
  public init(words: String?, colors: W3WColorSet = .whiteGrayRed) {
    self.words = words ?? "----.----.----"
    self.w3w = nil
    self.nearestPlace = nil
    self.colors = colors
  }
  
  public var body: some View {
    HStack(alignment: .top, spacing: 0.0) {
      Text("///")
        .foregroundColor(colors.highlight.current.suColor)
        .bold()
        .minimumScaleFactor(0.5)
        .padding(0.0)
      VStack(alignment: .leading, spacing: 0.0) {
        Text(getWord(from: words, number: 0) + ".\n" + getWord(from: words, number: 1) + ".\n" + getWord(from: words, number: 2))
          .bold()
          .foregroundColor(colors.foreground.current.suColor)
          .minimumScaleFactor(0.75)
          .padding(0.0)
          //.frame(maxWidth: .infinity, alignment: .leading)
        if nearestPlace != nil {
          Text(nearestPlace ?? "").foregroundColor(colors.secondary.current.suColor)
            .font(.system(size: 10.0))
            .minimumScaleFactor(0.5)
            .padding(0.0)
        } else if w3w != nil {
          Text(nearestPlaceLookup ?? "").foregroundColor(colors.secondary.current.suColor)
            .font(.footnote)
            .minimumScaleFactor(0.5)
            .padding(0.0)
            .onAppear {
              w3w?.autosuggest(text: words) { suggestions, error in
                if suggestions?.first?.words == words {
                  nearestPlaceLookup = suggestions?.first?.nearestPlace
                }
              }
            }.animation(Animation.interactiveSpring(blendDuration: 0.2))
        }
      }
    }
  }
  
  

  func getWord(from: String?, number:Int) -> String {
    var word = "----"
    
    // if the user hasn't passed in a w3w, then make an dummy one for the isPossible3wa call (it should be changed to a static function)
    let w = w3w ?? What3WordsV3(apiKey: "")
    
    if let twa = from {
      if w.isPossible3wa(text: twa) {
        let wordArray = split(regex: W3WSettings.regex_3wa_separator, words: twa)
        if wordArray.count > number {
          word = wordArray[number]
        }
      }
    }
    
    return word
  }
  
  
  func split(regex pattern: String, words: String) -> [String] {
    
    guard let re = try? NSRegularExpression(pattern: pattern, options: [])
    else { return [] }
    
    let nsString = words as NSString // needed for range compatibility
    let stop = "☮︎"
    let modifiedString = re.stringByReplacingMatches(
      in: words,
      options: [],
      range: NSRange(location: 0, length: nsString.length), withTemplate: stop)
    return modifiedString.components(separatedBy: stop)
  }

  
  
}

@available(iOS 13.0, watchOS 6.0, *)
struct W3WVerticalWordsView_Previews: PreviewProvider {
    static var previews: some View {
      W3WSuVerticalWords(words: "filled.count.soap")
    }
}
