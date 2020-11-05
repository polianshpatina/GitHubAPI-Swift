//
//  CommitsViewCell.swift
//  GitHubAPI-Swift
//
//  Created by Stephen Kaylor on 10/31/20.
//  Copyright © 2020 Polian Shpatina. All rights reserved.
//

import UIKit

class CommitsViewCell: UITableViewCell {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var HashLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

