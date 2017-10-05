//
//  WebHelper.swift
//  Nicon
//
//  Created by Harish Patel on 05/08/16.
//  Copyright © 2016 Harish Patel. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class WebHelper: NSObject {
    
    //***//***//
    /*
     ALAMOFIRE Post method
     strURl             = Pass the request URl of the method Api
     dictPost           = Pass the dicticnary of the parameter else pass nil
     viewController     = Pass the view of the view controller
     APIKey             = Pass the API key or header key of the server
     Response           = Response is of dictionary class
     */
    
    class func requestPostUrlLoder(strURL:String,Dictionary dictPost:[String: Any],IsLoaderRequired loader: Bool,Success success:@escaping (_ responce: NSDictionary) ->Void,Failure failure:@escaping (_ error: NSError) ->Void   )
    {
        
        if Global.isInternetAvailable()
        {
            var hud: MBProgressHUD = MBProgressHUD()
            if loader {
                //hud = Global.showGlobalProgressHUD(withTitle: "Loading...")
            }
            
            Alamofire.request(GlobalConstant.Default_URL + strURL, method: .post, parameters: dictPost, headers: ["Apikey" : GlobalConstant.APIKey])
                .responseJSON
                {
                    response in
                    
                    if loader {
                        hud.hide(animated: true)
                    }
                    switch response.result
                    {
                    case .success:
                        print(response.result.value!)
                        if response.result.value is NSDictionary
                        {
                            success((response.result.value as? NSDictionary)!)
                        }
                    case .failure(let error):
                        
                        let responseString:String = String(data: response.data!, encoding: String.Encoding.utf8)!
                        print(responseString)
                        
                        failure(error as NSError)
                    }
                    if loader {
                        hud.hide(animated: true)
                    }
            }
        }
        else
        {
            Global.showAlertMessageWithOkButtonAndTitle("No Internet Connection", andMessage: "Make sure your device is connected to the internet.")
        }
    }
    //***//***//
    /*
     ALAMOFIRE Post method
     strURl             = Pass the request URl of the method Api
     dictPost           = Pass the dicticnary of the parameter else pass nil
     viewController     = Pass the view of the view controller
     APIKey             = Pass the API key or header key of the server
     Response           = Response is of dictionary class
     */
    
    class func requestPostUrl(strURL:String,Dictionary dictPost:[String: Any],Success success:@escaping (_ responce: NSDictionary) ->Void,Failure failure:@escaping (_ error: NSError) ->Void   )
    {
        
        if Global.isInternetAvailable()
        {
            let hud: MBProgressHUD = Global.showGlobalProgressHUD(withTitle: "Loading...")
            
            Alamofire.request(GlobalConstant.Default_URL + strURL, method: .post, parameters: dictPost, headers: ["Apikey" : GlobalConstant.APIKey])
                .responseJSON
                {
                    response in
                    
                    Global.dismissGlobalHUD()
                    switch response.result
                    {
                        case .success:
                            print(response.result.value!)
                            if response.result.value is NSDictionary
                            {
                                success((response.result.value as? NSDictionary)!)
                            }
                        case .failure(let error):
                           
                            let responseString:String = String(data: response.data!, encoding: String.Encoding.utf8)!
                            print(responseString)

                            failure(error as NSError)
                    }
                    hud.hide(animated: true)
            }
        }
        else
        {
            
            Global.showAlertMessageWithOkButtonAndTitle(GlobalConstant.APP_NAME, andMessage: "Internet is not connected!")
        }
    }

    //***//***//
    /*
     ALAMOFIRE Post method with single image paramter
     strURl             = Pass the request URl of the method Api
     dictPost           = Pass the dicticnary of the parameter else pass nil
     viewController     = Pass the view of the view controller
     APIKey             = Pass the API key or header key of the server
     Response           = Response is of dictionary class
     outletImage        = Pass the uiimage
     imageName          = Pass the name of parameter which is to be send to server
     */
    
    class func requestPostUrlWithImage(strURL:String, Dictionary dictPost:[String: AnyObject], AndImage outletImage:UIImage, forImageParameterName imageName:String, Success success:@escaping (_ responce: NSDictionary) ->Void, Failure failure:@escaping (_ error: NSError) ->Void   )
    {
        if Global.isInternetAvailable()
        {
            let hud: MBProgressHUD = Global.showGlobalProgressHUD(withTitle: "Loading...")

            // Begin upload
            let URL = try! URLRequest(url: GlobalConstant.Default_URL + strURL , method: .post, headers: ["Apikey" : GlobalConstant.APIKey])

            Alamofire.upload(multipartFormData: { multipartFormData in
                
                // import image to request
                if let imageData = UIImageJPEGRepresentation(outletImage, 1)
                {
                    multipartFormData.append(imageData, withName: imageName, fileName: "myImage.png", mimeType: "image/png")
                }
                // import parameters
                for (key, value) in dictPost {
                    let stringValue = value as! String
                    multipartFormData.append(stringValue.data(using: .utf8)!, withName: key)
                }
            }, with: URL, encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON
                        {
                            response in
                          
                            switch response.result
                            {
                            case .success:
                                print(response.result.value!)   // result of response serialization
                                if response.result.value is NSDictionary
                                {
                                    success((response.result.value as? NSDictionary)!)
                                }
                               
                            case .failure(let error):
                                let responseString:String = String(data: response.data!, encoding: String.Encoding.utf8)!
                                print(responseString)
                                
                                failure(error as NSError)
                            }
                            hud.hide(animated: true)
                    }
                case .failure(let encodingError):
                    print(encodingError)
                    hud.hide(animated: true)
                }
            })
        }
        else
        {
            Global.showAlertMessageWithOkButtonAndTitle(GlobalConstant.APP_NAME, andMessage: "Internet is not connected!")
        }
    }
    
    //***//***//
    /*
     ALAMOFIRE Post method with multiple image paramter
     strURl             = Pass the request URl of the method Api
     dictPost           = Pass the dicticnary of the parameter else pass nil
     viewController     = Pass the view of the view controller
     APIKey             = Pass the API key or header key of the server
     Response           = Response is of dictionary class
     outletImageArray   = Pass the array of uiimage
     imageName          = Pass the name of parameter which is to be send to server
     */
    
    class func requestPostUrlWithMultipleImage(strURL:String, Dictionary dictPost:[String: AnyObject], AndImage outletImageArray:NSArray, forImageParameterName imageName:NSString, Success success:@escaping (_ responce: NSDictionary) ->Void, Failure failure:@escaping (_ error: NSError) ->Void   )
    {
        if Global.isInternetAvailable()
        {
            let hud: MBProgressHUD = Global.showGlobalProgressHUD(withTitle: "Loading...")

            // Begin upload
            let URL = try! URLRequest(url: GlobalConstant.Default_URL + strURL , method: .post, headers: ["Apikey" : GlobalConstant.APIKey])
            
            Alamofire.upload(multipartFormData: { multipartFormData in
                
                var i:Int = 1
                for image in outletImageArray
                {
                    // import image to request
                    if let imageData = UIImageJPEGRepresentation(image as! UIImage, 1) {
                        multipartFormData.append(imageData, withName: imageName as String, fileName: "myImage\(i).png", mimeType: "image/png")
                    }
                    i += 1
                }
                
                // import parameters
                for (key, value) in dictPost
                {
                    if value is String
                    {
                        let stringValue = value as! String
                        multipartFormData.append(stringValue.data(using: .utf8)!, withName: key)
                    }
                }
                
            }, with: URL, encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON
                        {
                            response in
                           
                            switch response.result
                            {
                            case .success:
                                print(response.result.value!)   // result of response serialization
                                if response.result.value is NSDictionary
                                {
                                    success((response.result.value as? NSDictionary)!)
                                }
                                
                            case .failure(let error):
                                let responseString:String = String(data: response.data!, encoding: String.Encoding.utf8)!
                                print(responseString)
                                
                                failure(error as NSError)
                            }
                            hud.hide(animated: true)
                            //                                Global.activityIndicator(viewController.view, startAnimation: false)
                    }
                case .failure(let encodingError):
                    print(encodingError)
                    hud.hide(animated: true)
                }
            })
        }
        else
        {
            Global.showAlertMessageWithOkButtonAndTitle(GlobalConstant.APP_NAME, andMessage: "Internet is not connected!")
        }
    }
    
    //***//***//
    /*
     ALAMOFIRE Post method with single image paramter
     strURl             = Pass the request URl of the method Api
     dictPost           = Pass the dicticnary of the parameter else pass nil
     viewController     = Pass the view of the view controller
     APIKey             = Pass the API key or header key of the server
     Response           = Response is of dictionary class
     filePath           = Pass the name of parameter which is to be send to server
     fileName           = Pass the file name
     */
    
    class func requestPostUrlWithFile(strURL:String, Dictionary dictPost:[String: AnyObject], AndFilePath filePath:URL, forFileParameterName fileName:String, Success success:@escaping (_ responce: NSDictionary) ->Void, Failure failure:@escaping (_ error: NSError) ->Void   )
    {
        if Global.isInternetAvailable()
        {
            let hud: MBProgressHUD = Global.showGlobalProgressHUD(withTitle: "Loading...")

            // Begin upload
            let URL = try! URLRequest(url: GlobalConstant.Default_URL + strURL , method: .post, headers: ["Apikey" : GlobalConstant.APIKey])

            Alamofire.upload(multipartFormData: { multipartFormData in
                
                multipartFormData.append(filePath, withName: fileName)

                // import parameters
                for (key, value) in dictPost {
                    let stringValue = value as! String
                    multipartFormData.append(stringValue.data(using: .utf8)!, withName: key)
                }
            }, with: URL, encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON
                        {
                            response in

                            switch response.result
                            {
                            case .success:
                                print(response.result.value!)   // result of response serialization
                                if response.result.value is NSDictionary
                                {
                                    success((response.result.value as? NSDictionary)!)
                                }
                                
                            case .failure(let error):
                                let responseString:String = String(data: response.data!, encoding: String.Encoding.utf8)!
                                print(responseString)
                                
                                failure(error as NSError)
                            }
                            hud.hide(animated: true)
                            //                                Global.activityIndicator(viewController.view, startAnimation: false)
                    }
                case .failure(let encodingError):
                    print(encodingError)
                    hud.hide(animated: true)
                }
            })
        }
        else
        {
            Global.showAlertMessageWithOkButtonAndTitle(GlobalConstant.APP_NAME, andMessage: "Internet is not connected!")
        }
    }

    //***//***//
    /*
     ALAMOFIRE Post method with single image paramter
     strURl             = Pass the request URl of the method Api
     dictPost           = Pass the dicticnary of the parameter else pass nil
     viewController     = Pass the view of the view controller
     APIKey             = Pass the API key or header key of the server
     Response           = Response is of dictionary class
     outletImage        = Pass the uiimage
     imageName          = Pass the name of parameter which is to be send to server
     filePath           = Pass the name of parameter which is to be send to server
     fileName           = Pass the file name

     */
    
    class func requestPostUrlWithImageAndFile(strURL:String, Dictionary dictPost:[String: AnyObject], AndImage outletImage:UIImage, forImageParameterName imageName:String, AndFilePath filePath:URL, forFileParameterName fileName:String, Success success:@escaping (_ responce: NSDictionary) ->Void, Failure failure:@escaping (_ error: NSError) ->Void   )
    {
        if Global.isInternetAvailable()
        {
            let hud: MBProgressHUD = Global.showGlobalProgressHUD(withTitle: "Loading...")

            // Begin upload
            let URL = try! URLRequest(url: GlobalConstant.Default_URL + strURL , method: .post, headers: ["Apikey" : GlobalConstant.APIKey])
            
            Alamofire.upload(multipartFormData: { multipartFormData in
                
                multipartFormData.append(filePath, withName: fileName)
                
                // import image to request
                if let imageData = UIImageJPEGRepresentation(outletImage, 1)
                {
                    multipartFormData.append(imageData, withName: imageName, fileName: "myImage.png", mimeType: "image/png")
                }
                
                // import parameters
                for (key, value) in dictPost {
                    let stringValue = value as! String
                    multipartFormData.append(stringValue.data(using: .utf8)!, withName: key)
                }
            }, with: URL, encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON
                        {
                            response in
                            
                            switch response.result
                            {
                            case .success:
                                print(response.result.value!)   // result of response serialization
                                if response.result.value is NSDictionary
                                {
                                    success((response.result.value as? NSDictionary)!)
                                }
                                
                            case .failure(let error):
                                let responseString:String = String(data: response.data!, encoding: String.Encoding.utf8)!
                                print(responseString)
                                
                                failure(error as NSError)
                            }
                            hud.hide(animated: true)
                    }
                case .failure(let encodingError):
                    print(encodingError)
                    hud.hide(animated: true)
                }
            })
        }
        else
        {
            Global.showAlertMessageWithOkButtonAndTitle(GlobalConstant.APP_NAME, andMessage: "Internet is not connected!")
        }
    }

    
    //***//***//
    /*
     ALAMOFIRE Post method with single image paramter
     strURl             = Pass the request URl of the method Api
     dictPost           = Pass the dicticnary of the parameter else pass nil
     viewController     = Pass the view of the view controller
     APIKey             = Pass the API key or header key of the server
     Response           = Response is of dictionary class
     filePathArray      = Pass the name of parameter which is to be send to server
     fileName           = Pass the file name
     outletImageArray   = Pass the array of uiimage
     imageName          = Pass the name of parameter which is to be send to server
     */
    
    class func requestPostUrlWithMultipleFile(strURL:String, Dictionary dictPost:[String: AnyObject], AndImage outletImageArray:NSArray, forImageParameterName imageName:String, AndFilePath filePathArray:NSArray, forFileParameterName fileName:String, Success success:@escaping (_ responce: NSDictionary) ->Void, Failure failure:@escaping (_ error: NSError) ->Void   )
    {
        if Global.isInternetAvailable()
        {
            let hud: MBProgressHUD = Global.showGlobalProgressHUD(withTitle: "Loading...")
            
            // Begin upload
            let URL = try! URLRequest(url: GlobalConstant.Default_URL + strURL , method: .post, headers: ["Apikey" : GlobalConstant.APIKey])
            
            Alamofire.upload(multipartFormData: { multipartFormData in
                
                var i:Int = 1
                for image in outletImageArray
                {
                    // import image to request
                    if let imageData = UIImageJPEGRepresentation(image as! UIImage, 1) {
                        multipartFormData.append(imageData, withName: imageName as String, fileName: "myImage\(i).png", mimeType: "image/png")
                    }
                    i += 1
                }
                
                var k:Int = 1
                for filePath in filePathArray
                {
                    multipartFormData.append(filePath as! URL, withName: fileName)
                    k += 1
                }
                
                // import parameters
                for (key, value) in dictPost {
                    let stringValue = value as! String
                    multipartFormData.append(stringValue.data(using: .utf8)!, withName: key)
                }
            }, with: URL, encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON
                        {
                            response in
                            
                            switch response.result
                            {
                            case .success:
                                print(response.result.value!)   // result of response serialization
                                if response.result.value is NSDictionary
                                {
                                    success((response.result.value as? NSDictionary)!)
                                }
                                
                            case .failure(let error):
                                let responseString:String = String(data: response.data!, encoding: String.Encoding.utf8)!
                                print(responseString)
                                
                                failure(error as NSError)
                            }
                            hud.hide(animated: true)
                    }
                case .failure(let encodingError):
                    print(encodingError)
                    hud.hide(animated: true)
                }
            })
        }
        else
        {
            Global.showAlertMessageWithOkButtonAndTitle(GlobalConstant.APP_NAME, andMessage: "Internet is not connected!")
        }
    }
    
    
    //***//***//
    /*
     ALAMOFIRE Post method with single image paramter
     strURl             = Pass the request URl of the method Api
     dictPost           = Pass the dicticnary of the parameter else pass nil
     viewController     = Pass the view of the view controller
     APIKey             = Pass the API key or header key of the server
     Response           = Response is of dictionary class
     filePathArray      = Pass the name of parameter which is to be send to server
     fileName           = Pass the file name
     outletImageArray   = Pass the array of uiimage
     imageName          = Pass the name of parameter which is to be send to server
     tumbImageArray     = Pass the array of uiimage of video thumbnail
     tumbImageName      = Pass the name of parameter which is to be send to server of video thumbnail
     
     */
    
    class func requestPostUrlWithMultipleImageAndMultipleFile(strURL:String, Dictionary dictPost:[String: AnyObject], AndImage outletImageArray:NSArray, forImageParameterName imageName:String, AndVideoThumbImage thumbImageArray:NSArray, forThumbImageParameterName thumbImageName:String, AndFilePath filePathArray:NSArray, forFileParameterName fileName:String, Success success:@escaping (_ responce: NSDictionary) ->Void, Failure failure:@escaping (_ error: NSError) ->Void   )
    {
        if Global.isInternetAvailable()
        {
            let hud: MBProgressHUD = Global.showGlobalProgressHUD(withTitle: "Loading...")
            
            // Begin upload
            let URL = try! URLRequest(url: GlobalConstant.Default_URL + strURL , method: .post, headers: ["Apikey" : GlobalConstant.APIKey])
            
            Alamofire.upload(multipartFormData: { multipartFormData in
                
                var i:Int = 1
                for image in outletImageArray
                {
                    // import image to request
                    if let imageData = UIImageJPEGRepresentation(image as! UIImage, 1) {
                        multipartFormData.append(imageData, withName: imageName as String, fileName: "myImage\(i).png", mimeType: "image/png")
                    }
                    i += 1
                }
                
                var j:Int = 1
                for image in thumbImageArray
                {
                    // import image to request
                    if let imageData = UIImageJPEGRepresentation(image as! UIImage, 1) {
                        multipartFormData.append(imageData, withName: thumbImageName as String, fileName: "myImage\(j).png", mimeType: "image/png")
                    }
                    j += 1
                }
                
                var k:Int = 1
                for filePath in filePathArray
                {
                    multipartFormData.append(filePath as! URL, withName: fileName)
                    k += 1
                }
                
                // import parameters
                for (key, value) in dictPost {
                    let stringValue = value as! String
                    multipartFormData.append(stringValue.data(using: .utf8)!, withName: key)
                }
            }, with: URL, encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON
                        {
                            response in
                            
                            switch response.result
                            {
                            case .success:
                                print(response.result.value!)   // result of response serialization
                                if response.result.value is NSDictionary
                                {
                                    success((response.result.value as? NSDictionary)!)
                                }
                                
                            case .failure(let error):
                                let responseString:String = String(data: response.data!, encoding: String.Encoding.utf8)!
                                print(responseString)
                                
                                failure(error as NSError)
                            }
                            hud.hide(animated: true)
                    }
                case .failure(let encodingError):
                    print(encodingError)
                    hud.hide(animated: true)
                }
            })
        }
        else
        {
            Global.showAlertMessageWithOkButtonAndTitle(GlobalConstant.APP_NAME, andMessage: "Internet is not connected!")
        }
    }
    
    //***//***//
    /*
     ALAMOFIRE Post method with multiple image paramter and single image parameter
     strURl             = Pass the request URl of the method Api
     dictPost           = Pass the dicticnary of the parameter else pass nil
     viewController     = Pass the view of the view controller
     APIKey             = Pass the API key or header key of the server
     Response           = Response is of dictionary class
     outletImageArray   = Pass the array of uiimage
     arrayImageName     = Pass the name of parameter which is to be send to server
     outletImage        = Pass the uiimage
     imageName          = Pass the name of parameter which is to be send to server
     */
    
    class func requestPostUrlWithMultipleImageAndImage(strURL:String, Dictionary dictPost:[String: AnyObject], Image outletImage: UIImage, forImageParameterName imageName:NSString, AndImageArray outletImageArray:NSArray, forArrayImageParameterName arrayImageName:NSString, Success success:@escaping (_ responce: NSDictionary) ->Void, Failure failure:@escaping (_ error: NSError) ->Void   )
    {
        if Global.isInternetAvailable()
        {
            let hud: MBProgressHUD = Global.showGlobalProgressHUD(withTitle: "Loading...")
            
            // Begin upload
            let URL = try! URLRequest(url: GlobalConstant.Default_URL + strURL , method: .post, headers: ["Apikey" : GlobalConstant.APIKey])
            
            Alamofire.upload(multipartFormData: { multipartFormData in
                
                var i:Int = 1
                for image in outletImageArray
                {
                    // import image to request
                    if let imageData = UIImageJPEGRepresentation(image as! UIImage, 1) {
                        multipartFormData.append(imageData, withName: arrayImageName as String, fileName: "myImage\(i).png", mimeType: "image/png")
                    }
                    i += 1
                }
                
                // import image to request
                if let imageData = UIImageJPEGRepresentation(outletImage, 1)
                {
                    multipartFormData.append(imageData, withName: imageName as String, fileName: "myImage.png", mimeType: "image/png")
                }
                // import parameters
                for (key, value) in dictPost {
                    let stringValue = value as! String
                    multipartFormData.append(stringValue.data(using: .utf8)!, withName: key)
                }
            }, with: URL, encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON
                        {
                            response in
                            
                            switch response.result
                            {
                            case .success:
                                print(response.result.value!)   // result of response serialization
                                if response.result.value is NSDictionary
                                {
                                    success((response.result.value as? NSDictionary)!)
                                }
                                
                            case .failure(let error):
                                let responseString:String = String(data: response.data!, encoding: String.Encoding.utf8)!
                                print(responseString)
                                
                                failure(error as NSError)
                            }
                            hud.hide(animated: true)
                    }
                case .failure(let encodingError):
                    print(encodingError)
                    hud.hide(animated: true)
                }
            })
        }
        else
        {
            Global.showAlertMessageWithOkButtonAndTitle(GlobalConstant.APP_NAME, andMessage: "Internet is not connected!")
        }
    }
}
