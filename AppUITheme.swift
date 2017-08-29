//
//  AppUITheme.swift
//  tipsycalc
//
//  Created by Steven Young on 8/27/17.
//  Copyright © 2017 Steven Young. All rights reserved.
//

import UIKit

enum Theme: Int {
  case `default`, dark, light
  private enum Keys {
    static let selectedTheme = "SelectedTheme"
  }

  static var current: Theme {
    let storedTheme = UserDefaults.standard.integer(forKey: Keys.selectedTheme)
    return Theme(rawValue: storedTheme) ?? .default
  }

  var mainColor: UIColor {
    switch self {
    case .default:
      return UIColor.darkText
    case .dark:
      return UIColor.lightText
    case .light:
      return UIColor.blue
    }
  }

  var backGroundColor: UIColor {
    switch self {
    case .default:
      return UIColor.cyan
    case .dark:
      return UIColor.gray
    case .light:
      return UIColor.cyan
    }
  }

  func apply(view: UIView) {
    UserDefaults.standard.set(rawValue, forKey: Keys.selectedTheme)
    UserDefaults.standard.synchronize()
    print("theme apply", view)
    let theme: String = UserDefaults.standard.string(forKey: Keys.selectedTheme)!
    if (theme == "1") {
      view.backgroundColor = UIColor.darkText
      view.tintColor = UIColor.lightText
    } else {
      view.backgroundColor = UIColor.white
      view.tintColor = UIColor(red: 0.0/255.0,
                               green: 122.0/255.0,
                               blue: 255.0/255.0,
                               alpha: 1.0)
    }
  }
}
