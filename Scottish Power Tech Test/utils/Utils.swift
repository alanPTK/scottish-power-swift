//
//  Utils.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import UIKit

class Utils: NSObject {
            
    static private let numberFormatter = NumberFormatter()    
    
    private override init() {
        super.init()
    }
    
    /* Return the symbol for the currency identifier, eg USD -> $ */
    class func symbolForCurrency(currency: String) -> String {
        let locale = NSLocale(localeIdentifier: currency)
        if let displayName = locale.displayName(forKey: NSLocale.Key.currencySymbol, value: currency) {
            return displayName
        }
        return ""
    }
    
    /* Format the price accordingly to the device locale  */
    class func formatPrice(price: Double) -> String {
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = ""
        if let formattedPrice = numberFormatter.string(from: price as NSNumber) {
            return formattedPrice.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        return String(price).trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /* Format the date */
    class func formatDate(date: String, formatFrom: String, formatTo: String) -> String {
        let formatterFrom = DateFormatter()
        formatterFrom.dateFormat = formatFrom
        
        let formatterTo = DateFormatter()
        formatterTo.dateFormat = formatTo
        
        if let returnDate = formatterFrom.date(from: date) {
            return formatterTo.string(from: returnDate)
        } else {
            return date
        }
    }
    
    /* Convert the seconds to hours, minutes and seconds components */
    class func formatSeconds(seconds: Int) -> (Int, Int, Int) {
      return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
}
