//
//  File.swift
//
//
//  Created by Dave Duprey on 23/05/2022.
//

import UIKit


/// UISearchController overwritten for what3words display needs
open class W3WSearchController: UISearchController, UISearchControllerDelegate, UISearchBarDelegate, UISearchTextFieldDelegate {

  // MARK: Vars

  public var onTextChange: (String) -> (Bool) = { _ in true }

  public var onEditingBeginning: () -> () = { }
  public var onEditingEnding: () -> () = { }


  open override func viewDidLoad() {
    super.viewDidLoad()

    searchBar.keyboardType = .URL
    
    delegate = self
    searchBar.delegate = self
  }


  public func presentSearchController(_ searchController: UISearchController) {
    onEditingBeginning()
  }


  public func willDismissSearchController(_ searchController: UISearchController) {
    onEditingEnding()
  }



  /// called when the text field contents change
  public func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    var allowTextChange = true
    
    if let t = searchBar.text {
      let newText = t.replacingCharacters(in: Range(range, in: t)!, with: text)
      allowTextChange = onTextChange(newText)
    }
    
    return allowTextChange
  }


}
