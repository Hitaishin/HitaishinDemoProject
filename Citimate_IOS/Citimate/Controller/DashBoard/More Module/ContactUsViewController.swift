//
//  ContactUsViewController.swift
//  Citimate
//
//  Created by Hitaishin on 04/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var enterSubject: UITextField!
    @IBOutlet weak var messageTextView: UITextView!

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        subjectLabel.layer.borderColor = Global.hexStringToUIColor("#D0CED6").cgColor
        messageTextView.layer.borderColor = Global.hexStringToUIColor("#D0CED6").cgColor
        
        messageTextView.delegate = self
        messageTextView.text = "Message"
        messageTextView.textColor = UIColor.lightGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Global.backButton(self)
    }
    
    // MARK: - TextView Delegate
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Message"
            textView.textColor = UIColor.lightGray
        }
    }
    
    // MARK: - Action Methods
    
    @IBAction func sendButtonTap(sender: AnyObject)
    {
        if enterSubject.text == ""
        {
            Global.showAlertMessageWithOkButtonAndTitle(GlobalConstant.APP_NAME, andMessage: "Please enter subject")
        }
        else if messageTextView.text == ""
        {
            Global.showAlertMessageWithOkButtonAndTitle(GlobalConstant.APP_NAME, andMessage: "Please enter message")
        }
        else if messageTextView.text == "Message"
        {
            Global.showAlertMessageWithOkButtonAndTitle(GlobalConstant.APP_NAME, andMessage: "Please enter message")
        }
        else
        {
            
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
