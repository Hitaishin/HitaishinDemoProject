//
//  SelectLocationViewController.swift
//  Citimate
//
//  Created by Hitaishin on 04/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

protocol SelectLocationViewControllerDelegate
{
    func selectLocationViewControllerResponse(location: String)
}

class SelectLocationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // IBOutlets
    @IBOutlet weak var locationTableView: UITableView!
    
    var locationArray = ["New York", "Miami", "Los Angeles", "California", "San Francisco", "New York", "Miami", "Los Angeles", "California", "San Francisco"]
    
    var delegate: SelectLocationViewControllerDelegate?

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
        return locationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell") as! LocationTableViewCell
        
        cell.locationLabel.text = locationArray[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.navigationController!.popViewController(animated: true)
        self.delegate?.selectLocationViewControllerResponse(location: locationArray[indexPath.row])
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
