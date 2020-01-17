//
//  AppDelegate.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let trackApi = TrackAPI()        
        let apiLoader = APILoader(apiRequest: trackApi)
        apiLoader.loadAPIRequest(requestData: [:]) { (response, error) in
            print(response as Any)
        }                
        
        return true
    }

}
