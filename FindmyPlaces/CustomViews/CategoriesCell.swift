//
//  CtegoriesCell.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/22/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import UIKit

protocol CategoriesCellDelegate: class {
  
  func categoriesCell(_ cell: CategoriesCell, didSelect category: String)
}

class CategoriesCell: UITableViewCell {
  
  @IBOutlet weak var checkBoxButton: UIButton!
  @IBOutlet weak var typesLabel: UILabel!
  weak var delegate: CategoriesCellDelegate?
  var categorySelected: Bool?



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  @IBAction func checkBoxClicked(sender: UIButton){
    guard let selectedItem =  typesLabel.text else {
      return
    }
    delegate?.categoriesCell(self, didSelect: selectedItem)
  }
  
  func setUpCell(item: String) {
    typesLabel.text = item
    if categorySelected == true {
      checkBoxButton.setBackgroundImage(UIImage(named: "check"), for: .normal)
    }else{
      checkBoxButton.setBackgroundImage(UIImage.init(named: "uncheck"), for: .normal)
    }

    
  }

}
