//
//  ViewController.swift
//  paymentTest
//
//  Created by EdgardVS on 13/09/22.
//

import UIKit
import VisaNetSDK

class ViewController: UIViewController, VisaNetDelegate {
    
    var  paymentInfo: [String:Any]?
    var tokenEmail: String = ""
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
       // let url = URL(string: )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "resultSegue" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.info = paymentInfo
        }
    }
    
    func registrationDidEnd(serverError: Any?, responseData: Any?) {
        //
        if serverError == nil {
            /* Do Something
             with responseData*/
            //print(responseData!)
            guard let result = responseData as? [String:Any] else { return }
            //print("solo un elemento: \(result["EMAIL"]!)")
            if let email = result["EMAIL"] as? String {
                tokenEmail = email
            }
            paymentInfo = result
            //print(paymentInfo!)
            //if let sendData = paymentInfo {
                //print(sendData)
                performSegue(withIdentifier: "resultSegue", sender: self)
                
            //}
          
        } else {
                /* Do Something with NSError */
                print("error obteniendo trama de respuesta: \(serverError!)")
            }
            
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
    //esta si funciona
    func presentVisa(with token: String) {
        Config.securityToken = token
        Config.CE.dataChannel = .mobile
        Config.CE.endPointDevURL = "https://apitestenv.vnforapps.com"
        //Config.CE.endPointProdURL = "https://apirod.vnforapps.com/"
        Config.merchantID = "456879852"
        Config.CE.purchaseNumber = "1790"
        Config.CE.type = .dev
        Config.PINSHA256DEV = "D6rSeGVZdgfsMVIUabjeGDzS7YvLVp7pbnRhCggz/B4="
        Config.amount = 15.22
        Config.tokenizationEmail = tokenEmail
        var mdd = [String:Any]()
        mdd["MDD4"] = "456879852"
        mdd["MDD32"] = "1790"
        mdd["MDD75"] = ""
        Config.CE.Antifraud.merchantDefineData = mdd

        
        _ = VisaNet.shared.presentVisaPaymentForm(viewController: self)
        VisaNet.shared.delegate = self
        
    }


}

