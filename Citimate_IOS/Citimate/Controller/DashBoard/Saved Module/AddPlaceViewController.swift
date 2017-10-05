//
//  AddPlaceViewController.swift
//  Citimate
//
//  Created by Hitaishin on 10/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class AddPlaceViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    /// IBOutlets
    @IBOutlet weak var addPlaceTableView: UITableView!
    
    var arrayUserNameList = ["Rainbow Bar & Grill","The Federal Bar","The Federal Bar","Jinya Ramen Bar","Chateau Marmont Restaurant","Rainbow Bar & Grill","Absinthe Brasserie & Bar"]
    
    var arrayDescriptionList = ["9015 Sunset Blvd, 62, NCM Market near of iBelcx Hotel, West Hollywood, CA 90069, USA","9015 Sunset Blvd, 62, NCM Market near of iBelcx Hotel, West Hollywood, CA 90069, USA","9015 Sunset Blvd, 62, NCM Market near of iBelcx Hotel, West Hollywood, CA 90069, USA","9015 Sunset Blvd, 62, NCM Market near of iBelcx Hotel, West Hollywood, CA 90069, USA","9015 Sunset Blvd, 62, NCM Market near of iBelcx Hotel, West Hollywood, CA 90069, USA","9015 Sunset Blvd, 62, NCM Market near of iBelcx Hotel, West Hollywood, CA 90069, USA","9015 Sunset Blvd, 62, NCM Market near of iBelcx Hotel, West Hollywood, CA 90069, USA"]
    
    var arrayPlacesImage = ["img_a", "img_b", "img_c", "img_d", "img_e", "img_b", "img_c", "img_a"]

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Global.backButton(self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- TableView Delegate and DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUserNameList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell :FollowerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "addPlaceCell", for: indexPath) as! FollowerTableViewCell
        cell.descriptionLabel.text = arrayDescriptionList[indexPath.row]
        cell.userNameLabel.text = arrayUserNameList[indexPath.row]
        cell.ProfileImage.image = UIImage(named : arrayPlacesImage[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
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
