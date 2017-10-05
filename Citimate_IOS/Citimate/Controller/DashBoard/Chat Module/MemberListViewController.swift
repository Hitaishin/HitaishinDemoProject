//
//  MemberListViewController.swift
//  Citimate
//
//  Created by Hitaishin on 10/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class MemberListViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    // IBOutlets
    @IBOutlet weak var memberButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var memberLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var chatTableView: UITableView!
    
    var nextViewTitle: String = ""
    
    //For Show UITableView
    var selectedView : Int = 0
    // Array for the user name
    var arrayUserName = ["Usher's Mack","Citimate Team","Ming Fang","Liam Ng","Jessica Wong","Noel Hansel","Dave scarf","Mack Jack"]
    // Array for the description
    var arrayDescription = ["Loren Ipsum is simply dummy text of the printing.","Loren Ipsum is simply dummy text of the printing.","Loren Ipsum is simply dummy text of the printing.","Loren Ipsum is simply dummy text of the printing.","Loren Ipsum is simply dummy text of the printing.","Loren Ipsum is simply dummy text of the printing.","Loren Ipsum is simply dummy text of the printing.","Loren Ipsum is simply dummy text of the printing."]
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        selectedView = 0
        memberButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkTopBarColor), for: .normal)
        memberLabel.isHidden = false
        chatLabel.isHidden = true
        memberButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkTopBarColor), for: .normal)
        chatButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        Global.reloadTableViewDataAnimated(chatTableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Global.backButton(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Custom Button action
    @IBAction func memberButtonTap(_ sender: Any) {
        selectedView = 0
        memberLabel.isHidden = false
        chatLabel.isHidden = true
        memberButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkTopBarColor), for: .normal)
        chatButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        Global.reloadTableViewDataAnimated(chatTableView)
    }
    // action method for Chat button
    @IBAction func chatButtonTap(_ sender: Any) {
        selectedView = 1
        memberLabel.isHidden = true
        chatLabel.isHidden = false
        memberButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkGrayColor), for: .normal)
        chatButton.setTitleColor(Global.hexStringToUIColor(GlobalConstant.kkTopBarColor), for: .normal)
        Global.reloadTableViewDataAnimated(chatTableView)
    }
    //MARK:- TableView Delegate and DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowCount : Int = 0
        if selectedView == 0 {
            rowCount = arrayUserName.count
        }
        else if selectedView == 1{
            rowCount = arrayUserName.count
        }
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if selectedView == 0
        {
            let cell :FollowerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "memberListCell", for: indexPath) as! FollowerTableViewCell
            cell.ProfileImage.image = UIImage(named: "img_demo_placeholder")
            cell.userNameLabel.text = arrayUserName[indexPath.row]
            cell.followerCountLabel.text = "30 mint ago"
            cell.descriptionLabel.text = arrayDescription[indexPath.row]
            
            return cell
        }
        else if selectedView == 1
        {
            let cell :FollowerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as! FollowerTableViewCell
            cell.ProfileImage.image = UIImage(named: "img_demo_placeholder")
            cell.userNameLabel.text = arrayUserName[indexPath.row]
            return cell
        }
        else
        {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var rowheight : CGFloat = 0.0
        if selectedView == 0 {
            rowheight = 80
        }
        else if selectedView == 1{
            rowheight = 70
        }
        
        return rowheight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if selectedView == 0
        {
            nextViewTitle = arrayUserName[indexPath.row]
            self.performSegue(withIdentifier: GlobalConstant.kkSegueMemberListToChat, sender: self)
        }
        else
        {
            nextViewTitle = arrayUserName[indexPath.row]
            self.performSegue(withIdentifier: GlobalConstant.kkSegueMemberListToChat, sender: self)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == GlobalConstant.kkSegueMemberListToChat
        {
            let destinationViewController = segue.destination as! ChatViewController
            destinationViewController.viewTitle = nextViewTitle
        }
    }
    

}
