//
//  ForgetPassViewController.swift
//  bitcode-Project-1
//
//  Created by Prince's Mac on 30/03/23.
//

import UIKit
import FirebaseAuth

class ForgetPassViewController: UIViewController {
    
    @IBOutlet weak var enterEmail : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func Submit(_ sender: UIButton) {
        Auth.auth().sendPasswordReset(withEmail: enterEmail.text!){ error in
            if let error = error {
                print(error.localizedDescription)
            }else{
                print("Password Reset link has been to your register email Id")
                
                let alert = UIAlertController(title: "✅", message: "Password Reset link has been sent to your register email Id", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
                self.present(alert, animated: true,completion: nil)
            }
            //            let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")as! ViewController
            //            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    
    
    
    func navigate (){
        let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")as! ViewController
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - let alert = UIAlertController(title: "Message", message: "Password Reset link has been sent to your register email Id", preferredStyle: UIAlertController.Style.alert)
//alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
//self.present(alert, animated: true,completion: nil)
//print("Password Reset link has been to your register email Id")
