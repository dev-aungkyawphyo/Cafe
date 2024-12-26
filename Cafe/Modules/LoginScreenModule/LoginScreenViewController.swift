//
//  LoginScreenViewController.swift
//  Cafe
//
//  Created by Aung Kyaw Phyo on 18/12/2024.
//

import UIKit

class LoginScreenViewController: CafeViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var textFieldCollection: [CafeTextField]!
    @IBOutlet var errorLabelCollection: [UILabel]!
    
    @IBOutlet weak var usernameTextField: CafeTextField!
    @IBOutlet weak var passwordTextField: CafeTextField!
    
    @IBOutlet weak var usernameErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!

    var delegate: LoginScreenToProtocols?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    // MARK: Additional Helpers
    private func defaultSetup() {
        textFieldSetup()
    }
    
    private func textFieldSetup() {
        textFieldCollection.forEach({
            $0.delegate = self
        })
    }
    
    // MARK: - User Interaction - Actions & Targets
    @IBAction func forgotPasswordBtnAction(_ sender: UIButton) {
        debugPrint("Pressed forgot btn")
        // TODO: Actions & Targets
    }
    
    @IBAction func registerBtnAction(_ sender: UIButton) {
        debugPrint("Pressed register btn")
        // TODO: Actions & Targets
    }
    
    @IBAction func loginBtnAction(_ sender: CafeButton) {
        if (delegate?.clickedOnLoginButton(inputData: LoginInput(username: usernameTextField.inputValue, password: passwordTextField.inputValue))) != nil {
        } else if usernameTextField.text == "Aung Kyaw Phyo" && passwordTextField.text == "password" {
            baseRouter()
        } else {
            if usernameTextField.text == "Aung Kyaw pHyo" && passwordTextField.text != "password" {
                showTextFieldErrorLabel(error: ValidationErrors.passwordError)
            } else if usernameTextField.text != "Aung Kyaw Phyo" && passwordTextField.text == "password" {
                showTextFieldErrorLabel(error: ValidationErrors.usernameError)
            } else if usernameTextField.text != "Aung Kyaw Phyo" {
                showTextFieldErrorLabel(error: ValidationErrors.usernameError)
            } else if passwordTextField.text != "password" {
                showTextFieldErrorLabel(error: ValidationErrors.passwordError)
            }
        }
    }
    
    private func baseRouter() {
        let vc = HomeScreenViewController.instantiate(storyboard: .main)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
}

// MARK: Extension
/**
 - Documentation for purpose of extension
 */

// MARK: - UITextFieldDelegate
extension LoginScreenViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let textField = textField as? CafeTextField, let index = textFieldCollection.firstIndex(of: textField) {
            errorLabelCollection[index].text = ""
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let textField = textField as? CafeTextField, let index = textFieldCollection.firstIndex(of: textField) else {
            return true
        }
        guard index < textFieldCollection.count - 1 else {
            textFieldCollection[index].resignFirstResponder()
            return true
        }
        textFieldCollection[index + 1].becomeFirstResponder()
        return true
    }
    
}

extension LoginScreenViewController: LoginScreenToProtocols {
    
    func showTextFieldErrorLabel(error: ValidationErrors) {
        if error == .usernameError {
            usernameErrorLabel.text = error.rawValue
        } else {
            passwordErrorLabel.text = error.rawValue
        }
    }
    
    func clickedOnLoginButton(inputData: LoginInput) {
        if inputData.username == "" {
            showTextFieldErrorLabel(error: ValidationErrors.usernameError)
        } else if inputData.password == "" {
            showTextFieldErrorLabel(error: ValidationErrors.passwordError)
        }
    }
    
}
