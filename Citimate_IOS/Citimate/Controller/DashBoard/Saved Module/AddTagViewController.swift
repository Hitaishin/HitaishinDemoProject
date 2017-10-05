//
//  AddTagViewController.swift
//  Citimate
//
//  Created by Hitaishin on 09/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class AddTagViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    /// IBOutlets
    @IBOutlet weak var addTagTableView: UITableView!
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var addNewTagView: UIView!
    @IBOutlet weak var addTagTextFeild: UITextField!
    @IBOutlet weak var addTagButton: UIButton!
    @IBOutlet weak var addNewTagLabel: UILabel!
    @IBOutlet weak var addTagNameTextFeild: UITextField!
    
    // array for Tag list
    var arrayTagList = ["English Pub (3)","DJ Bar (12)","Night Bar (9)","Unlimited Brink (14)","Party (31)","Lounge","Sport Bar","Restaurant"]
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        backGroundView.isHidden = true
        addNewTagView.isHidden = true
        addTagTextFeild.layer.borderColor = Global.hexStringToUIColor(GlobalConstant.kkBackgroundColor).cgColor
        Global.backButton(self)
        Global.reloadTableViewDataAnimated(addTagTableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:- Custom Button Action
    @IBAction func doneButtonTap(_ sender: Any) {
        self.navigationController!.popViewController(animated: true)
    }
    // Add new tag button tapped
    @IBAction func addNewTagButtonTap(_ sender: Any) {
        backGroundView.isHidden = false
        addNewTagView.isHidden = false
    }
    // Add new tag action button tapped
    @IBAction func newTagAddActionTap(_ sender: Any) {
        backGroundView.isHidden = true
        addNewTagView.isHidden = true
    }
    
    @IBAction func exitAddNewTagButtonTap(_ sender: Any){
        backGroundView.isHidden = true
        addNewTagView.isHidden = true
    }
    //MARK:- TableView Delegate and DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTagList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell :FollowerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "addTagCell", for: indexPath) as! FollowerTableViewCell
        cell.descriptionLabel.text = arrayTagList[indexPath.row]
        cell.ProfileImage.isHidden = true
        if indexPath.row == 2{
          cell.ProfileImage.isHidden = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
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
