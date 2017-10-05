//
//  TermsAndConditionsViewController.swift
//  Citimate
//
//  Created by Hitaishin on 03/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class TermsAndConditionsViewController: UIViewController {
    
    var checkSegue: String = ""

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if checkSegue == "Privacy Policy"
        {
            self.title = "Privacy Policy"
        }
        else
        {
            self.title = "Terms and Conditions"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        Global.backButton(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
