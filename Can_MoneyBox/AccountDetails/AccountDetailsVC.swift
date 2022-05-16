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
    
    var viewModel: AccountDetailsViewModel!
    var selectedProduct: ProductResponse?
    
    private lazy var addAmountButton: RoundedButton = {
        let button = RoundedButton(backgroundColor: .white, title: "Add £ 10 ♥️")
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
    
    private func updateAmount(newAmount: String?) {
        guard let newAmount = newAmount else { return }
        print(newAmount)
        //display

    }
    
    @objc private func incrementAmountByTen() {
        print("tapped")
        viewModel.incrementAmountByTen(amount: "10", productId: String(selectedProduct?.id ?? 0)) { result in
            switch result {
                
            case .success(let newAmount):
                DispatchQueue.main.async {
                    self.updateAmount(newAmount: newAmount)
                }
            case .failure(_):
                print("failed")
            }
        }
    }
}

