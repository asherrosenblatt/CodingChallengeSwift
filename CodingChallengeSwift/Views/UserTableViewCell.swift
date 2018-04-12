//
//  UserTableViewCell.swift
//  CodingChallengeSwift
//
//  Created by Asher Rosenblatt on 4/12/18.
//  Copyright © 2018 AVRTech. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var goldLabel: UILabel!
    @IBOutlet weak var silverLabel: UILabel!
    @IBOutlet weak var bronzeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profileImageView.layer.cornerRadius = 37.5
        self.profileImageView.layer.masksToBounds = true
        
        self.goldLabel.layer.cornerRadius = 10.0
        self.goldLabel.layer.masksToBounds = true
        self.goldLabel.backgroundColor = UIColor(red:0.99, green:0.97, blue:0.90, alpha:1.00)
        
        self.silverLabel.layer.cornerRadius = 10.0
        self.silverLabel.layer.masksToBounds = true
        self.silverLabel.backgroundColor = UIColor(red:0.93, green:0.93, blue:0.94, alpha:1.00)
        
        self.bronzeLabel.layer.cornerRadius = 10.0
        self.bronzeLabel.layer.masksToBounds = true
        self.bronzeLabel.backgroundColor = UIColor(red:0.96, green:0.93, blue:0.89, alpha:1.00)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
