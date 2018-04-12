//
//  User.swift
//  CodingChallengeSwift
//
//  Created by Asher Rosenblatt on 4/11/18.
//  Copyright © 2018 AVRTech. All rights reserved.
//

import UIKit

class User: NSObject
{
    var accountId: Double!
    var displayName: String!
    var badgeCount: BadgeCount!
    struct BadgeCount {
        var bronze: Float
        var silver: Float
        var gold: Float
    }

    var profileImgURL: URL!
    
    init(userDictionary: Dictionary<String, Any>)
    {
        self.accountId = userDictionary["account_id"]! as! Double
        self.displayName = userDictionary["display_name"]! as! String
        let badgeCounts: Dictionary = userDictionary["badge_counts"]! as! Dictionary<String, Float>
        self.badgeCount = BadgeCount.init(bronze: badgeCounts["bronze"]!, silver: badgeCounts["silver"]!, gold: badgeCounts["gold"]!)
        let imgURLString = userDictionary["profile_image"]! as! String
        self.profileImgURL = URL.init(string: imgURLString)
        super.init()
    }
}
