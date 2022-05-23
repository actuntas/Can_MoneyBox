//
//  SplashVC.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import UIKit

class SplashVC: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        coordinate()
    }
    
    private func coordinate() {
        
        guard let name = UserDefaults.standard.string(forKey: UserDefaultsKeys.Name),
              let email = UserDefaults.standard.string(forKey: UserDefaultsKeys.Email) else {
            coordinator?.showLogin()
            return
        }
        
        coordinator?.showAccounts(name: name, email: email)
    }
    
}
