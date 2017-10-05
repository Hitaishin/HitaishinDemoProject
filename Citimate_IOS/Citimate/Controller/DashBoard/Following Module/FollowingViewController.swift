//
//  FollowingViewController.swift
//  Citimate
//
//  Created by Hitaishin on 09/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class FollowingViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    /// IBOutlets
    @IBOutlet weak var followingButton: UIButton!
    @IBOutlet weak var followerButton: UIButton!
    @IBOutlet weak var tagListButton: UIButton!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var tagListLabel: UILabel!
    @IBOutlet weak var followingTableView: UITableView!
    
    var selectedButton : String = ""
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        selectedButton = "Following"
        followingLabel.isHidden = false
        followerLabel.isHidden = true
        tagListLabel.isHidden = true
        self.followingTableView.delegate = self
        self.followingTableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        setNotificationButton()
    }
    
    func setNotificationButton()
    {
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "ic_notification_a"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn1.addTarget(self, action: #selector(FollowingViewController.notificationButtonTap), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        self.tabBarController?.navigationItem.setRightBarButtonItems([item1], animated: true)
    }
    
    func notificationButtonTap(){
        self.performSegue(withIdentifier: GlobalConstant.kkSegueFollowingToNotification, sender: self)
    }
    
    //MARK:- Custom Button Action
    @IBAction func followingButtonTap(_ sender: Any) {
        selectedButton = "Following"
        followingButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkTopBarColor), for: .normal)
        followerButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        tagListButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        followingLabel.isHidden = false
        followerLabel.isHidden = true
        tagListLabel.isHidden = true
        Global.reloadTableViewDataAnimated(self.followingTableView)
    }
    
    @IBAction func followerButtonTap(_ sender: Any) {
        selectedButton = "Follower"
        followerButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkTopBarColor), for: .normal)
        followingButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        tagListButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        followingLabel.isHidden = true
        followerLabel.isHidden = false
        tagListLabel.isHidden = true
        Global.reloadTableViewDataAnimated(self.followingTableView)
    }
    
    @IBAction func TagListButtonTap(_ sender: Any) {
        selectedButton = "TagList"
        tagListButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkTopBarColor), for: .normal)
        followerButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        followingButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        followingLabel.isHidden = true
        followerLabel.isHidden = true
        tagListLabel.isHidden = false
        Global.reloadTableViewDataAnimated(self.followingTableView)
    }
    
    //MARK:- TableView Delegate and DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowCount : Int = 0
        if selectedButton == "Following" {
            rowCount = 3
        }
        else if selectedButton == "Follower"{
            rowCount = 2
        }
        else if selectedButton == "TagList"{
            rowCount = 1
        }
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if selectedButton == "Following"
        {
            let cell :FollowerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "followerCell", for: indexPath) as! FollowerTableViewCell
            followingTableView.separatorStyle = .singleLine
            cell.ProfileImage.image = UIImage(named: "img_demo_placeholder")
            cell.userNameLabel.text = "citimate Team"
            cell.followerCountLabel.text = "34 Followers"
            cell.descriptionLabel.text = "I am finding someone to drink..."
            cell.followingButton.setImage(UIImage(named: "btn_following_new"), for: .normal)
            cell.ProfileImage.layer.borderColor =  UIColor.clear.cgColor
            return cell
        }
        else if selectedButton == "Follower"
        {
            let cell :FollowerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "followerCell", for: indexPath) as! FollowerTableViewCell
            followingTableView.separatorStyle = .singleLine
            cell.ProfileImage.image = UIImage(named: "img_demo_placeholder")
            cell.userNameLabel.text = "Jea Team"
            cell.followerCountLabel.text = "5 Followers"
            cell.descriptionLabel.text = "I am finding someone to drink..."
            cell.followingButton.setImage(UIImage(named: "btn_follow_new"), for: .normal)
            cell.ProfileImage.layer.borderColor =  UIColor.clear.cgColor
            return cell
        }
        else if selectedButton == "TagList"
        {
            let cell :TagListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "tagListCell", for: indexPath) as! TagListTableViewCell
            followingTableView.separatorStyle = .none
            cell.placeImage.image = UIImage(named : "img_b")
            cell.profileImage.image = UIImage(named: "img_demo_placeholder")
            cell.userNameLabel.text = "Jea Team"
            cell.placeNameLabel.text = "Night club/ bar/ Hotel"
            cell.descriptionLabel.text = "More than that pubs"
            cell.placeCountLabel.layer.borderColor =  UIColor.white.cgColor
            cell.profileImage.layer.borderColor =  UIColor.white.cgColor
            return cell
            
        }
        else
        {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var rowheight : CGFloat = 0.0
        if selectedButton == "Following" {
            rowheight = 93
        }
        else if selectedButton == "Follower"{
            rowheight = 93
        }
        else if selectedButton == "TagList"{
            rowheight = 180
        }
        return rowheight
    }
    
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.view.endEditing(true)
        if selectedButton == "Following" {
            self.performSegue(withIdentifier: GlobalConstant.kkSegueFollowingToUserProfile, sender: self)
        }
        else if selectedButton == "Follower"{
            self.performSegue(withIdentifier: GlobalConstant.kkSegueFollowingToUserProfile, sender: self)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
