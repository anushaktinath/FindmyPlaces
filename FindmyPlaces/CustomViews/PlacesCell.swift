//
//  PlacesCell.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/19/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import UIKit

class PlacesCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var addressLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  func setUpCell(result: SearchResult) {
    titleLabel.text = result.name
    addressLabel.text = result.vicinity

  }

}
