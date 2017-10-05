//
//  HomeViewController.swift
//  Citimate
//
//  Created by Hitaishin on 03/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, SelectLocationViewControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // IBOutlets
    @IBOutlet weak var selectLocationButton: UIButton!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var delegate: SelectLocationViewControllerDelegate?
    var arrayCategoryName = ["Bar", "Lounge", "Restaurant", "Night Club", "Bar", "Lounge", "Restaurant", "Night Club", "Bar", "Lounge", "Restaurant", "Night Club", "Bar", "Lounge", "Restaurant", "Night Club", "Bar", "Lounge", "Restaurant", "Night Club"]
    var arrayCategoryImage = ["box_white_bar", "box_white_beergardom", "box_white_hotel", "box_white_pub", "box_white_bar", "box_white_beergardom", "box_white_hotel", "box_white_pub", "box_white_bar", "box_white_beergardom", "box_white_hotel", "box_white_pub", "box_white_bar", "box_white_beergardom", "box_white_hotel", "box_white_pub", "box_white_bar", "box_white_beergardom", "box_white_hotel", "box_white_pub"]
    var arraySelectedCategoryImage = ["box_blue_bar", "box_blue_beergardom", "box_blue_hotel", "box_blue_pub", "box_blue_bar", "box_blue_beergardom", "box_blue_hotel", "box_blue_pub", "box_blue_bar", "box_blue_beergardom", "box_blue_hotel", "box_blue_pub", "box_blue_bar", "box_blue_beergardom", "box_blue_hotel", "box_blue_pub", "box_blue_bar", "box_blue_beergardom", "box_blue_hotel", "box_blue_pub"]
    
    var selectedCategoryArray: NSMutableArray = NSMutableArray()

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNotificationButton()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        selectedCategoryArray.removeAllObjects()
        categoryCollectionView.reloadData()
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
        self.performSegue(withIdentifier: GlobalConstant.kkSegueHomeToNotification, sender: self)
    }
    
    // Define Delegate Method for Filter
    func selectLocationViewControllerResponse(location: String) {
        selectLocationButton.setTitle(location, for: .normal)
    }
    
    //MARK:- Collection View Delegate And DataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return arrayCategoryName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell : HomeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath as IndexPath) as! HomeCollectionViewCell
        
        cell.categoryImage.image = UIImage(named: arrayCategoryImage[indexPath.item])
        cell.categoryTitle.text = arrayCategoryName[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! HomeCollectionViewCell
        if selectedCategoryArray.contains(indexPath.item)
        {
            selectedCategoryArray.remove(indexPath.item)
            cell.categoryImage.image = UIImage(named: arrayCategoryImage[indexPath.item])
        }
        else
        {
            selectedCategoryArray.add(indexPath.item)
            cell.categoryImage.image = UIImage(named: arraySelectedCategoryImage[indexPath.item])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var collectionViewSize = collectionView.frame.size
        
        collectionViewSize.width = collectionViewSize.width / 5.0
        collectionViewSize.height = collectionViewSize.width + 25
        
        return collectionViewSize
    }

    // MARK: Action Methods
    
    @IBAction func selectLocationTap(sender: AnyObject)
    {
        self.performSegue(withIdentifier: GlobalConstant.kkSegueHomeToSelectLocation, sender: self)
    }
    
    @IBAction func findButtonTap(sender: AnyObject)
    {
        self.performSegue(withIdentifier: GlobalConstant.kkSegueHomeToList, sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == GlobalConstant.kkSegueHomeToSelectLocation
        {
            let destinationViewController = segue.destination as! SelectLocationViewController
            destinationViewController.delegate = self
        }
    }
    

}
