//
//  RestaurantVisit.swift
//  tipsycalc
//
//  Created by Steven Young on 8/21/17.
//  Copyright © 2017 Steven Young. All rights reserved.
//

import Foundation
import os.log

class RestaurantVisit: NSObject, NSCoding {
  //MARK: Properties
  var restaurantName: String = ""
  var tipAmount: Double = 0.0
  var billAmount: Double = 0.0
  static var tipPercentages = [0.15, 0.18, 0.2]
  var tipRate: Double = 0.18

  //MARK: Initialization
  init?(name: String!, tip: Double!, bill: Double!) {
    print(name, tip, bill)
    self.restaurantName = name
    self.tipAmount = tip
    self.billAmount = bill
  }

  //MARK: NSCoding
  func encode(with aCoder: NSCoder) {
    aCoder.encode(restaurantName, forKey: PropertyKey.name)
    aCoder.encode(tipAmount, forKey: PropertyKey.tip)
    aCoder.encode(billAmount, forKey: PropertyKey.bill)
  }

  required convenience init?(coder aDecoder: NSCoder) {
    let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String
    let tip = aDecoder.decodeDouble(forKey: PropertyKey.tip)
    let bill = aDecoder.decodeDouble(forKey: PropertyKey.bill)
    self.init(name: name, tip: tip, bill: bill)
  }

  //MARK: Archiving Paths
  static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
  static let ArchiveURL = DocumentsDirectory.appendingPathComponent("visits")

  //MARK: Types
  struct PropertyKey {
    static let name = "name"
    static let tip = "tip"
    static let bill = "bill"
  }
}

