//
//  Constant.swift
//  Citimate
//  Created by Hitaishin on 05/08/16.
//  Copyright © 2016 Harish Patel. All rights reserved.
//

import UIKit

struct GlobalConstant
{
    // MARK: -  APP Name and Url
    
    static let APP_NAME = "Citimate"
        static let Default_URL          = "http://192.168.2.199/travelouder/app/"
    //    static let Default_URL          = "http://travelouder.technopium.com/app/"
    
    // API Key
    static let APIKey = "OvfK6C4nX2BG4EGFcpdEdgbbFq7uOIct"
    
    // Color constant
    static let kkTopBarColor = "#ffa900"
    static let kkGrayColor = "#7f7f7f"
    static let kkTagBorderColor = "#D0CED6"
    static let kkBackgroundColor = "#EFEEF4"
    
    // MARK: -  COLOR CONSTANT
    static let kColor_Seperator: UIColor = UIColor(red: 53.0/255.0, green: 126.0/255.0, blue: 167.0/255.0, alpha: 1.0)
    static let kColor_orange: UIColor = UIColor(red: 255.0/255.0, green: 147.0/255.0, blue: 38.0/255.0, alpha: 1.0)
    static let kColor_NonCompliant: UIColor = UIColor(red: 190.0/255.0, green: 15.0/255.0, blue: 52.0/255.0, alpha: 1.0)
    
    // MARK: - Screen Size
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(GlobalConstant.SCREEN_WIDTH, GlobalConstant.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(GlobalConstant.SCREEN_WIDTH, GlobalConstant.SCREEN_HEIGHT)
    
    // MARK: - Device IPHONE
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && GlobalConstant.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && GlobalConstant.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && GlobalConstant.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && GlobalConstant.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && GlobalConstant.SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_PRO          = UIDevice.current.userInterfaceIdiom == .pad && GlobalConstant.SCREEN_MAX_LENGTH == 1366.0
    
    // MARK: - Device Version
    
    static let SYS_VERSION_FLOAT = (UIDevice.current.systemVersion as NSString).floatValue
    static let iOS7 = (GlobalConstant.SYS_VERSION_FLOAT < 8.0 && GlobalConstant.SYS_VERSION_FLOAT >= 7.0)
    static let iOS8 = (GlobalConstant.SYS_VERSION_FLOAT >= 8.0 && GlobalConstant.SYS_VERSION_FLOAT < 9.0)
    static let iOS9 = (GlobalConstant.SYS_VERSION_FLOAT >= 9.0 && GlobalConstant.SYS_VERSION_FLOAT < 10.0)
    
    // MARK: -   Constant Variable.
    static let kBirthDate                     =    "DateOfBirth"
    static let kFirstName                     =    "FirstName"
    static let kLastName                      =    "LastName"
    
    static let kEnterLocation       = 0
    static let kUserLocation        = 1
    static let kCancel              = 2
    static let kGallery             = 0
    static let kCamera              = 1
    
    static let kkIsLogin            = "isLogin"
    
    // Property 
    static var loginStepsStatus:Int = 0
    static var isBackFromViewProfile:Bool = false

    static var selectedAlbum: NSDictionary = NSDictionary()

    // MARK: -   Segue Identifier Name
    // Segue Identifers
    
    /// Others
    static let kkSegueLoginToSignup                             = "loginToSignup"
    static let kkSegueLoginToForgotPassword                     = "loginToForgotPassword"
    static let kkSegueSignupToTermsCondition                    = "signupToTermsAndConditions"
    static let kkSegueIntoductionScreenToLogin                  = "intoductionScreenToLogin"
    static let kkSegueLoginToHome                               = "loginToHome"
    static let kkSegueSignUpToHome                              = "signupToHome"
    static let kkSegueMoreToChangePassword                      = "moreToChangePassword"
    static let kkSegueHomeToSelectLocation                      = "homeToSelectLocation"
    static let kkSegueMoretoAboutUs                             = "moreToAboutUs"
    static let kkSegueMoreToTermsAndConditions                  = "moreToTermsAndConditions"
    static let kkSegueMoreToContactUs                           = "moreToContactUs"
    static let kkSegueMoreToFAQ                                 = "moreToFAQ"
    static let kkSegueListToDetailView                          = "listToDetailView"
    static let kkSegueHomeToList                                = "homeToList"
    static let kkSegueDetailsToReview                           = "detailsToReview"
    static let kkSegueProfileToEditProfileView                  = "ProfileToEditProfileView"
    static let kkSegueSavedToSavedList                          = "SavedToSavedList"
    static let kkSegueSavedViewToAddTagView                     = "SavedViewToAddTagView"
    static let kkSegueSavedListToAddPlace                       = "savedListToAddPlace"
    static let kkSegueDetailToChatView                          = "DetailToChatView"
    static let kkSegueFollowingToUserProfile                    = "followingToUserProfile"
    static let kkSegueHomeToNotification                        = "homeToNotification"
    static let kkSegueSavedToNotification                       = "savedToNotification"
    static let kkSegueFollowingToNotification                   = "followingToNotification"
    static let kkSegueMoreToNotification                        = "moreToNotification"
    static let kkSegueMemberListToChat                          = "memberListToChat"
    

    
    // MARK: -    Constant Message For Project
    // Code for internal server
    
    static let InternalServerErrorMessage  = "Internal Server Error occurred!"
    static let NORMAL  = "normal"
    static let FACEBOOK  = "facebook"
    
    //// Local Notifcation
    static let kNotificationGetBackgroundNotificationForCheckUser   = "BackgroundNotificationForCheckUser"
    static let kNotificationReloadUserProfile                       = "reloadUserProfile"
    
    
    //All Proprety colours
    static var kkBule40 = "#0091EA"
    static var kkBlue30 = "#00AFFF"
    
}

