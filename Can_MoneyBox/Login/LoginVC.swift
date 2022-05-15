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
        button.isEnabled = false
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
        viewModel.output = self
    }
    
    private func layoutLoginButton() {
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordErrorLabel.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func navigateAndInjectDatasource(datasource: LoginViewModelDatasource) {
        print(datasource.name)
    }
    
    private func changeButtonState(shouldEnable: Bool) {
        loginButton.isEnabled = shouldEnable
    }
    
    @objc private func loginPressed() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        viewModel.login(email: email, password: password) { [weak self] datasource, error in
            if error != nil {
                //self.showAlert(error)
            } else if let _datasource = datasource {
                DispatchQueue.main.async {
                    self?.navigateAndInjectDatasource(datasource: _datasource)
                }
            }
        }
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let success = viewModel.validateAndUpdateErrors(text: emailTextField.text, type: .email) && viewModel.validateAndUpdateErrors(text: passwordTextField.text, type: .password)
        changeButtonState(shouldEnable: success)
    }
}

extension LoginVC: LoginViewModelOutput {
    func handleEmailError(shouldShowError: Bool) {
        emailErrorLabel.alpha = shouldShowError ? 1 : 0
    }
    
    func handlePasswordError(shouldShowError: Bool) {
        passwordErrorLabel.alpha = shouldShowError ? 1 : 0
    }
}
