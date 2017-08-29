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

  @IBOutlet weak var tipLabel: UILabel!
  @IBOutlet weak var tipAmount: UILabel!
  @IBOutlet weak var totalDisplay: UILabel!
  @IBOutlet weak var billField: UITextField!
  @IBOutlet weak var tipControl: UISegmentedControl!

  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var splitByTwo: UILabel!
  @IBOutlet weak var splitByThree: UILabel!
  @IBOutlet weak var splitByFour: UILabel!
  @IBOutlet weak var splitByFive: UILabel!
  @IBOutlet weak var splitByTwoLabel: UILabel!
  @IBOutlet weak var splitByThreeLabel: UILabel!
  @IBOutlet weak var splitByFourLabel: UILabel!
  @IBOutlet weak var splitByFiveLabel: UILabel!

  @IBAction func saveButton(_ sender: Any) {
    self.saveRestaurantVisit()
  }

  var thisVisit: RestaurantVisit!
  var tipRate: Double? = 0.15

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a  nib.
    self.billField.becomeFirstResponder()
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

    tipAmount.text = String(format: "$%.2f", tip)
    totalDisplay.text = String(format: "$%.2f", total)
    splitByTwo.text = String(format: "$%.2f", total / 2 )
    splitByThree.text = String(format: "$%.2f", total / 3)
    splitByFour.text = String(format: "$%.2f", total / 4)
    splitByFive.text = String(format: "$%.2f", total / 5)

    self.saveBillAmount()
  }

  private func saveBillAmount() {
    let defaults = UserDefaults.standard
    let billValue = Double(billField.text!) ?? 0
    defaults.set(billValue, forKey: "billAmount")
    defaults.synchronize()
  }

  private func getSavedBillAmount() -> Double {
    return UserDefaults.standard.double(forKey: "billAmount")
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    let tipRate = UserDefaults.standard.double(forKey: "tipRate")
    switch tipRate {
    case 0.15:
      tipControl.selectedSegmentIndex = 0
    case 0.18:
      tipControl.selectedSegmentIndex = 1
    case 0.2:
      tipControl.selectedSegmentIndex = 2
    default:
      print("tipRate:", UserDefaults.standard.double(forKey: "tipRate"))
    }
    self.updateSelectedTheme()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
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
    let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(
      visit,
      toFile: RestaurantVisit.ArchiveURL.path)
    if isSuccessfulSave {
      os_log("visit saved", log: OSLog.default, type: .debug)
    } else {
      os_log("failed to save visit", log: OSLog.default, type: .debug)
    }
    //    visit.save()
  }

  private func updateSelectedTheme() {
    let themeValues: [String] = ["dark", "light"]
    let selectThemed = UserDefaults.standard.integer(forKey: "SelectedTheme")
    print("current", UserDefaults.standard.integer(forKey: "SelectedTheme"))
    switch themeValues[selectThemed - 1] {
    case "dark":
      Theme.dark.apply(view: self.view)
      self.tipLabel.textColor = UIColor.lightText
      self.tipAmount.textColor = UIColor.lightText
      self.totalDisplay.textColor = UIColor.lightText
      self.splitByTwo.textColor = UIColor.lightText
      self.splitByThree.textColor = UIColor.lightText
      self.splitByFour.textColor = UIColor.lightText
      self.splitByFive.textColor = UIColor.lightText
      self.totalLabel.textColor = UIColor.lightText
      self.splitByTwoLabel.textColor = UIColor.lightText
      self.splitByThreeLabel.textColor = UIColor.lightText
      self.splitByFourLabel.textColor = UIColor.lightText
      self.splitByFiveLabel.textColor = UIColor.lightText

    case "light":
      Theme.light.apply(view: self.view)
      self.tipLabel.textColor = UIColor.darkText
      self.tipAmount.textColor = UIColor.darkText
      self.totalDisplay.textColor = UIColor.darkText
      self.splitByTwo.textColor = UIColor.darkText
      self.splitByThree.textColor = UIColor.darkText
      self.splitByFour.textColor = UIColor.darkText
      self.splitByFive.textColor = UIColor.darkText
      self.totalLabel.textColor = UIColor.darkText
      self.splitByTwoLabel.textColor = UIColor.darkText
      self.splitByThreeLabel.textColor = UIColor.darkText
      self.splitByFourLabel.textColor = UIColor.darkText
      self.splitByFiveLabel.textColor = UIColor.darkText
      
    default:
      Theme.default.apply(view: self.view)
    }
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
