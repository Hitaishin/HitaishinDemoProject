//
//  DetailViewController.swift
//  Citimate
//
//  Created by Hitaishin on 07/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController, MKMapViewDelegate, UITextViewDelegate {
    
    //Outlets
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var placeRatingView: FloatRatingView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeTagLabel: UILabel!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var writeReviewButton: UIButton!
    @IBOutlet weak var clockImageView: UIImageView!
    @IBOutlet weak var currentDayLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var timeScheduleButton: UIButton!
    @IBOutlet weak var placeAddressLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var writeReviewView: UIView!
    @IBOutlet weak var writeReviewTextView: UITextView!
    @IBOutlet weak var givenRatingView: FloatRatingView!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Hide Blur View and WriteReviewView
        blurView.isHidden = true
        writeReviewView.isHidden = true
        writeReviewTextView.layer.borderColor = Global.hexStringToUIColor("C5C5C5").cgColor
        writeReviewTextView.delegate = self
        writeReviewTextView.text = "Write Comments"
        writeReviewTextView.textColor = UIColor.lightGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Global.backButton(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            textView.text = "Write Comments"
            textView.textColor = UIColor.lightGray
        }
    }
    
    // MARK: - Action Methods
    
    @IBAction func callButtonTap(sender: AnyObject)
    {
        
    }
    
    @IBAction func locationButtonTap(sender: AnyObject)
    {
        
    }
    
    @IBAction func saveButtonTap(sender: AnyObject)
    {
        
    }
    
    @IBAction func chatButtonTap(sender: AnyObject)
    {
        self.performSegue(withIdentifier: GlobalConstant.kkSegueDetailToChatView, sender: self)
    }
    
    @IBAction func writeReviewButtonTap(sender: AnyObject)
    {
        blurView.isHidden = false
        writeReviewView.isHidden = false
    }
    
    @IBAction func viewReviewButtonTap(sender: AnyObject)
    {
        self.performSegue(withIdentifier: GlobalConstant.kkSegueDetailsToReview, sender: self)
    }
    
    @IBAction func popupCloseButtonTap(sender: AnyObject)
    {
        blurView.isHidden = true
        writeReviewView.isHidden = true
        self.view.resignFirstResponder()
    }
    
    @IBAction func postReviewButtonTap(sender: AnyObject)
    {
        self.view.resignFirstResponder()
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
