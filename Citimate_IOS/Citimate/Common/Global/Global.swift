//
//  Global.swift
//  My
//  Created by Hitaishin on 13/06/16.
//  Copyright © 2016 Hitaishin. All rights reserved.
//
import UIKit
import SystemConfiguration
import MBProgressHUD

var viewControllerInstance : AnyObject!
var badgeCartViewController : AnyObject!
//var indicator: MaterialActivityIndicatorView!


class Global: NSObject {

    class var sharedInstance: Global {
        struct Static {
            static let instance: Global = Global()
        }
        return Static.instance
    }
    
    //MARK: - Cornor Radius Methods

    static func roundRadius(_ imageView: UIImageView)
    {
        imageView.layer.cornerRadius = (imageView.frame.size.height / 2 + imageView.frame.size.width / 2) / 2
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
    }
    
    static func labelRoundRadius(_ labelView: UILabel)
    {
        labelView.layer.cornerRadius = (labelView.frame.size.height / 2 + labelView.frame.size.width / 2) / 2
        labelView.layer.masksToBounds = true
        labelView.clipsToBounds = true
    }
    
    static func buttonCornerRadius(_ sender: AnyObject)
    {
        let btn: UIButton = (sender as! UIButton)
        btn.layer.cornerRadius = 5
        // this value vary as per your desire
        btn.clipsToBounds = true
    }
    
    static func viewCornerRadius(_ view: UIView) {
        view.layer.cornerRadius = 5
        // this value vary as per your desire
        view.clipsToBounds = true
    }
    class func showGlobalProgressHUD(withTitle title: String) -> MBProgressHUD {
        let window: UIWindow? = UIApplication.shared.windows.last
        MBProgressHUD.hide(for: window!, animated: true)
        let hud = MBProgressHUD.showAdded(to: window!, animated: true)
        hud.mode = .indeterminate
        hud.backgroundView.color = UIColor(white: 0, alpha: 0.3)
        hud.backgroundView.style = MBProgressHUDBackgroundStyle.solidColor
        
        hud.layer.shadowColor = UIColor.black.cgColor
        hud.layer.shadowOpacity = 0.8
        hud.layer.shadowRadius = 5
        hud.layer.masksToBounds = false
        hud.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        hud.label.text = title
        return hud
    }
    
    class func dismissGlobalHUD() {
        let window: UIWindow? = UIApplication.shared.windows.last
        MBProgressHUD.hide(for: window!, animated: true)
    }

    // MARK: - Creates a UIColor from a Hex string.
    
    static func hexStringToUIColor (_ hex:String) -> UIColor
    {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    //MARK: - Global alert Methods
    
    static func showAlertMessageWithOkButtonAndTitle(_ strTitle: String, andMessage strMessage: String)
    {
        if objc_getClass("UIAlertController") == nil
        {
            let alert: UIAlertView = UIAlertView(title: strTitle, message: strMessage, delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: "")
            alert.show()
        }
        else
        {
            let alertController: UIAlertController = UIAlertController(title:strTitle, message: strMessage, preferredStyle: UIAlertControllerStyle.alert)
            let ok: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(ok)
            
            let topWindow: UIWindow = UIWindow(frame: UIScreen.main.bounds)
            topWindow.rootViewController = UIViewController()
            topWindow.windowLevel = UIWindowLevelAlert + 1
            topWindow.makeKeyAndVisible()
            topWindow.rootViewController!.present(alertController, animated: true, completion: { _ in })
        }
    }
    
    //MARK: - Date and Time Methods

    // Function to get current date time of iphone
    static func getCurrentDateTime() -> String
    {
        let date: Date = Date()
        let calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)       
        let unitFlags: NSCalendar.Unit = [.year, .month, .weekday, .day, .hour, .minute, .second]
        let dateComponents: DateComponents = (calendar as NSCalendar).components(unitFlags, from: date)
        let year: Int = dateComponents.year!
        let month: Int = dateComponents.month!
        let day: Int = dateComponents.day!
        let hour: Int = dateComponents.hour!
        let minute: Int = dateComponents.minute!
        let second: Int = dateComponents.second!
        let currentDateTime: String = "\(Int(year))-\(Int(month))-\(Int(day)) \(Int(hour)):\(Int(minute)):\(Int(second))"
        return currentDateTime
    }
    
    static func stringFromNSDate(_ date: Date, dateFormate: String) -> String
    {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.full
        dateFormatter.dateFormat = dateFormate
        let formattedDate: String = dateFormatter.string(from: date)
        return formattedDate
        
    }
    
    static func nsdateFromString(_ dateString: String, dateFormate: String) -> Date {
        var date: Date? = nil
        if Global.stringExists(dateString)
        {
            //date formatter for the above string
            let dateFormatterWS: DateFormatter = DateFormatter()
            dateFormatterWS.dateFormat = dateFormate
            date = dateFormatterWS.date(from: dateString)
            //NSLog(@"Date %@",date);
            return date!
        }
        let returnObject: Date?  = nil
        return returnObject!
    }
    
