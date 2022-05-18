//
//  AccountDetails.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 16.05.2022.
//

import UIKit

private typealias ActionHandlers = LoadingHandler & ErrorHandler

class AccountDetailsVC: UIViewController, ActionHandlers {
    
    @IBOutlet weak var detailCardView: RoundedShadowView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    var viewModel: AccountDetailsViewModel!
    
    private lazy var addAmountButton: RoundedButton = {
        let button = RoundedButton(backgroundColor: .white, title: "Add £ 10 ♥️")
        button.addTarget(self, action: #selector(incrementAmountByTen), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        title = viewModel.datasource.product.product.name
        layAddAmountButton()
    }
    
    private func layAddAmountButton() {
        view.addSubview(addAmountButton)
        NSLayoutConstraint.activate([
            addAmountButton.topAnchor.constraint(equalTo: detailCardView.bottomAnchor, constant: 60),
            addAmountButton.centerXAnchor.constraint(equalTo: detailCardView.centerXAnchor),
            addAmountButton.widthAnchor.constraint(equalToConstant: detailCardView.frame.width / 2),
            addAmountButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func updateAmount(newAmount: String?) {
        guard let amount = newAmount else { return }
        amountLabel.text = amount
        //self.removeLoading()
    }
    
    @objc private func incrementAmountByTen() {
        print("pressed")
        //self.showLoading()
        viewModel.incrementAmountByTen(amount: "10")
    }
}