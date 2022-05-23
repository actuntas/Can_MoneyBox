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
            //loadLoginScreen()
            coordinator?.showLogin()
            return
        }
        
        coordinator?.showAccounts(name: name, email: email)
        //loadAccountsScreen(name: name, email: email)
    }
    
    private func loadLoginScreen() {
        let loginVC = LoginVC.instantiate(storyboard: Storyboards.Login)
        loginVC.modalPresentationStyle = .fullScreen
        let viewModel = LoginViewModel(service: DefaultNetworkService(), request: LoginRequest())
        loginVC.viewModel = viewModel
        self.present(loginVC, animated: false)
    }
    
    private func loadAccountsScreen(name: String, email: String) {
        let storyboard = UIStoryboard(name: Storyboards.Accounts, bundle: nil)
        guard let accountsNC = storyboard.instantiateViewController(withIdentifier: Identifiers.AccountsNC) as? UINavigationController,
              let accountsVC = accountsNC.viewControllers.first as? AccountsVC,
              let _secureData = KeychainManager.standard.read(service: KeychainKey.Company, account: email, type: Auth.self) else { return }
        accountsNC.modalPresentationStyle = .fullScreen
        let accountsViewModel = AccountsViewModel(service: DefaultNetworkService(), datasource: AccountsViewModelDatasource(name: name, securedData: _secureData), request: AccountsRequest())
        accountsVC.viewModel = accountsViewModel
        self.show(accountsNC, sender: nil)
    }
}
