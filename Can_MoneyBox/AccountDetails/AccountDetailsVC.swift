//
//  AccountDetails.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 16.05.2022.
//

import UIKit

class AccountDetailsVC: UIViewController {
    
    @IBOutlet weak var detailCardView: RoundedShadowView!
    @IBOutlet weak var productNameLabel: UILabel!
    
    var viewModel: AccountDetailViewModel!
    var selectedProduct: ProductResponse?
    
    private lazy var addAmountButton: MMButton = {
        let button = MMButton(backgroundColor: .white, title: "Add 10 pound")
        button.addTarget(self, action: #selector(incrementAmountByTen), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        title = (selectedProduct?.product.name ?? "no account")
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
    
    @objc private func incrementAmountByTen() {
        viewModel.incrementAmountByTen(amount: "10", productId: String(selectedProduct?.id ?? 0)) { result in
            switch result {
                
            case .success(_):
                print("success")
            case .failure(_):
                print("failed")
            }
        }
    }
}

