//
//  LoadingHandler.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 16.05.2022.
//

import UIKit

public protocol LoadingHandler where Self: UIViewController {
    func showLoading()
    func removeLoading()
}

public extension LoadingHandler {
    func showLoading() {
        DispatchQueue.main.async {
            let loadingView = LoadingView()
            loadingView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(loadingView)
            NSLayoutConstraint.activate([
                loadingView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                loadingView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                loadingView.topAnchor.constraint(equalTo: self.view.topAnchor),
                loadingView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ])
        }
        
    }
    
    func removeLoading() {
        DispatchQueue.main.async {
            self.view.subviews.forEach {
                if $0 is LoadingView {
                    $0.removeFromSuperview()
                }
            }
        }
      
    }
}
