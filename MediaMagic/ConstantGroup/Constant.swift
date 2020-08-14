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

extension UIViewController{
    
//    func showHUD(){
//        let progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
//        progressHUD.label.text = "Loading.."
//        progressHUD.bezelView.color = UIColor.black // Your backgroundcolor
//        progressHUD.contentColor = UIColor.white
//
//    }
//
//    func dismissHUD(isAnimated:Bool) {
//        MBProgressHUD.hide(for: self.view, animated: isAnimated)
//    }
    
    
    func showAlertCallBack(message : String, result:@escaping (String)->()){
        let alertController = UIAlertController(title: "Test", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
            
            result("1")
        }
        
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
        
        
        
    }
    
    func showAlert(message : String)
    {
        let alertController = UIAlertController(title:  "Test", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
            //            print("You've pressed OK Button")
        }
        
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showAlertWithOption(message : String, result:@escaping (String)->())
    {
        let alertController = UIAlertController(title: "Test", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
            
            result("1")
        }
        
        let CancelAction = UIAlertAction(title: "No", style: .cancel) { action in
            
            result("0")
        }
        
        alertController.addAction(CancelAction)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
