//
//  AccountsVC.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import UIKit

class AccountsVC: UIViewController {
    
    var viewModel: AccountsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        configure()
    }
    
    private func configure() {
        print(viewModel.name)
    }

}
