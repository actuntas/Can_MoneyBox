//
//  AccountsVC.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import UIKit

private typealias ActionHandlers = LoadingHandler & ErrorHandler

class AccountsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var logoutButton: UIBarButtonItem!

    var viewModel: AccountsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getAccounts()
    }
    
    private func configure() {
        viewModel.output = self
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        showLoading()
        viewModel.removeInfo()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            self.logoutButton.isEnabled = false
            self.dismiss(animated: true)
        }
    }
    
}

extension AccountsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        viewModel.titleForHeaderInSection ?? ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        178
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.AccountsCell, for: indexPath) as? AccountsCell else { return UITableViewCell() }
        let account = viewModel.datasource.products[indexPath.row]
        cell.populate(for: account)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        DispatchQueue.main.async {
            tableView.deselectRow(at: indexPath, animated: true)
            
            let selectedProduct = self.viewModel.datasource.products[indexPath.row]
            let detailsViewModel = AccountDetailsViewModel(service: DefaultNetworkService(), product: selectedProduct, email: self.viewModel.datasource.securedData.email)
            let storyboard = UIStoryboard(name: Storyboards.AccountDetails, bundle: nil)
            guard let detailsVC = storyboard.instantiateViewController(withIdentifier: Identifiers.AccountDetailsVC) as? AccountDetailsVC else { return }
            detailsVC.viewModel = detailsViewModel
            self.show(detailsVC, sender: nil)
        }
    }
}

extension AccountsVC: AccountsViewModelOutput, ActionHandlers {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}
    
