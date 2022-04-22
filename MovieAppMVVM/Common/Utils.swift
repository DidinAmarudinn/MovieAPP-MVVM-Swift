//
//  Utils.swift
//  MovieAppMVVM
//
//  Created by didin amarudin on 22/04/22.
//

import Foundation
import UIKit
func showAlertView(title : String,messsage: String)  {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let alertController = UIAlertController(title: title, message: messsage, preferredStyle: UIAlertController.Style.alert)
    let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
    }
    alertController.addAction(okAction)
    appDelegate.window?.rootViewController?.present(alertController, animated: true, completion: nil)
}


