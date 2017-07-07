//
//  RecentConversationCell.swift
//  Sirius-Swift
//
//  Created by Just on 2017/7/6.
//  Copyright © 2017年 PF. All rights reserved.
//

import UIKit

class RecentConversationCell: UITableViewCell {

    @IBOutlet weak var detailButton: UIButton? {
        didSet{
            self.textLabel?.bringSubview(toFront: self.detailButton!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
