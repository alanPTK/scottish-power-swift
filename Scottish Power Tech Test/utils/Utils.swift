//
//  Utils.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import UIKit

class Utils: NSObject {
        
    static let shared = Utils()
    private let formatter = NumberFormatter()
    
    private override init() {
        super.init()
    }
    
    /* Return the symbol for the currency identifier, eg USD -> US$ */
    func symbolForCurrency(currency: String) -> String {
        let locale = NSLocale(localeIdentifier: currency)
        if let displayName = locale.displayName(forKey: NSLocale.Key.currencySymbol, value: currency) {
            return displayName
        }
        return ""
    }
    
    /* Format the price accordingly to the device locale  */
    func formatPrice(price: Double) -> String {
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        if let formattedPrice = formatter.string(from: price as NSNumber) {
            return formattedPrice
        }
        return String(price)
    }
    
}
