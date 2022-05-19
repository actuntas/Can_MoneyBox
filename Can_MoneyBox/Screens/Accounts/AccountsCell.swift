//
//  AccountsCell.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import UIKit

class AccountsCell: UITableViewCell {

    @IBOutlet weak var cardView: RoundedShadowView!
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var moneyBoxLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    internal func populate(for product: ProductResponse) {
        accountNameLabel.text = product.product.friendlyName
        messageLabel.text = "Interest rate: % \(String(product.product.interestRateAmount ?? 0.0))"
        moneyBoxLabel.text = "Moneybox: \(product.moneybox)"
        

    }

}
