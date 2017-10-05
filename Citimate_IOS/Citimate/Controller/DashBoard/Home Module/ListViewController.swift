//
//  ListViewController.swift
//  Citimate
//
//  Created by Hitaishin on 07/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var listGridButton: UIButton!
    @IBOutlet weak var searchTextFeild: UITextField!
    
    var isListSelected: Bool = false
    var arrayPlacesName = ["Connolly's Pub & Restaurant", "The Playright Irish Pub", "Newyork Public Library", "Public House", "Connolly's Pub & Restaurant", "The Playright Irish Pub", "Newyork Public Library", "Public House"]
    var arrayPlacesTags = ["Night Club/ Bar/ Hotel", "Night Club/ Bar/ Hotel/ Karaoke Bar/ Pub", "Night Club/ Bar/ Hotel", "Night Club/ Bar/ Hotel", "Night Club/ Bar/ Hotel", "Night Club/ Bar/ Hotel/ Karaoke Bar/ Pub", "Night Club/ Bar/ Hotel", "Night Club/ Bar/ Hotel"]
    var arrayPlacesRating = ["4.5", "3.5", "3", "4", "4.5", "3.5", "3", "4"]
    var arrayPlacesImage = ["img_a", "img_b", "img_c", "img_d", "img_e", "img_b", "img_c", "img_a"]
    
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
    
    //MARK:- Action Methods
    
    @IBAction func listGridButtonTap(_ sender: Any) {
        if isListSelected
        {
            isListSelected = false
            listGridButton.setImage(UIImage(named:"ic_grid_view"), for: .normal)
        }
        else
        {
            isListSelected = true
            listGridButton.setImage(UIImage(named:"ic_list_view"), for: .normal)
        }
        self.collectionView.reloadData()
    }
    
    //MARK:- Collection View Delegate And DataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return arrayPlacesName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell : ListCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "listCell", for: indexPath as IndexPath) as! ListCollectionViewCell
        
        if isListSelected
        {
            cell.shadowImage.image = UIImage(named: "shadow_grid")
            cell.backgroundImage.image = UIImage(named: "frame_grid")
            cell.placeImageViewWidth.constant = GlobalConstant.SCREEN_WIDTH / 2.0 - 10
        }
        else
        {
            cell.shadowImage.image = UIImage(named: "shadow_list")
            cell.backgroundImage.image = UIImage(named: "frame_list")
            cell.placeImageViewWidth.constant = GlobalConstant.SCREEN_WIDTH
        }
        
        cell.locationNameLabel.text = arrayPlacesName[indexPath.item]
        cell.tagLabel.text = arrayPlacesTags[indexPath.item]
        cell.placeImageView.image = UIImage(named: arrayPlacesImage[indexPath.item])
        
        //Ratings(required float rating params)
        cell.floatRatingView.emptyImage = UIImage(named: "star_view_b_white")
        cell.floatRatingView.fullImage = UIImage(named: "star_view_a")
        cell.floatRatingView.rating = Float(arrayPlacesRating[indexPath.item])!
        cell.floatRatingView.editable = false
        cell.floatRatingView.halfRatings = true
        cell.floatRatingView.floatRatings = false
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: GlobalConstant.kkSegueListToDetailView, sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var collectionViewSize = collectionView.frame.size
        
        if isListSelected
        {
            collectionViewSize.width = collectionViewSize.width / 2.0
            collectionViewSize.height = 202
        }
        else
        {
            collectionViewSize.width = collectionViewSize.width / 1.0
            collectionViewSize.height = 202
        }
        return collectionViewSize
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
