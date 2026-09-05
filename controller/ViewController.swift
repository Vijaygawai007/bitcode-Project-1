//
//  ViewController.swift
//  bitcode-Project-1
//
//  Created by Prince's Mac on 23/04/23.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var usenameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passwordLBL: UILabel!
    @IBOutlet weak var usenameLBL: UILabel!
    @IBOutlet weak var passwordBTNOutlet: UIButton!
    var iconClick = true
    override func viewDidLoad() {
        super.viewDidLoad()
        usenameLBL.isHidden = true
        passwordTF.isSecureTextEntry = true
    }

    @IBAction func passwordHideShowBTN(_ sender: UIButton) {
        if iconClick{
            passwordTF.isSecureTextEntry = false
            passwordBTNOutlet.setImage(UIImage(named: "eye.circle.fill"), for: UIControl.State())
        }else {
            passwordTF.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    
    @IBAction func signinBTN(_ sender: UIButton) {
        if usenameTF.text != nil || passwordTF.text != nil {
            Auth.auth().signIn(withEmail: usenameTF.text!, password: passwordTF.text!){Result , error in
                if error != nil {
                    print(error?.localizedDescription)
                    self.usenameLBL.isHidden = false
                    self.usenameLBL.text = error?.localizedDescription
                    //                    self.dismiss(animated: true)
                    //                    self.passwordLBL.isHidden = false
                    //                    self.passwordLBL.text = error!.localizedDescription
                    
                }else{
                    print("login successfull")
                    //mark : - navigate and login successfull screen.
                    let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")as! HomeViewController
                    self.navigationController?.pushViewController(HomeViewController, animated: true)
                }
            }
            self.usenameTF.text = ""
            self.passwordTF.text = ""
        }
        
    }
    @IBAction func signUpBTN(_ sender: UIButton) {
        let SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController")as! SignUpViewController
        self.navigationController?.pushViewController(SignUpViewController, animated: true)
    }
    
    @IBAction func forgetPassBTN(_ sender: UIButton) {
        let ForgetPassViewController = self.storyboard?.instantiateViewController(withIdentifier: "ForgetPassViewController")as! ForgetPassViewController
        self.navigationController?.pushViewController(ForgetPassViewController, animated: true)
    }
}
