//
//  ViewController.swift
//  tipsycalc
//
//  Created by Steven Young on 8/9/17.
//  Copyright © 2017 Steven Young. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController {

  @IBOutlet weak var tipAmount: UILabel!
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var billField: UITextField!
  @IBOutlet weak var tipControl: UISegmentedControl!

  @IBOutlet weak var splitByTwo: UILabel!
  @IBOutlet weak var splitByThree: UILabel!

  @IBOutlet weak var splitByFour: UILabel!
  @IBOutlet weak var splitByFive: UILabel!
  @IBAction func saveButton(_ sender: Any) {
    self.saveRestaurantVisit()
  }

  var thisVisit: RestaurantVisit!
  var tipRate: Double? = 0.15

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a  nib.
    self.thisVisit = RestaurantVisit(name: "Eat@Joes", tip: self.tipRate, bill: 0.0)

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func onTap(_ sender: Any) {
    //uncomment to hide numeric keyboard
    //view.endEditing(true)
  }

  @IBAction func billFieldUpdate(_ sender: Any) {
     self.calculateTip()
  }


  @IBAction func tipRateRadioUpdate(_ sender: Any) {
    self.calculateTip()
  }

  func calculateTip() {
    let tipPercentages = RestaurantVisit.tipPercentages
    let tipRate = tipPercentages[tipControl.selectedSegmentIndex]
    let billValue = Double(billField.text!) ?? 0
    let tip = billValue * tipRate
    let total = billValue + tip

    self.thisVisit.tipAmount = tip
    self.thisVisit.billAmount = total
    self.thisVisit.tipRate = tipRate

    tipAmount.text = String(format: "$%.2f", tip)
    totalLabel.text = String(format: "$%.2f", total)
    splitByTwo.text = String(format: "$%.2f", total / 2 )
    splitByThree.text = String(format: "$%.2f", total / 3)
    splitByFour.text = String(format: "$%.2f", total / 4)
    splitByFive.text = String(format: "$%.2f", total / 5)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    let tipRate = UserDefaults.standard.double(forKey: "tip_rate")
    switch tipRate {
    case 0.15:
      tipControl.selectedSegmentIndex = 0
    case 0.18:
      tipControl.selectedSegmentIndex = 1
    case 0.2:
      tipControl.selectedSegmentIndex = 2
    default:
      print(UserDefaults.standard.double(forKey: "tip_rate"))
    }
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("view did appear")
    //    let defaults = UserDefaults.standard
    //    let tip_rate = defaults.double(forKey: "tip_rate")
    self.calculateTip()
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("view will disappear")
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("view did disappear")
  }

  private func saveRestaurantVisit() {
    let tip = Double(self.tipAmount.text!)
    let bill = Double(self.billField.text!)
    let visit = RestaurantVisit(name: "Eat@Joes", tip: tip, bill: bill)
    print("saving visit", visit ?? "not?")
    let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(visit, toFile: RestaurantVisit.ArchiveURL.path)
    if isSuccessfulSave {
      os_log("visit saved", log: OSLog.default, type: .debug)
    } else {
      os_log("failed to save visit", log: OSLog.default, type: .debug)
    }
    //    visit.save()
  }
}

struct RestaurantVisitDescription {
  var spot: String
  var tipAmountText: String!
  var totalText: String!
  func save() -> Void {

    print("saving visit", spot, tipAmountText, totalText)
  }
}
