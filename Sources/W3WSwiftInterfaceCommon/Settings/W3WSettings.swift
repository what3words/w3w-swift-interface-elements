//
//  File.swift
//  
//
//  Created by Dave Duprey on 20/05/2022.
//

import UIKit
import W3WSwiftApi


/// mertic imperial or default from the system
/// THIS IS TO BE MOVED TO W3WSwiftApi.W3WSettings and W3WSwiftComponents should use it as well
public enum W3WMesurementSystem2 {
  case metric
  case imperial
  case system
}


extension W3WSettings {
  
  // mutable settings
  static public var measurement = W3WMesurementSystem2.system
  static public var leftToRight = (NSLocale.characterDirection(forLanguage: NSLocale.preferredLanguages.first ?? W3WSettings.defaultLanguage) == Locale.LanguageDirection.leftToRight)
  
}


