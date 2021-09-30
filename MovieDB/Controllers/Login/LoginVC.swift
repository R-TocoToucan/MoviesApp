//
//  ViewController.swift
//  MovieDB
//
//  Created by River Camacho on 9/24/21.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var passWord: UITextField!
    
    @IBOutlet weak var errorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessage.isHidden = true
        userName.delegate = self
        passWord.delegate = self
        self.navigationController?.navigationBar.isHidden = true
        setupToHideKeyboardOnTapOnView()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return false
        }
    
    
    
    @IBAction func loginToMovieApp(_ sender: UIButton) {
        
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "MovieListVC")
        if emailValidation(userName.text ?? "none") {
            if passwordValidation(passWord.text ?? "none"){
                self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    
    func emailValidation(_ email: String) -> Bool {
        if (email.count >= 6) {
            return true
        }
        errorMessage.text = "Email cannot be empty and must be longer than 6 characters"
        errorMessage.isHidden = false
        return false
    }
        
    func passwordValidation(_ pass: String) -> Bool {
        if (pass.count >= 6){
            return true
        }
        errorMessage.text = "Password cannot be empty and must be longer than 6 characters"
        errorMessage.isHidden = false
        return false
    }
        

}

extension UIViewController {
    func setupToHideKeyboardOnTapOnView()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

