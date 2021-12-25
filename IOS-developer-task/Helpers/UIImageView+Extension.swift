//
//  UIImageView+Extension.swift
//  IOS-developer-task
//
//  Created by Elsaadany on 25/12/2021.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func showImage(url: String?) {
        guard let urlStr = url else {return}
        image = nil
        let key = NSString(string: urlStr)
        if let imageForCache = imageCache.object(forKey: key) as? UIImage {
            self.image = imageForCache
            return
        }
        
        if let url = URL(string: url ?? "") {
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main thread
                    let imageToCache = UIImage(data: data)
                    imageCache.setObject(imageToCache!, forKey: key)
                    self?.image = imageToCache
                }
            }
            task.resume()
        }
        
    }
}
