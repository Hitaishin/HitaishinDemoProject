//
//  MoreViewController.swift
//  Citimate
//
//  Created by Hitaishin on 04/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
    var checkSegue: String = ""

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        btn1.addTarget(self, action: #selector(HomeViewController.notificationButtonTap), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        self.tabBarController?.navigationItem.setRightBarButtonItems([item1], animated: true)
    }
    func notificationButtonTap() {
        self.performSegue(withIdentifier: GlobalConstant.kkSegueMoreToNotification, sender: self)
    }
    // MARK: Action Methods
    
    @IBAction func changePasswordButtonTap(sender: AnyObject)
    {
        self.performSegue(withIdentifier: GlobalConstant.kkSegueMoreToChangePassword, sender: self)
    }
    
    @IBAction func aboutUsButtonTap(sender: AnyObject)
    {
        self.performSegue(withIdentifier: GlobalConstant.kkSegueMoretoAboutUs, sender: self)
    }
    
    @IBAction func fAQButtonTap(sender: AnyObject)
    {
        self.performSegue(withIdentifier: GlobalConstant.kkSegueMoreToFAQ, sender: self)
    }
    
    @IBAction func privacyPolicyButtonTap(sender: AnyObject)
    {
        checkSegue = "Privacy Policy"
        self.performSegue(withIdentifier: GlobalConstant.kkSegueMoreToTermsAndConditions, sender: self)
    }
    
    @IBAction func termsAndConditionsButtonTap(sender: AnyObject)
    {
        checkSegue = "Terms and Condition"
        self.performSegue(withIdentifier: GlobalConstant.kkSegueMoreToTermsAndConditions, sender: self)
    }
    
    @IBAction func contactUsButtonTap(sender: AnyObject)
    {
        self.performSegue(withIdentifier: GlobalConstant.kkSegueMoreToContactUs, sender: self)
    }
    
    @IBAction func rateUsButtonTap(sender: AnyObject)
    {
        
    }
    
    @IBAction func logoutButtonTap(sender: AnyObject)
    {
        let alert:UIAlertController=UIAlertController(title: GlobalConstant.APP_NAME, message: "Are you sure you want to logout?", preferredStyle: UIAlertControllerStyle.alert)
        
        let Delete = UIAlertAction(title: "Logout", style: UIAlertActionStyle.destructive)
        {
            UIAlertAction in
            let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nav = mainStoryboardIpad.instantiateViewController(withIdentifier: "LoginNavigationController") as! UINavigationController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = nav
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel)
        {
            UIAlertAction in
        }
        
        alert.addAction(Delete)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == GlobalConstant.kkSegueMoreToTermsAndConditions
        {
            let destinationViewController = segue.destination as! TermsAndConditionsViewController
            destinationViewController.checkSegue = checkSegue
        }
    }
    

}
