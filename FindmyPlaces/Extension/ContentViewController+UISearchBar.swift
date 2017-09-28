//
//  ContentViewController+UISearchBar.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/19/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import UIKit


extension ContentViewController: UISearchBarDelegate{
  
  func updateSearchResultsForSearchController(searchController: UISearchController) {
    guard let searchString = searchController.searchBar.text else {
      return
    }
    /*
     // Filter the data array and get only those countries that match the search text.
     filteredArray = dataArray.filter({ (country) -> Bool in
     let countryText:NSString = country
     
     return (countryText.rangeOfString(searchString, options: NSStringCompareOptions.CaseInsensitiveSearch).location) != NSNotFound
     })
     
     // Reload the tableview.
     tblSearchResults.reloadData()
     */
  }
  
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    isSearching = true
    searchBar.showsCancelButton = true
    initialisePopOverController()

  }
   
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    isSearching = false
    searchBar.showsCancelButton = false
    self.view.endEditing(true)
  }
    
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    fetchPlaces(types: "", radius: "", name: searchText)
  }

  
  
}

