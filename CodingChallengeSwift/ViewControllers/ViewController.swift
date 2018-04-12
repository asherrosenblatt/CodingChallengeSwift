//
//  ViewController.swift
//  CodingChallengeSwift
//
//  Created by Asher Rosenblatt on 4/11/18.
//  Copyright © 2018 AVRTech. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController
{
    @IBOutlet weak var mainTableView: UITableView!
    var users = [User]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.mainTableView.register(UINib.init(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "ID")
        self.mainTableView.refreshControl = UIRefreshControl()
        self.mainTableView.refreshControl?.addTarget(self, action: #selector(reloadData), for: .valueChanged)
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.reloadData()
    }
    
    @objc func reloadData()
    {
        if self.mainTableView.refreshControl?.isRefreshing == false {
            self.mainTableView.refreshControl!.beginRefreshing()
        }
        UserAPI.getUsers { (users, errorStr) in
            if errorStr != nil
            {
                print("ERROR: \(errorStr!)")
            }
            else
            {
                guard let users = users else { return }
                self.users = users
                self.mainTableView .reloadData()
            }
            self.mainTableView.refreshControl!.endRefreshing()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: UserTableViewCell = self.mainTableView.dequeueReusableCell(withIdentifier: "ID") as! UserTableViewCell
        let user = self.users[indexPath.row]
        cell.selectionStyle = .none
        cell.displayNameLabel.text = user.displayName
        cell.goldLabel.text = "\(user.badgeCount.gold)"
        cell.silverLabel.text = "\(user.badgeCount.silver)"
        cell.bronzeLabel.text = "\(user.badgeCount.bronze)"
        cell.profileImageView.sd_setShowActivityIndicatorView(true)
        cell.profileImageView.sd_setImage(with: user.profileImgURL, placeholderImage: UIImage(), options: .continueInBackground, completed: nil)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 95.0
    }
}

