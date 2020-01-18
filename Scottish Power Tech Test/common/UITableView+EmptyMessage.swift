//
//  UITableView+EmptyMessage.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 18/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import UIKit

extension UITableView {
    
    func setEmptyView(emptyView: EmptyView) {
        self.backgroundView = emptyView
    }
    
    func restore() {
        self.backgroundView = nil
    }
    
}

