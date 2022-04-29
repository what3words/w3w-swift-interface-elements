//
//  File.swift
//  
//
//  Created by Dave Duprey on 28/04/2022.
//


/// State for animating slashes
public enum W3WSlashesState {
  
  /// slashes show only aas dots, not full slashes
  case dots
  
  /// static slashes, default state
  case slashes
  
  /// slashes are to animate to indicate actigity
  case animating
}
