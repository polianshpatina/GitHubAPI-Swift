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
    @IBOutlet weak var passwordTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        usernameTextfield.text = ""
        passwordTextfield.text = ""
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if (textFieldrequired()) {
            let authentication = BasicAuthentication(username: usernameTextfield.text!, password: passwordTextfield.text!)
                UserAPI(authentication: authentication).getUser { (response, error) in
                    if let response = response {
                        if response.id != nil {
                            DispatchQueue.main.async{
                                self.performSegue(withIdentifier: "LoginToRepositories", sender: self)
                            }
                        }
                        else {
                            DispatchQueue.main.async{
                                Alerts.ShowAlert("Username or Password is incorrect!", parentVC: self)
                            }
                        }
                    } else {
                        Alerts.ShowAlert(error!.localizedDescription, parentVC: self)
                    }
            }
        }
    }
    
    func textFieldrequired() -> Bool{
        
        var errorMsg : String = ""
        
        if (self.usernameTextfield.text?.isEmpty)! && (self.passwordTextfield.text?.isEmpty)! {
            errorMsg += "Username and Password can not be empty!"
            Alerts.ShowAlert(errorMsg, parentVC: self)
            return false
        }
            
        else if (self.usernameTextfield.text?.isEmpty)! {
            errorMsg += "Username can not be empty!"
            Alerts.ShowAlert(errorMsg, parentVC: self)
            return false
        }
            
        else if (self.passwordTextfield.text?.isEmpty)! {
            errorMsg += "Password can not be empty!"
            Alerts.ShowAlert(errorMsg, parentVC: self)
            return false
        }
        else {
            return true
        }
        
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginToRepositories"
        {
            let vc = segue.destination as! RepositoriesViewController
            vc.username = usernameTextfield.text!
        }
    }
}
