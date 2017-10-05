//
//  ReviewsViewController.swift
//  Citimate
//
//  Created by Hitaishin on 07/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class ReviewsViewController: UIViewController, UITableViewDataSource {
    
    // IBOutlets
    @IBOutlet weak var reviewTableView: UITableView!
    /// user name array
    var userNameArray = ["Usher's Mack", "Mackle More", "Mannue Jack", "Selvin Waalke", "Wacca Cool", "Usher's Mack", "Mackle More", "Mannue Jack", "Selvin Waalke", "Wacca Cool"]
    var userImageArray = [""]

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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell") as! ReviewsTableViewCell
        
        cell.userNameLabel.text = userNameArray[indexPath.row]
        cell.userImageView.image = UIImage(named: "edit_user")
        
        //Ratings(required float rating params)
        cell.ratingView.emptyImage = UIImage(named: "star_view_b")
        cell.ratingView.fullImage = UIImage(named: "star_view_a")
        cell.ratingView.rating = 3.5
        cell.ratingView.editable = false
        cell.ratingView.halfRatings = true
        cell.ratingView.floatRatings = false
        
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
