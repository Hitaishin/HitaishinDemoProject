//
//  SavedViewController.swift
//  Citimate
//
//  Created by Hitaishin on 09/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class SavedViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    // IBOutlets
    @IBOutlet weak var tagListTableView: UITableView!
    var nextViewTitle: String = ""
    // array for the Taglist
    var arrayTagList = ["English Pub (3)","DJ Bar (12)","Night Bar (9)","Uvarmited Brink (14)","Party (31)"]
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tagListTableView.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNotificationButton()
    }
    // func for the set notification
    func setNotificationButton()
    {
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "ic_notification_a"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn1.addTarget(self, action: #selector(HomeViewController.notificationButtonTap), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        self.tabBarController?.navigationItem.setRightBarButtonItems([item1], animated: true)
    }
    // Action for notification button tapped
    func notificationButtonTap() {
        self.performSegue(withIdentifier: GlobalConstant.kkSegueSavedToNotification, sender: self)
    }
    
    //MARK:- TableView Delegate and DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTagList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell :FollowerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "tagListCell", for: indexPath) as! FollowerTableViewCell
        cell.descriptionLabel.text = arrayTagList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        nextViewTitle = arrayTagList[indexPath.row]
        self.performSegue(withIdentifier: GlobalConstant.kkSegueSavedToSavedList, sender: self)
    }
    
    //MARK: - Action Methods
    
    @IBAction func savedListButtonTap(_ sender: Any) {
        nextViewTitle = "Saved List"
        self.performSegue(withIdentifier: GlobalConstant.kkSegueSavedToSavedList, sender: self)
    }
    
    @IBAction func addTagButtonTap(_ sender: Any) {
        self.performSegue(withIdentifier: GlobalConstant.kkSegueSavedViewToAddTagView, sender: nil)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == GlobalConstant.kkSegueSavedToSavedList
        {
            let destinationViewController = segue.destination as! SavedListViewController
            destinationViewController.viewTitle = nextViewTitle
        }
    }
    
}
