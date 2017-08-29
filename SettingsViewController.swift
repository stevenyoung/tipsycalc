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
  var defaultThemeTitle: String = "Light"

  @IBOutlet weak var tipControl: UISegmentedControl!
  @IBOutlet weak var themeControl: UISegmentedControl!

  @IBOutlet weak var rateControlLabel: UILabel!
  @IBOutlet weak var themeControlLabel: UILabel!

  @IBAction func handleTipControlUpdate(_ sender: Any) {
    self.updateTipSetting()
  }

  @IBAction func handleThemeControlChange(_ sender: Any) {
    self.updateSelectedTheme()
  }

  private func updateSelectedTheme() {
    let themeValues: [String] = ["dark", "light"]
    switch themeValues[themeControl.selectedSegmentIndex] {
    case "dark":
      Theme.dark.apply(view: self.view)
      self.themeControlLabel.textColor = UIColor.lightText
      self.rateControlLabel.textColor = UIColor.lightText

    case "light":
      Theme.light.apply(view: self.view)
      self.themeControlLabel.textColor = UIColor.darkText
      self.rateControlLabel.textColor = UIColor.darkText

    default:
      Theme.default.apply(view: self.view)
    }
  }

  private func updateTipSetting() {
    let rate = RestaurantVisit.tipPercentages[tipControl.selectedSegmentIndex]
    UserDefaults.standard.set(rate, forKey: "tipRate")
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
    super.viewDidAppear(animated)
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

    let selectedTheme = UserDefaults.standard.integer(forKey: "SelectedTheme")
    if (selectedTheme > 0) {
      themeControl.selectedSegmentIndex = selectedTheme - 1
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
    tipView.tipRate = UserDefaults.standard.double(forKey: "tipRate")
  }
}
