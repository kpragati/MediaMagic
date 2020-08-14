//
//  Constant.swift
//  MediaMagic
//
//  Created by ABDUL KADIR ANSARI on 13/08/20.
//  Copyright © 2020 ABDUL KADIR ANSARI. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {

func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleToFill) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
    contentMode = mode
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard
            let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
            let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
            let data = data, error == nil,
            let image = UIImage(data: data)
            else { return }
        DispatchQueue.main.async() {
            self.image = image
        }
        }.resume()
}
func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleToFill) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
    guard let url = URL(string: link) else { return }
    downloaded(from: url, contentMode: mode)
}

}