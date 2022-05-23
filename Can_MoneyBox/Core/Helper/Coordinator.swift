//
//  Coordinator.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 23.05.2022.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController { get set }
    
    func start()
}

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SplashVC.instantiate(storyboard: Storyboards.Splash)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showLogin() {
        let vc = LoginVC.instantiate(storyboard: Storyboards.Login)
        vc.coordinator = self
        let viewModel = LoginViewModel(service: DefaultNetworkService(), request: LoginRequest())
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: false)
    }
    
    
    func showAccounts(name: String, email: String) { //on vc coordinator?.login will trigger this
        let vc = AccountsVC.instantiate(storyboard: Storyboards.Accounts)
        navigationController.setNavigationBarHidden(false, animated: false)
        guard let _secureData = KeychainManager.standard.read(service: KeychainKey.Company, account: email, type: Auth.self) else { return }
        vc.coordinator = self
        let accountsViewModel = AccountsViewModel(service: DefaultNetworkService(), datasource: AccountsViewModelDatasource(name: name, securedData: _secureData), request: AccountsRequest())
        vc.viewModel = accountsViewModel
        //let viewModel = AccountsViewModel(service: DefaultNetworkService(), datasource: AccountsViewModelDatasource(name: <#T##String#>, securedData: <#T##Auth#>))
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showDetails(viewModel: AccountDetailsViewModel) {
        let vc = AccountDetailsVC.instantiate(storyboard: Storyboards.AccountDetails)
        vc.viewModel = viewModel
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func logout() {
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.popToRootViewController(animated: false)
    }
    
    
}
