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

    private let taxKey = "taxKey"

    override func viewDidLoad() {
        super.viewDidLoad()

        if let taxText = UserDefaults.standard.string(forKey: taxKey) {
            self.taxTextField.text = taxText
        }
    }

    @IBAction func calculationButton(_ sender: Any) {
        let taxPriceText: String

        if let noTaxText = Int(noTaxTextField.text ?? ""), let taxText = Int(taxTextField.text ?? "") {
            let result = Int(noTaxText * (100 + taxText)/100)
            taxPriceText = "\(result)"
            UserDefaults.standard.set(taxText, forKey: taxKey)
        } else {
            taxPriceText = ""
        }

        taxPriceLabel.text = taxPriceText
    }
}
