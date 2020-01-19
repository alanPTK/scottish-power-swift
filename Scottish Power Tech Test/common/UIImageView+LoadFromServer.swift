//
//  UIImageView+LoadFromServer.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import UIKit

//temporary cache
let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {
    
    func loadImage(withUrl urlString : String) {
        let url = URL(string: urlString)
        self.image = UIImage(named: "thumbnail")

        // check if image exists in cache
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = cachedImage
            
            return
        }

        // if the image don't exists, download from url
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                DispatchQueue.main.async {
                    self.image = UIImage(named: "thumbnail")
                }
                return
            }

            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    
                    self.image = image
                }
            }
        }).resume()
    }
    
}
