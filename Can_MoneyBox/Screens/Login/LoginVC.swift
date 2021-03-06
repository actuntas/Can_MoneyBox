//
//  LoginVC.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import UIKit

private typealias ActionHandlers = LoadingHandler & ErrorHandler

class LoginVC: UIViewController, ActionHandlers, Storyboarded {
    
    //MARK: - IBOutlets and Variables
    
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var emailTextField: LoginTextfield!
    @IBOutlet weak var passwordTextField: LoginTextfield!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    private lazy var loginButton: RoundedButton = {
        let button = RoundedButton(backgroundColor: .clear, title: "LOG IN")
        button.addTarget(self, action: #selector(self.loginPressed), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    var viewModel: LoginViewModel!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: - Helper Functions
    
    private func configure() {
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
    
    private func changeButtonState(shouldEnable: Bool) {
        self.loginButton.isEnabled = shouldEnable
        
    }
    
    private func checkValidation() -> Bool {
        viewModel.validateAndUpdateErrors(text: emailTextField.text, type: .email) &&
        viewModel.validateAndUpdateErrors(text: passwordTextField.text, type: .password)
    }
    
    @objc private func loginPressed() {
        self.showLoading()
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        viewModel.login(email: email, password: password)
    }
}

//MARK: - TextField Delegate Methods

extension LoginVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        changeButtonState(shouldEnable: checkValidation())
    }
}
//MARK: - ViewModel Methods

extension LoginVC: LoginViewModelOutput {
    
    
    func loginCompleted(datasource: LoginViewModelDatasource) {
        self.changeButtonState(shouldEnable: false)
        self.removeLoading()
        self.coordinator?.showAccounts(name: datasource.name, email: datasource.secureData?.email ?? "")
    }
    
    func handleEmailError(shouldShowError: Bool) {
        emailErrorLabel.alpha = shouldShowError ? 1 : 0
    }
    
    func handlePasswordError(shouldShowError: Bool) {
        passwordErrorLabel.alpha = shouldShowError ? 1 : 0
    }
    
}
