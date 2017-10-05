//
//  SavedListViewController.swift
//  Citimate
//
//  Created by Hitaishin on 09/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class SavedListViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    // IBOutlets
    @IBOutlet weak var savedTableView: UITableView!
    @IBOutlet weak var addPlaceButton: UIButton!
    @IBOutlet weak var addPlaceBakLabel: UILabel!
    
    var viewTitle: String = ""
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Global.reloadTableViewDataAnimated(savedTableView)
        addPlaceBakLabel.layer.borderColor = UIColor.white.cgColor
        // Do any additional setup after loading the view.
        self.title = viewTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Global.backButton(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:- Custom Button action
    
    @IBAction func addPlaceButtonTap(_ sender: Any) {
        self.performSegue(withIdentifier: GlobalConstant.kkSegueSavedListToAddPlace, sender: self)
    }
   
    //MARK:- TableView Delegate and DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell :SavedListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "savedList", for: indexPath) as! SavedListTableViewCell
        cell.placeImage.image = UIImage(named: "img_c")
        cell.discriptionLabel.text = "Rainbow Bar & Grill & Federal Bar"
        cell.placeNameLabel.text = "Night club/ bar/ Hotel"
        cell.floatRatingView.emptyImage = UIImage(named: "star_view_b_white")
        cell.floatRatingView.fullImage = UIImage(named: "star_view_a")
        cell.floatRatingView.rating = 3.5
        cell.floatRatingView.editable = false
        cell.floatRatingView.halfRatings = true
        cell.floatRatingView.floatRatings = false
        cell.friendsJoyLabel.layer.borderColor =  Global.hexStringToUIColor(GlobalConstant.kkTagBorderColor).cgColor
        cell.myPubLabel.layer.borderColor =  Global.hexStringToUIColor(GlobalConstant.kkTagBorderColor).cgColor
        cell.beerSectionLabel.layer.borderColor =  Global.hexStringToUIColor(GlobalConstant.kkTagBorderColor).cgColor
        cell.addTagButton.layer.borderColor =  Global.hexStringToUIColor(GlobalConstant.kkTopBarColor).cgColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
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
