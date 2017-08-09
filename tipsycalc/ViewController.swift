//
//  ViewController.swift
//  tipsycalc
//
//  Created by Steven Young on 8/9/17.
//  Copyright © 2017 Steven Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var tipAmount: UILabel!
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var billField: UITextField!
  @IBOutlet weak var tipControl: UISegmentedControl!

  @IBOutlet weak var splitByTwo: UILabel!
  @IBOutlet weak var splitByThree: UILabel!

  @IBOutlet weak var splitByFour: UILabel!
  @IBOutlet weak var splitByFive: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func onTap(_ sender: Any) {
    view.endEditing(true)
  }

  @IBAction func inputChanged(_ sender: Any) {
    self.calculateTip()
  }

  @IBAction func tipRateRadioUpdate(_ sender: Any) {
    self.calculateTip()
  }

  func calculateTip() {
    let tipPercentages = [0.15, 0.18, 0.2]
    let tipRate = tipPercentages[tipControl.selectedSegmentIndex]
    let billValue = Double(billField.text!) ?? 0
    let tip = billValue * tipRate
    let total = billValue + tip

    tipAmount.text = String(format: "$%.2f", tip)
    totalLabel.text = String(format: "$%.2f", total)
    splitByTwo.text = String(format: "$%.2f", total / 2 )
    splitByThree.text = String(format: "$%.2f", total / 3)
    splitByFour.text = String(format: "$%.2f", total / 4)
    splitByFive.text = String(format: "$%.2f", total / 5)
  }
}

