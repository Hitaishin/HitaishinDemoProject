//
//  ViewController.swift
//  Citimate
//
//  Created by Hitaishin on 02/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // create swipe gesture
    let swipeGestureLeft = UISwipeGestureRecognizer()
    let swipeGestureRight = UISwipeGestureRecognizer()
    
    // outlet - page control
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set gesture direction
        self.swipeGestureLeft.direction = UISwipeGestureRecognizerDirection.left
        self.swipeGestureRight.direction = UISwipeGestureRecognizerDirection.right
        
        // add gesture target
        self.swipeGestureLeft.addTarget(self, action: #selector(ViewController.handleSwipeLeft(_:)))
        self.swipeGestureRight.addTarget(self, action: #selector(ViewController.handleSwipeRight(_:)))
        
        // add gesture in to view
        self.view.addGestureRecognizer(self.swipeGestureLeft)
        self.view.addGestureRecognizer(self.swipeGestureRight)
        
        // set current page number label.
        self.setCurrentPageLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Utility function
    
    // increase page number on swift left
    func handleSwipeLeft(_ gesture: UISwipeGestureRecognizer){
        if self.pageControl.currentPage < 3 {
            self.pageControl.currentPage += 1
            self.setCurrentPageLabel()
        }
    }
    
    // reduce page number on swift right
    func handleSwipeRight(_ gesture: UISwipeGestureRecognizer){
        
        if self.pageControl.currentPage != 0 {
            self.pageControl.currentPage -= 1
            self.setCurrentPageLabel()
        }
    }
    
    // set current page number label
    fileprivate func setCurrentPageLabel(){
        //        self.currentPageLabel.text = "\(self.myPageControl.currentPage + 1)"
        
        if (self.pageControl.currentPage == 0)
        {
            self.view.backgroundColor = Global.hexStringToUIColor("#00bffe")
            self.nextButton.setImage(UIImage(named: "ic_next_slide"), for: UIControlState.normal)
            self.nextButton.setTitle(nil, for: UIControlState.normal)
            self.skipButton.isHidden = false
        }
        else if (self.pageControl.currentPage == 1)
        {
            self.view.backgroundColor = Global.hexStringToUIColor("#ffa900")
            self.nextButton.setImage(UIImage(named: "ic_next_slide"), for: UIControlState.normal)
            self.nextButton.setTitle(nil, for: UIControlState.normal)
            self.skipButton.isHidden = false
        }
        else if (self.pageControl.currentPage == 2)
        {
            self.view.backgroundColor = Global.hexStringToUIColor("#00bffe")
            self.nextButton.setImage(UIImage(named: "ic_next_slide"), for: UIControlState.normal)
            self.nextButton.setTitle(nil, for: UIControlState.normal)
            self.skipButton.isHidden = false
        }
        else if (self.pageControl.currentPage == 3)
        {
            self.view.backgroundColor = Global.hexStringToUIColor("#ffa900")
            self.nextButton.setImage(nil, for: UIControlState.normal)
            self.nextButton.setTitle("GOT IT", for: UIControlState.normal)
            self.skipButton.isHidden = true
        }
    }
    
    //MARK: Action Methods
    
    @IBAction func skipButtonTap(sender: AnyObject)
    {
        self.performSegue(withIdentifier: GlobalConstant.kkSegueIntoductionScreenToLogin, sender: self)
    }
    
    @IBAction func nextButtonTap(sender: AnyObject)
    {
        if self.pageControl.currentPage < 3 {
            self.pageControl.currentPage += 1
            self.setCurrentPageLabel()
        }
        else
        {
            self.performSegue(withIdentifier: GlobalConstant.kkSegueIntoductionScreenToLogin, sender: self)
        }
    }
}

