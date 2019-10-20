//
//  RichTableViewCell.swift
//  LPLinkPresenter
//
//  Created by hyeri kim on 20/10/2019.
//  Copyright © 2019 hyeri kim. All rights reserved.
//

import UIKit

class RichTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var RichImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
