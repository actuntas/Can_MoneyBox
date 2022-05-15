//
//  LoginVC.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: LoginTextfield!
    @IBOutlet weak var passwordTextField: LoginTextfield!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    private lazy var loginButton: MMButton = { // Can add target here because it's lazy
        let button = MMButton(backgroundColor: .clear, title: "LOG IN")
        button.addTarget(self, action: #selector(self.loginPressed), for: .touchUpInside)
        //button.isEnabled = false
        return button
    }()
    
    var viewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        view.addSubview(loginButton)
        layoutLoginButton()
    }
    
    private func layoutLoginButton() {
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordErrorLabel.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func navigate() {
        print("navigate")
    }
    
    @objc private func loginPressed() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        viewModel.login(email: email, password: password) { [weak self] error in
            if error != nil {
                //self.showAlert(error)
            } else {
                DispatchQueue.main.async {
                    self?.navigate()
                }
            }
        }
    }

}

extension LoginVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
