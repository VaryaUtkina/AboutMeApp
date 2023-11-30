//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Варвара Уткина on 25.11.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: Private Properties
    private let user = "User"
    private let password = "Password"
    
    // MARK: Override Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = user
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard userNameTextField.text == user, passwordTextField.text == password else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login or password") {
                    self.passwordTextField.text = ""
                }
            return false
        }
        return true
    }
    
    // MARK: IB Actions
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0 
        ? showAlert(title: "Oops!", message: "Your name is \(user) 😉")
        : showAlert(title: "Oops!", message: "Your password is \(password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text?.removeAll()
        passwordTextField.text?.removeAll()
    }
    
    private func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
    


