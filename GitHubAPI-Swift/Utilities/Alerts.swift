//
//  Alerts.swift
//  GitHubAPI-Swift
//
//  Created by Stephen Kaylor on 11/2/20.
//  Copyright © 2020 Polian Shpatina. All rights reserved.
//

import Foundation
import UIKit

class Alerts
{
    fileprivate static var alertController : UIAlertController?
  
    static var AlertController : UIAlertController
    {
        get { return alertController! }
        set { alertController = newValue }
    }
    
    static func ShowAlert(_ msg : String, parentVC : UIViewController)
    {
        alertController = UIAlertController(title: "Alert!", message: msg, preferredStyle: .alert)
        
        alertController?.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        parentVC.present(alertController!, animated: true, completion: nil)
    }    
}
