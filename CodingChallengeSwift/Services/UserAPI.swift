//
//  UserAPI.swift
//  CodingChallengeSwift
//
//  Created by Asher Rosenblatt on 4/11/18.
//  Copyright © 2018 AVRTech. All rights reserved.
//

import UIKit

class UserAPI: NSObject
{
    static func getUsers(completion: @escaping (Array<User>?, String?) -> Void)
    {
        let urlString = "https://api.stackexchange.com/2.2/users?site=stackoverflow"
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let data = data else {
                completion(nil, nil)
                return
            }
            if let jsonDataArray = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                let items: [[String: Any]] = jsonDataArray!["items"]! as! [[String: Any]]
                var users = [User]()
                for item in items {
                    print(item)
                    let user = User.init(userDictionary: item)
                    users.append(user)
                    }
            completion(users, nil)
            }
        })
        task.resume()
    }
}
