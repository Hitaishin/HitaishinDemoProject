//
//  SignupViewController.swift
//  Citimate
//
//  Created by Hitaishin on 02/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    // IBOutlets
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var enterUsername: UITextField!
    @IBOutlet weak var enterEmail: UITextField!
    @IBOutlet weak var enterPhone: UITextField!
    @IBOutlet weak var enterPassword: UITextField!
    @IBOutlet weak var enterConfirmPassword: UITextField!
    @IBOutlet weak var checkBoxButton: UIButton!
    
    var isCheckBoxSelected: Bool = false

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usernameLabel.layer.borderColor = Global.hexStringToUIColor("#c1c8cf").cgColor
        emailLabel.layer.borderColor = Global.hexStringToUIColor("#c1c8cf").cgColor
        phoneLabel.layer.borderColor = Global.hexStringToUIColor("#c1c8cf").cgColor
        passwordLabel.layer.borderColor = Global.hexStringToUIColor("#c1c8cf").cgColor
        confirmPasswordLabel.layer.borderColor = Global.hexStringToUIColor("#c1c8cf").cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Action Methods
    /*
     // All the button action methods
     */
    @IBAction func checkBoxButtonTap(sender: AnyObject)
    {
        if isCheckBoxSelected
        {
            isCheckBoxSelected = false
            checkBoxButton.setImage(UIImage(named: "check_box_a"), for: .normal)
        }
        else
        {
            isCheckBoxSelected = true
            checkBoxButton.setImage(UIImage(named: "check_box_b"), for: .normal)
        }
    }
    // Terms&Condition button tapped
    @IBAction func termsAndConditionsButtonTap(sender: AnyObject)
    {
        self.performSegue(withIdentifier: GlobalConstant.kkSegueSignupToTermsCondition, sender: self)
    }
    // Signup button tapped
    @IBAction func signUpButtonTap(sender: AnyObject)
    {
        self.performSegue(withIdentifier: GlobalConstant.kkSegueSignUpToHome, sender: self)
    }
    // SignIn button tapped
    @IBAction func signInButtonTap(sender: AnyObject)
    {
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
