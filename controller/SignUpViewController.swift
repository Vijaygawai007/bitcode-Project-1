//
//  SignUpViewController.swift
//  bitcode-Project-1
//
//  Created by Prince's Mac on 24/03/23.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF2: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func registerBTN(_ sender: UIButton) {
        guard let email = emailTF.text else {return}
        guard let pass = passwordTF2.text else {return}
        Auth.auth().createUser(withEmail: email, password: pass){ AuthResult, error in
            if let error = error {
                print(error)
                
                return
            }
            let Viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")as! ViewController
            print("signUp Successful")
            self.navigationController?.popoverPresentationController
        }
    }
}



////let email = emailTextField.text
//
//let password = passwordtextField.text
//
//Auth.auth().createUser(withEmail: email!, password: password!) { (authResult, error) in
//
//if let error = error {
//
//print(“DEBUG: Failed to create user with error: “, error.localizedDescription)
//
//return
//
//}
//
//print(“Sign up was successful”)
