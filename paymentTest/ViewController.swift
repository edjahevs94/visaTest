//
//  ViewController.swift
//  paymentTest
//
//  Created by EdgardVS on 13/09/22.
//

import UIKit
import VisaNetSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    
    @IBAction func payButton(_ sender: UIButton) {
        Service.getStringData { response in
            switch response {
            case .success(let token):
                print("este es el token: \(token)")
                self.presentVisa(with: token)
                
            case .failure(let error):
                print("error:", error)
            }
        
        }
    }
    
    func presentVisa(with token: String) {
        Config.CE.dataChannel = .mobile
        Config.securityToken = token
        Config.merchantID = "341198210"
        Config.CE.purchaseNumber = "1790"
        Config.PINSHA256DEV = "D6rSeGVZdgfsMVIUabjeGDzS7YvLVp7pbnRhCggz/B4="
        Config.amount = 15.22
        _ = VisaNet.shared.presentVisaPaymentForm(viewController: self)
        
        
    }


}

