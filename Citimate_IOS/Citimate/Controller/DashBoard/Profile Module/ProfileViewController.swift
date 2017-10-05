//
//  ProfileViewController.swift
//  Citimate
//
//  Created by Hitaishin on 08/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    /// IBOutlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var followingButton: UIButton!
    @IBOutlet weak var followerButton: UIButton!
    @IBOutlet weak var tagListButton: UIButton!
    @IBOutlet weak var savedListButton: UIButton!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var tagListLabel: UILabel!
    @IBOutlet weak var savedListLabel: UILabel!
    @IBOutlet weak var profileTableView: UITableView!
    
    var selectedButton : String = ""
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedButton = "Following"
        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        followingLabel.isHidden = false
        followerLabel.isHidden = true
        tagListLabel.isHidden = true
        savedListLabel.isHidden = true
        self.profileTableView.delegate = self
        self.profileTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        setEditProfileButton()
    }
    override func viewDidDisappear(_ animated: Bool) {
//        self.navigationController?.navigationItem.rightBarButtonItem = nil
    }
    func setEditProfileButton()
    {
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "btn_edit_profile"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 70, height: 21)
        btn1.addTarget(self, action: #selector(ProfileViewController.EditProfileButtonTap), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        self.tabBarController?.navigationItem.setRightBarButtonItems([item1], animated: true)
    }
    
    //MARK:- Custom button Action
    func EditProfileButtonTap(){
        self.performSegue(withIdentifier: GlobalConstant.kkSegueProfileToEditProfileView, sender: self)
    }
    @IBAction func followingButtonTap(_ sender: Any) {
        selectedButton = "Following"
        followingButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkTopBarColor), for: .normal)
        followerButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        tagListButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        savedListButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        followingLabel.isHidden = false
        followerLabel.isHidden = true
        tagListLabel.isHidden = true
        savedListLabel.isHidden = true
        Global.reloadTableViewDataAnimated(self.profileTableView)
    }
    @IBAction func followerButtonTap(_ sender: Any) {
        selectedButton = "Follower"
        followerButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkTopBarColor), for: .normal)
        followingButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        tagListButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        savedListButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        followingLabel.isHidden = true
        followerLabel.isHidden = false
        tagListLabel.isHidden = true
        savedListLabel.isHidden = true        
        Global.reloadTableViewDataAnimated(profileTableView)
      
    }
    @IBAction func TagListButtonTap(_ sender: Any) {
        selectedButton = "TagList"
        tagListButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkTopBarColor), for: .normal)
        followerButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        followingButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        savedListButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        followingLabel.isHidden = true
        followerLabel.isHidden = true
        tagListLabel.isHidden = false
        savedListLabel.isHidden = true
        //self.profileTableView.reloadData()
        Global.reloadTableViewDataAnimated(self.profileTableView)

    }
    @IBAction func savedListButtonTap(_ sender: Any) {
        selectedButton = "SavedList"
        savedListButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkTopBarColor), for: .normal)
        tagListButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        followerButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        followingButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        followingLabel.isHidden = true
        followerLabel.isHidden = true
        tagListLabel.isHidden = true
        savedListLabel.isHidden = false
        Global.reloadTableViewDataAnimated(self.profileTableView)
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
        else if selectedButton == "SavedList"{
            rowCount = 1
        }
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if selectedButton == "Following"
        {
            let cell :FollowerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "followerCell", for: indexPath) as! FollowerTableViewCell
            profileTableView.separatorStyle = .singleLine
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
            profileTableView.separatorStyle = .singleLine
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
            profileTableView.separatorStyle = .none
            cell.placeImage.image = UIImage(named : "img_b")
            cell.profileImage.image = UIImage(named: "img_demo_placeholder")
            cell.userNameLabel.text = "Jea Team"
            cell.placeNameLabel.text = "Night club/ bar/ Hotel"
            cell.descriptionLabel.text = "More than that pubs"
            cell.placeCountLabel.layer.borderColor =  UIColor.white.cgColor
            cell.profileImage.layer.borderColor =  UIColor.white.cgColor
            return cell

        }
        else if selectedButton == "SavedList"
        {
            let cell :SavedListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "savedList", for: indexPath) as! SavedListTableViewCell
            profileTableView.separatorStyle = .none
            cell.placeImage.image = UIImage(named: "img_c")
            cell.discriptionLabel.text = "Rainbow Bar & Grill & Federal Bar"
            cell.placeNameLabel.text = "Night club/ bar/ Hotel"
            cell.floatRatingView.emptyImage = UIImage(named: "star_view_b_white")
            cell.floatRatingView.fullImage = UIImage(named: "star_view_a")
            cell.floatRatingView.rating = 3.5
            cell.floatRatingView.editable = false
            cell.floatRatingView.halfRatings = true
            cell.floatRatingView.floatRatings = false
            cell.friendsJoyLabel.layer.borderColor =  Global.hexStringToUIColor(GlobalConstant.kkTagBorderColor).cgColor
            cell.myPubLabel.layer.borderColor =  Global.hexStringToUIColor(GlobalConstant.kkTagBorderColor).cgColor
            cell.beerSectionLabel.layer.borderColor =  Global.hexStringToUIColor(GlobalConstant.kkTagBorderColor).cgColor
            cell.addTagButton.layer.borderColor =  Global.hexStringToUIColor(GlobalConstant.kkTopBarColor).cgColor
            return cell
        }else
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
            rowheight = 178
            
        }
        else if selectedButton == "SavedList"{
            rowheight = 234
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
