//
//  LoginScreenToProtocols.swift
//  Cafe
//
//  Created by Aung Kyaw Phyo on 27/12/2024.
//

import UIKit

protocol LoginScreenToProtocols: AnyObject {
    func showTextFieldErrorLabel(error: ValidationErrors)
    func clickedOnLoginButton(inputData: LoginInput)
}
