//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Варвара Уткина on 25.11.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var forgotUserNameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.welcomeMessage = "Welcome, \(userNameTextField.text ?? "User")!"
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == "1", passwordTextField.text == "2" else {
            return false
        }
        return true
    }
    
    @IBAction func logInButtonTapped() {
        guard let inputLogin = userNameTextField.text, !inputLogin.isEmpty else {
            return
        }
        guard let inputPassword = passwordTextField.text, !inputPassword.isEmpty else {
            return
        }
        if shouldPerformSegue(withIdentifier: "GoToWelcomeScreen", sender: Any?.self) {
            performSegue(withIdentifier: "GoToWelcomeScreen", sender: self)
        } else {
            let alert = UIAlertController(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.passwordTextField.text = ""
            }
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    }
    
    @IBAction func forgotUserNameButtonTapped() {
        let alert = UIAlertController(
            title: "Oops!",
            message: "Your name is 1 😉",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        let alert = UIAlertController(
            title: "Oops!",
            message: "Your password is 2 😉",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text?.removeAll()
        passwordTextField.text?.removeAll()
    }
}
    


