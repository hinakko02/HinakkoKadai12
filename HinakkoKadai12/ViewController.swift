//
//  ViewController.swift
//  HinakkoKadai12
//
//  Created by Hina on 2023/07/08.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var noTaxTextField: UITextField!
    @IBOutlet weak var taxTextField: UITextField!
    @IBOutlet weak var taxPriceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let text1 = UserDefaults.standard.string(forKey: "taxKey") {
            self.taxTextField.text = text1
        }
    }

    @IBAction func calculationButton(_ sender: Any) {
        if let noTaxPrice = Int(noTaxTextField.text ?? ""),let tax = Int(taxTextField.text ?? "") {
            let result = Int(noTaxPrice * (100 + tax)/100)
            print(result)
            taxPriceLabel.text = "\(result)"
            UserDefaults.standard.set(taxTextField.text, forKey: "taxKey")
        } else {
            taxPriceLabel.text = ""
        }
    }
}
