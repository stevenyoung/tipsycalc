//
//  SettingsViewController.swift
//  tipsycalc
//
//  Created by Steven Young on 8/23/17.
//  Copyright © 2017 Steven Young. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

  var defaultTipRate: Double = 0.0
  @IBOutlet weak var tipControl: UISegmentedControl!

  @IBAction func handleTipControlUpdate(_ sender: Any) {
    self.updateTipSetting()
  }

  private func updateTipSetting() {
    let index = tipControl.selectedSegmentIndex
    let tipRate = RestaurantVisit.tipPercentages[index]
    UserDefaults.standard.set(tipRate, forKey: "tip_rate")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  override func viewDidAppear(_ animated: Bool) {
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
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    super.prepare(for: segue, sender: sender)
    guard let tipView = segue.destination as? ViewController
      else {
        fatalError("Unexpected destination: \(segue.destination)")
    }
    self.updateTipSetting()
    tipView.tipRate = UserDefaults.standard.double(forKey: "tip_rate")
  }
  
  
  
}
