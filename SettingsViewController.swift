//
//  SettingsViewController.swift
//  tipsycalc
//
//  Created by Steven Young on 8/23/17.
//  Copyright © 2017 Steven Young. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let defaults = UserDefaults.standard
    defaults.set(0.18, forKey: "tip_rate")
    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
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
    
    tipView.tipRate =
  }
  
  
  
}
