//
//  LoginViewController.swift
//  Citimate
//
//  Created by Hitaishin on 02/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController {
    // IBOutlets
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var enterEmail: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var enterPassword: UITextField!
    @IBOutlet weak var signUpButton: UIButton!

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailLabel.layer.borderColor = Global.hexStringToUIColor("#c1c8cf").cgColor
        passwordLabel.layer.borderColor = Global.hexStringToUIColor("#c1c8cf").cgColor
        signUpButton.layer.borderColor = UIColor.white.cgColor
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
    @IBAction func signInButtonTap(sender: AnyObject)
    {
        self.performSegue(withIdentifier: GlobalConstant.kkSegueLoginToHome, sender: self)
    }
    // Singup Button tapped
    @IBAction func signUpButtontap(sender: AnyObject)
    {
        self.performSegue(withIdentifier: GlobalConstant.kkSegueLoginToSignup, sender: self)
    }
    // Facebook Button tapped
    @IBAction func signInwithFacebookButtonTap(sender: AnyObject)
    {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email","public_profile"], from: self) { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if (result?.isCancelled)! {
                    return
                }
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    self.getFBUserData()
                }
            }
        }
    }
    // Forgot password button tapped
    @IBAction func forgotPasswordButtonTap(sender: AnyObject)
    {
        self.performSegue(withIdentifier: GlobalConstant.kkSegueLoginToForgotPassword, sender: self)
    }
    
    //Method For fetching facebook data
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email, gender"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    //everything works print the user data
                    print(result!)
                    self.performSegue(withIdentifier: GlobalConstant.kkSegueLoginToHome, sender: self)

                    
                }
                else if (error != nil)
                {
                    print(error!.localizedDescription)
                }
            })
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
