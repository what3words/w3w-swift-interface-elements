//
//  File.swift
//  
//
//  Created by Dave Duprey on 19/05/2022.
//

import UIKit
import W3WSwiftApi
import W3WSwiftDesign


public class W3WSuggestionsTableViewController: W3WTableViewController<W3WSuggestion, W3WSuggestionsTableViewCell> {
  
  /// make a table view cell for a new row
  public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = getReusableCell(indexPath: indexPath)
    
    if let suggestion = getItem(at: indexPath) {
      cell.set(suggestion: suggestion)
    }
    
    return cell
  }
  
}
