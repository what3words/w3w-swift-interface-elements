//
//  File.swift
//
//
//  Created by Dave Duprey on 23/05/2022.
//

import UIKit


open class W3WSearchController: UISearchController, UISearchControllerDelegate, UISearchBarDelegate, UISearchTextFieldDelegate {

  // MARK: Vars

  public var onTextChange: (String) -> (Bool) = { _ in true }

  public var onEditingBeginning: () -> () = { }
  public var onEditingEnding: () -> () = { }


  open override func viewDidLoad() {
    super.viewDidLoad()

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

  
//  func searchDisplayController(_ controller: UISearchDisplayController, didShowSearchResultsTableView tableView: UITableView) {
//    tableView.frame = self.
//  }

//  - (void)searchDisplayController:(UISearchDisplayController *)controller didShowSearchResultsTableView:(UITableView *)tableView  {
//    tableView.frame = self.myTable.frame;
//  }
  
//  public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//    if let v = self.parent as? W3WViewController {
//      v.showHandle = true
//    }
//  }


  /// called when the search bar text changes
//  public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//    print(searchText)
////    searchBar.text = autoSuggestViewController.groom(text: searchBar.text)
////    textChanged(searchBar.text)
//  }


}
