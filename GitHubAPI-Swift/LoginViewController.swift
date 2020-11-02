//
//  LoginViewController.swift
//  GitHubAPI-Swift
//
//  Created by Stephen Kaylor on 11/1/20.
//  Copyright © 2020 Polian Shpatina. All rights reserved.
//

import UIKit
import GithubAPI

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        usernameTextfield.text = ""
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if usernameTextfield.text == "" {
            // create the alert
            let alert = UIAlertController(title: "Alert", message: "Username can not be empty!", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? RepositoriesViewController {
            vc.username = usernameTextfield.text!
        }
    }
}