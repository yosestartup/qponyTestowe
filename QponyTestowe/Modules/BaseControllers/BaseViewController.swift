//
//  BaseViewController.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 10/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func showAlert(title: String?, message: String?, buttons: [UIAlertAction]) {
        self.showAlertController(style: .alert) {
            $0.title = title
            $0.message = message
            for button in buttons {
                $0.addAction(button)
            }
        }
    }

    func showAlertController(style: UIAlertController.Style, setupBlock: (UIAlertController) -> Void) {

        let alertController: UIAlertController = UIAlertController(title: "Error", message: nil, preferredStyle: style)
        setupBlock(alertController)

        if alertController.actions.count < 1 {
            fatalError("No actions provided in alert controller")
        }
        DispatchQueue.main.async {
        self.present(alertController, animated: true, completion: nil)
        }
    }
    
    public func showOkAlertController(title: String?, message: String?, callback: (() -> Void)? = nil) {
        self.showAlertController(style: .alert) {
            $0.title = title
            $0.message = message
            let action = UIAlertAction(title: "OK", style: .cancel, handler: { (_) in
                if callback != nil {
                    callback!()
                }
            })
            $0.addAction(action)
        }
    }
    
    @objc func popBack(from: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
