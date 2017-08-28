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

  func apply() {
    UserDefaults.standard.set(rawValue, forKey: Keys.selectedTheme)
    UserDefaults.standard.synchronize()
//    UIApplication.shared.delegate?.window??.tintColor = mainColor
//    UIApplication.shared.delegate?.window??.backgroundColor = backGroundColor
  }
}
