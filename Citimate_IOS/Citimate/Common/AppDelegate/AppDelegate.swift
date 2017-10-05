//
//  AppDelegate.swift
//  Citimate
//  Created by Hitaishin on 02/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // window outlets
    var window: UIWindow?
    
    // MARK: - Window life cycles
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // IQKeyboard Manager
        IQKeyboardManager.sharedManager().enable = true
        
        // Set the Navigation bar colors and fonts
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().barTintColor = Global.hexStringToUIColor("#ffa900")
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        // Set the Tab Bar tint color
        UITabBar.appearance().tintColor = UIColor(red: 0/255.0, green: 191/255.0, blue: 254/255.0, alpha: 1.0)
        
        // create viewController code...
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Frist Launch of App check the NSUserDefault
        let isFirstLaunch = UserDefaults.standard.string(forKey: GlobalConstant.kkIsLogin) == nil
        if (isFirstLaunch)
        {
            UserDefaults.standard.set("00", forKey: GlobalConstant.kkIsLogin)
            UserDefaults.standard.synchronize()
        }
        
        //Auto Login
        if UserDefaults.standard.value(forKey: GlobalConstant.kkIsLogin) as! String == "1"
        {
            let nav = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as! UITabBarController
            let navigationController :UINavigationController = UINavigationController(rootViewController: nav)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = navigationController
        }
        else if UserDefaults.standard.value(forKey: GlobalConstant.kkIsLogin) as! String == "00"
        {
            UserDefaults.standard.set("0", forKey: GlobalConstant.kkIsLogin)
            UserDefaults.standard.synchronize()
            let introductionViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let introNVC: UINavigationController = UINavigationController(rootViewController: introductionViewController)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = introNVC
        }
        else
        {
            let nav = storyboard.instantiateViewController(withIdentifier: "LoginNavigationController") as! UINavigationController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = nav
        }
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        FBSDKAppEvents.activateApp()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //MARK:- Open URL Methods
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool
    {
        return FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String!, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
    }
    
    //// For iOS 8 and earlier
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }

}

