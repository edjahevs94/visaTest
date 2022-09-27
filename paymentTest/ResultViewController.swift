//
//  ResultViewController.swift
//  paymentTest
//
//  Created by EdgardVS on 19/09/22.
//

import UIKit

class ResultViewController: UIViewController {

    var info: [String:Any]?
    
    @IBOutlet weak var actionCode: UILabel!
    
    @IBOutlet weak var actionDescription: UILabel!
    
    @IBOutlet weak var firstName: UILabel!
    
    @IBOutlet weak var purchaseNumber: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var amount: UILabel!
    
    @IBOutlet weak var card: UILabel!
    
    @IBOutlet weak var brand: UILabel!
    
    @IBOutlet weak var status: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let safeInfo = info {
            
            actionCode.text = safeInfo["ACTION_CODE"] as? String
            actionDescription.text = safeInfo["ACTION_DESCRIPTION"] as? String
            firstName.text = safeInfo["FIRST_NAME"] as? String
            purchaseNumber.text = safeInfo["PURCHASE_NUMBER"] as? String
            email.text = safeInfo["EMAIL"] as? String
            amount.text = safeInfo["AMOUNT"] as? String
            card.text = safeInfo["CARD"] as? String
            brand.text = safeInfo["BRAND"] as? String
            status.text = safeInfo["STATUS"] as? String
        } else {
            print("Nil again")
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
