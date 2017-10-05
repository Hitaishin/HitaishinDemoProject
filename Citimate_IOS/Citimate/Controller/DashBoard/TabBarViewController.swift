//
//  TabBarViewController.swift
//  Citimate
//
//  Created by Hitaishin on 04/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.delegate = self
        self.navigationItem.setHidesBackButton(true, animated: true)
        
//        let notificationBtn = UIButton(type: .custom)
//        notificationBtn.setImage(UIImage(named:"ic_notification_b"), for: .normal)
//        notificationBtn.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
//        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont.systemFont(ofSize: 10)
//        , NSForegroundColorAttributeName: UIColor.black]
//        let item1 = UIBarButtonItem(customView: notificationBtn)
//        
//        self.navigationItem.setRightBarButtonItems([item1], animated: true)
        
        self.title = "Citi Mate"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UITabBarController Delegate
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if(viewController == self.viewControllers![0])
        {
            self.title = "Citi Mate"
        }
        else if(viewController == self.viewControllers![1])
        {
            self.title = "Saved"
            //self.navigationItem.rightBarButtonItem = nil
        }
        else if(viewController == self.viewControllers![2])
        {
            self.title = "Following"
        }
        else if(viewController == self.viewControllers![3])
        {
            self.title = "Profile"
        }
        else if(viewController == self.viewControllers![4])
        {
            self.title = "More"
            //self.navigationItem.rightBarButtonItem = nil
            /*let btn1 = UIButton(type: .custom)
            btn1.setImage(UIImage(named: ""), for: .normal)
            btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            let item1 = UIBarButtonItem(customView: btn1)
            self.tabBarController?.navigationItem.setRightBarButtonItems([item1], animated: true)*/
        }
        
        return true
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
