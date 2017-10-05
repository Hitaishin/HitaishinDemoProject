//
//  UserProfileViewController.swift
//  Citimate
//
//  Created by Hitaishin on 10/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    /// IBOutlets
    @IBOutlet weak var followingButton: UIButton!
    @IBOutlet weak var followerButton: UIButton!
    @IBOutlet weak var tagListButton: UIButton!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var tagListLabel: UILabel!
    @IBOutlet weak var userProfileTableView: UITableView!
    @IBOutlet weak var userprofileImage: UIImageView!
    
    var selectedButton: Int = 0
   
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.userprofileImage.layer.cornerRadius = self.userprofileImage.frame.size.width / 2
        userprofileImage.clipsToBounds = true
        
        selectedButton = 0
        followingLabel.isHidden = false
        followerLabel.isHidden = true
        tagListLabel.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Global.backButton(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:- Custom Button Action
    @IBAction func followingButtonTap(_ sender: Any) {
        selectedButton = 0
        followingButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkTopBarColor), for: .normal)
        followerButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        tagListButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        followingLabel.isHidden = false
        followerLabel.isHidden = true
        tagListLabel.isHidden = true
        Global.reloadTableViewDataAnimated(userProfileTableView)
    }
    @IBAction func followerButtonTap(_ sender: Any) {
        selectedButton = 1
        followerButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkTopBarColor), for: .normal)
        followingButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        tagListButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        followingLabel.isHidden = true
        followerLabel.isHidden = false
        tagListLabel.isHidden = true
        Global.reloadTableViewDataAnimated(userProfileTableView)
    }
    @IBAction func TagListButtonTap(_ sender: Any) {
        selectedButton = 2
        tagListButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkTopBarColor), for: .normal)
        followerButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        followingButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        followingLabel.isHidden = true
        followerLabel.isHidden = true
        tagListLabel.isHidden = false
        Global.reloadTableViewDataAnimated(userProfileTableView)
    }
    
    //MARK:- TableView Delegate and DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowCount : Int = 0
        if selectedButton == 0 {
            rowCount = 3
        }
        else if selectedButton == 1{
            rowCount = 2
        }
        else if selectedButton == 2{
            rowCount = 1
        }
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if selectedButton == 0
        {
            let cell :FollowerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "followingCell", for: indexPath) as! FollowerTableViewCell
            
            cell.ProfileImage.image = UIImage(named: "img_demo_placeholder")
            cell.userNameLabel.text = "citimate Team"
            cell.followerCountLabel.text = "34 Followers"
            cell.descriptionLabel.text = "I am finding someone to drink..."
            cell.followingButton.setImage(UIImage(named: "btn_following_new"), for: .normal)
            cell.ProfileImage.layer.borderColor =  UIColor.clear.cgColor
            return cell
        }
        else if selectedButton == 1
        {
            let cell :FollowerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "followingCell", for: indexPath) as! FollowerTableViewCell
            
            cell.ProfileImage.image = UIImage(named: "img_demo_placeholder")
            cell.userNameLabel.text = "Jea Team"
            cell.followerCountLabel.text = "5 Followers"
            cell.descriptionLabel.text = "I am finding someone to drink..."
            cell.followingButton.setImage(UIImage(named: "btn_follow_new"), for: .normal)
            cell.ProfileImage.layer.borderColor =  UIColor.clear.cgColor
            return cell
        }
        else if selectedButton == 2
        {
            let cell :FollowerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "tagListCell", for: indexPath) as! FollowerTableViewCell
            cell.userNameLabel.text = "Jea Team"
            return cell
            
        }
        else
        {
            return UITableViewCell()
        }

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var rowheight : CGFloat = 0.0
        if selectedButton == 0 {
            rowheight = 93
        }
        else if selectedButton == 1{
            rowheight = 93
        }
        else if selectedButton == 2{
            rowheight = 70
            
        }
        return rowheight
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
