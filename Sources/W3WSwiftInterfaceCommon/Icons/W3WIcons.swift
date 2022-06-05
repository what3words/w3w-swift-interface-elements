//
//  File.swift
//  
//
//  Created by Dave Duprey on 17/05/2022.
//

#if canImport(UIKit) && !os(watchOS)

import UIKit


public class W3WIcons {
  
  public static var pin      = UIImage(named: "addressValidationPinBlack", in: Bundle.module, compatibleWith: nil)
  public static var pinMulti = UIImage(named: "addressValidationPinMultiBlack", in: Bundle.module, compatibleWith: nil)
  
}

#else

public class W3WIcons {
}

#endif
