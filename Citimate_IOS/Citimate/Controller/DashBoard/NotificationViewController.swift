//
//  NotificationViewController.swift
//  Citimate
//
//  Created by Hitaishin on 10/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDataSource {
    // IBOutlets
    @IBOutlet weak var notificationTableView: UITableView!
    
    var userNameArray = ["Usher's Mack", "Mackle More", "Mannue Jack", "Selvin Waalke", "Wacca Cool", "Usher's Mack", "Mackle More", "Mannue Jack", "Selvin Waalke", "Wacca Cool"]

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Global.backButton(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView Delegate And DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell") as! NotificationTableViewCell
        let main_string = userNameArray[indexPath.row] + " " + "start following you."
        let string_to_color = "start following you."
        
        let range = (main_string as NSString).range(of: string_to_color)
        
        let attribute = NSMutableAttributedString.init(string: main_string)
        attribute.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGray , range: range)
        attribute.addAttributes([NSFontAttributeName: UIFont(name: "Roboto-Light", size: 12.0)!], range: range)
        
        cell.userDescriptionLabel.attributedText = attribute
        cell.userImageView.image = UIImage(named: "edit_user")
        
        cell.timeLabel.text = "8 hr Ago"
        
        return cell
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
