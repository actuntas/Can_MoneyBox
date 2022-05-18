//
//  SplashVC.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import UIKit

class SplashVC: UIViewController {
    
    var loginVC: LoginVC!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadLoginScreen()
    }
    
    private func loadLoginScreen() {
        let storyboard = UIStoryboard(name: Storyboards.Login, bundle: nil)
        loginVC = storyboard.instantiateViewController(withIdentifier: Identifiers.LoginVC) as? LoginVC
        loginVC.modalPresentationStyle = .fullScreen
        let viewModel = LoginViewModel(service: DefaultNetworkService())
        loginVC.viewModel = viewModel
        self.present(loginVC, animated: false)
    }
}
