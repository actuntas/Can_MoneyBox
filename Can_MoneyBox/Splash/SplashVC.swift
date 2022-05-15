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
        loadLogin()
    }
    
    private func loadLogin() {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        loginVC = storyboard.instantiateViewController(withIdentifier: Identifiers.loginVC) as? LoginVC
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: false)
    }
}