    // converts date format from source to target format
    static func convertDateFormat(_ dateString: String, sourceFormate: String, targetFormate: String) -> String
    {
        if Global.stringExists(dateString)
        {
            //date formatter for the above string
            let dateFormatterWS: DateFormatter = DateFormatter()
            dateFormatterWS.dateFormat = sourceFormate
            let date: Date = dateFormatterWS.date(from: dateString)!
            //date formatter that you want
            let dateFormatterNew: DateFormatter = DateFormatter()
            dateFormatterNew.dateFormat = targetFormate
            let stringForNewDate: String = dateFormatterNew.string(from: date)
            //NSLog(@"Date %@",stringForNewDate);
            return stringForNewDate
        }
        let returnObject: String?  = nil
        return returnObject!
    }
    

    //Time zone methods
    ////////******** ///////////////////
    
    //   var badgeCartViewController: AnyObject
    //   var viewControllerInstance : AnyObject
    
    static func timezoneStringFromTimezone(_ timeZone: TimeZone) -> String {
        let seconds: Int = timeZone.secondsFromGMT()
        NSLog("TZ : %@ : Seconds %ld", timeZone.abbreviation()!, Int(seconds))
        let h: Int = Int(seconds) / 3600
        let m: Int = Int(seconds) / 60 % 60
        var strGMT: String = ""
        if h >= 0 {
            strGMT = String(format: "+%02d:%02d", h, m)
        }
        else {
            strGMT = String(format: "%03d:%02d", h, m)
        }
        var stringGMT: String = "GMT "
        stringGMT = stringGMT + strGMT
        return stringGMT
    }
    
    //MARK: - Start date and End Date Validation

    static func isEndDateIsSmallerThanStartDate(_ checkEndDate: Date, StartDate startDate: Date) -> Bool {
        let enddate: Date = checkEndDate
        let distanceBetweenDates: TimeInterval = enddate.timeIntervalSince(startDate)
        let secondsInMinute: Double = 60
        let secondsBetweenDates: Double = distanceBetweenDates / secondsInMinute
        if secondsBetweenDates == 0 {
            return true
        }
        else if secondsBetweenDates < 0 {
            return true
        }
        else {
            return false
        }
    }
    
    static func isEndDateIsSmallerThanCurrent(_ checkEndDate: String) -> Bool {
        //  NSString *s=@"2015-08-12";
        let dateFormat: DateFormatter = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        let enddate: Date = dateFormat.date(from: checkEndDate)!
        let myString: String = dateFormat.string(from: Date())
        let currentdate: Date = dateFormat.date(from: myString)!
        switch currentdate.compare(enddate) {
        case ComparisonResult.orderedAscending:
            return true
        case ComparisonResult.orderedSame:
            return true
        case ComparisonResult.orderedDescending:
            return false
        }
    }
    
    //MARK: - User Data form NSUserDefaults

    
    //////////******** ///////////////////
    // Get the User Data form NSUserDefaults
    // Get the user Id
    static func getUserId() -> String {
        let user_id = UserDefaults.standard.string(forKey: "user_id")
        return user_id!
    }
    
    //MARK: - Common Back Button Methods

    //////////******** ///////////////////
    //Common Back Button for all Views
    
    class func backButtonClose(_ sender: UIViewController)
    {
        viewControllerInstance = sender
        let backBtn: UIButton = UIButton(type: .custom)
        backBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let backBtnImage: UIImage = UIImage(named: "ic_exit")!
        backBtn.setImage(backBtnImage, for: UIControlState())
        backBtn.addTarget(self, action: #selector(Global.goback), for: UIControlEvents.touchUpInside)
        
        let backButton: UIBarButtonItem = UIBarButtonItem(customView: backBtn)
        ((viewControllerInstance as! UIViewController)).navigationItem.leftBarButtonItem = backButton
    }
    
    class func backButton(_ sender: UIViewController)
    {
        viewControllerInstance = sender
        let backBtn: UIButton = UIButton(type: .custom)
        backBtn.frame = CGRect(x: 0, y: 0, width: 25, height: 20)
        let backBtnImage: UIImage = UIImage(named: "ic_back")!
        backBtn.setImage(backBtnImage, for: UIControlState())
        backBtn.addTarget(self, action: #selector(Global.goback), for: UIControlEvents.touchUpInside)
        
        let backButton: UIBarButtonItem = UIBarButtonItem(customView: backBtn)
        ((viewControllerInstance as! UIViewController)).navigationItem.leftBarButtonItem = backButton
     }
     
