//
//  EditProfileViewController.swift
//  Citimate
//
//  Created by Hitaishin on 09/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    /// IBOutlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameTextFeild: UITextField!
    @IBOutlet weak var emailTextFeild: UITextField!
    @IBOutlet weak var contactNumberTextFeild: UITextField!
    @IBOutlet weak var genderTextFeild: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var UserNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contactNumberLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Global back button
        Global.backButton(self)
        // Set the Corner Radius
        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2
        UserNameLabel.layer.borderColor = Global.hexStringToUIColor(GlobalConstant.kkTagBorderColor).cgColor
        emailLabel.layer.borderColor = Global.hexStringToUIColor(GlobalConstant.kkTagBorderColor).cgColor
        contactNumberLabel.layer.borderColor = Global.hexStringToUIColor(GlobalConstant.kkTagBorderColor).cgColor
        genderLabel.layer.borderColor = Global.hexStringToUIColor(GlobalConstant.kkTagBorderColor).cgColor
        descriptionTextView.layer.borderColor = Global.hexStringToUIColor(GlobalConstant.kkTagBorderColor).cgColor

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:- Custom Button Action
    @IBAction func updateButtonAction(_ sender: Any) {
        self.navigationController!.popViewController(animated: true)
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
