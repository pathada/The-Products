//
//  ImageDownload.swift
//  The Products
//
//  Created by Padmaja Pathada on 5/13/23.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            //guard error == nil else { return }
            guard let self = self else { return }
            
            if let data = data, let downloadImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = downloadImage
                }
            }

        }.resume()
    }
    
}