     class func goback() {
        ((viewControllerInstance as! UIViewController)).navigationController!.popViewController(animated: true)
     }
    
    //MARK: - Navigation Title Methods

    static func customNavigationWithTitle(_ title: String) -> UILabel {
        let frame: CGRect = CGRect(x: 0, y: 0, width: 100, height: 44)
        let label: UILabel = UILabel(frame: frame)
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Roboto", size: 16.0)
        label.textAlignment = .center
        //    label.textColor = Global.colorFromHexString("#ffffff")
        label.text = title
        return label
    }
    
    //MARK: - Get Url Methods

    //Get Url from String type parameter
    static func getURLFromString(_ str: String) -> String {
        let urlStr: String = str.replacingOccurrences(of: " ", with: "%20")
        return urlStr
    }
    
    //MARK: - Image Scalling Methods
    
    static func imageWithImage(_ image: UIImage, scaledToSize newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    //MARK: - Change font of View Methods
    /// functions to set fonts
    
    static func setLabelHelveticaNeueLTComFont(_ label: UILabel) {
        label.font = UIFont(name: "MyriadPro-Semibold", size: label.font.pointSize)
    }
    
    static func setLabelMyriadProRegularFont(_ label: UILabel) {
        label.font = UIFont(name: "MyriadPro-Semibold", size: label.font.pointSize)
    }
    
    static func setLabelMyriadProCondFont(_ label: UILabel) {
        label.font = UIFont(name: "MyriadPro-Semibold", size: label.font.pointSize)
    }
    
    static func setTextFieldMyriadProRegularFont(_ textField: UITextField) {
        textField.font = UIFont(name: "MyriadPro-Semibold", size: textField.font!.pointSize)
    }
    
    static func setTextFieldHelveticaNeueLTComFont(_ textField: UITextField) {
        textField.font = UIFont(name: "MyriadPro-Semibold", size: textField.font!.pointSize)
    }
    
    // setting fonts in all views and their subviews in a viewcontroller
    
    static func setFontRecursively(_ view: UIView) {
        if (view is UILabel) {
            let label: UILabel = (view as! UILabel)
            Global.setLabelMyriadProRegularFont(label)
        }
        else if (view is UITextField)
        {
            let textField: UITextField = (view as! UITextField)
            Global.setTextFieldMyriadProRegularFont(textField)
            textField.borderStyle = .none
            textField.textColor = UIColor.black
        }
        else if (view is UITextView) {
            let textView: UITextView = (view as! UITextView)
            textView.font = UIFont(name: "MyriadPro-Semibold", size: textView.font!.pointSize)
            textView.textColor = UIColor.black
        }
        else if (view is UIButton) {
            let button: UIButton = (view as! UIButton)
            button.titleLabel!.font = UIFont(name: "MyriadPro-Semibold", size: button.titleLabel!.font.pointSize)
        }
        else {
            for subView: UIView in view.subviews {
                Global.setFontRecursively(subView)
            }
        }
    }
    
    // MARK: - Image Compression Method
    
    func compressImage(_ image:UIImage) -> NSData {
        // Reducing file size to a 10th
        
        var actualHeight : CGFloat = image.size.height
        var actualWidth : CGFloat = image.size.width
        let maxHeight : CGFloat = 1136.0
        let maxWidth : CGFloat = 640.0
        var imgRatio : CGFloat = actualWidth/actualHeight
        let maxRatio : CGFloat = maxWidth/maxHeight
        var compressionQuality : CGFloat = 0.5
        
        if (actualHeight > maxHeight || actualWidth > maxWidth){
            if(imgRatio < maxRatio){
                //adjust width according to maxHeight
                imgRatio = maxHeight / actualHeight;
                actualWidth = imgRatio * actualWidth;
                actualHeight = maxHeight;
            }
            else if(imgRatio > maxRatio){
                //adjust height according to maxWidth
                imgRatio = maxWidth / actualWidth;
                actualHeight = imgRatio * actualHeight;
                actualWidth = maxWidth;
            }
            else{
                actualHeight = maxHeight;
                actualWidth = maxWidth;
                compressionQuality = 1;
            }
        }
//        let rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
        let rect = CGRect(x: CGFloat(0.0), y: CGFloat(0.0), width: CGFloat(actualWidth), height: CGFloat(actualHeight))
        UIGraphicsBeginImageContext(rect.size);
        image.draw(in: rect)
        let img = UIGraphicsGetImageFromCurrentImageContext();
        let imageData = UIImageJPEGRepresentation(img!, compressionQuality);
        UIGraphicsEndImageContext();
        
        return imageData! as NSData;
    }
    
    //MARK: - String Methods
    
    /// Trim for String
    static func Trim(_ value: String) -> String {
        let value = value.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return value
    }
    
    // checks whether string value exists or it contains null or null in string
    static func stringExists(_ str: String) -> Bool {
        var strString : String? = str
        
        if strString == nil {
            return false
        }
        
        if strString == String(describing: NSNull()) {
            return false
        }
        if (strString == "<null>") {
            return false
        }
        if (strString == "(null)") {
            return false
        }
        strString = Global.Trim(str)
        if (str == "") {
            return false
        }
        if strString?.characters.count == 0 {
            return false
        }
        return true
    }
    
    // returns string value after removing null and unwanted characters
    
    static func getStringValue(_ str: AnyObject) -> String {
        if str is NSNull {
            return ""
        }
        else{
            var strString : String? = str as? String
            if Global.stringExists(strString!) {
                strString = strString!.replacingOccurrences(of: "\t", with: " ")
                strString = Global.Trim(strString!)
                if (strString == "{}") {
                    strString = ""
                }
                if (strString == "()") {
                    strString = ""
                }
                if (strString == "null") {
                    strString = ""
                }
                return strString!
            }
            return ""
        }
    }
    
    
    //MARK: - Shopping Cart Methods
     class func setAddToCardWithBadge(_ sender: UIViewController)
     {
        /*
        badgeCartViewController=sender;

        //Property
        var cartBarbuttonItem:MIBadgeButton?

        cartBarbuttonItem = MIBadgeButton(frame: CGRectMake(0, 0, 32, 32))
        cartBarbuttonItem?.initWithFrame(frame: CGRectMake(0, 0, 32, 32), withBadgeString: "0", withBadgeInsets:  UIEdgeInsetsMake(10, 10, 0, 15))
        cartBarbuttonItem?.setImage(UIImage(named: "ic_notification"), forState: .Normal)
        cartBarbuttonItem!.addTarget(self, action: #selector(Global.shoppingCartClick), forControlEvents: .TouchUpInside)
        if NSUserDefaults.standardUserDefaults().integerForKey("badgeCount") > 0
        {
            cartBarbuttonItem?.badgeString = NSUserDefaults.standardUserDefaults().valueForKey("badgeCount") as? String
        }
        else
        {
            cartBarbuttonItem?.badgeString = "0"
        }
        let barButton : UIBarButtonItem = UIBarButtonItem(customView: cartBarbuttonItem!)

        ((badgeCartViewController as! UIViewController)).navigationItem.rightBarButtonItem = barButton
 */
     }
     
     
     class func shoppingCartClick()
     {
//        var notificationViewController: UIViewController!
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        let notificationController = storyboard.instantiateViewControllerWithIdentifier("NotificationViewController") as! NotificationViewController
//        notificationViewController = UINavigationController(rootViewController: notificationController)
//
//        
//        ((badgeCartViewController as! UIViewController)).slideMenuController()?.changeMainViewController(notificationViewController, close: true)
//
        /*
        if NSUserDefaults.standardUserDefaults().stringForKey(GlobalConstant.kkIsLogin) == "1"
        {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            var vc: UIViewController
            vc = mainStoryboard.instantiateViewControllerWithIdentifier("OrderCartViewController")
            ((badgeCartViewController as! UIViewController)).navigationController!.pushViewController(vc, animated: true)
        }
        else
        {
            Global.showAlertMessageWithOkButtonAndTitle(GlobalConstant.APP_NAME, andMessage: "Please Login First", onController: (badgeCartViewController as! UIViewController))
        }*/
     }
    
    
    //MARK: - Internet Connection Checking Methods
    
    class func isInternetAvailable() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
    //MARK: - Reload Table View data with animation Methods

    class func reloadTableViewDataAnimated(_ tableView: UITableView){
        UIView.transition(with: tableView, duration: 0.55, options: .transitionCrossDissolve, animations:
            { () -> Void in
                tableView.reloadData()
            }, completion: nil);
    }
    
    //MARK: - Get text height
    
    class func heightForView(_ text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        
        label.sizeToFit()
        return label.frame.height + 50
    }
    
    //MARK: - Valid Email address Methods

   class func validateEmail(_ enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
    
    class func makeBlurImage(_ targetView:UIView?)
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = targetView!.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        targetView?.addSubview(blurEffectView)
    }
    
    //MARK: - Validation for Password
    
    // *** Validation for Password ***
    
    // "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$" --> (Minimum 8 characters at least 1 Alphabet and 1 Number)
    // "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,16}$" --> (Minimum 8 and Maximum 16 characters at least 1 Alphabet, 1 Number and 1 Special Character)
    // "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$" --> (Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet and 1 Number)
    // "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}" --> (Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character)
    // "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,10}" --> (Minimum 8 and Maximum 10 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character)
    
    class func isValidPassword(_ candidate: String) -> Bool {
        let ValidationExpression = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,16}$"
        return NSPredicate(format: "SELF MATCHES %@", ValidationExpression).evaluate(with: candidate)
    }

 }

