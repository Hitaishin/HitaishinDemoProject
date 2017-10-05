//
//  ChangePasswordViewController.swift
//  Citimate
//
//  Created by Hitaishin on 04/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    @IBOutlet weak var newPasswordLabel: UILabel!
    @IBOutlet weak var confirmPasswordLabel: UILabel!

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        newPasswordLabel.layer.borderColor = Global.hexStringToUIColor("#D0CED6").cgColor
        confirmPasswordLabel.layer.borderColor = Global.hexStringToUIColor("#D0CED6").cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
