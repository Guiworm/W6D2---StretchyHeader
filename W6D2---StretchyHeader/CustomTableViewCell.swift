//
//  CustomTableViewCell.swift
//  W6D2---StretchyHeader
//
//  Created by Dylan McCrindle on 2016-12-06.
//  Copyright © 2016 Dylan-McCrindle. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

	@IBOutlet weak var categoryLabel: UILabel!
	@IBOutlet weak var healineLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
