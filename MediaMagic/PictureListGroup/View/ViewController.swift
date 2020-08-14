//
//  ViewController.swift
//  MediaMagic
//
//  Created by ABDUL KADIR ANSARI on 13/08/20.
//  Copyright © 2020 ABDUL KADIR ANSARI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var AuthorDataList = [dataList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "ImgListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImgListCollectionViewCell")
        
        if  ConnectionCheck.isConnectedToNetwork()
                      {
        
        postAction()
                        
        }else
        {
            self.showAlert(message: "No Internet Available.")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AuthorDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImgListCollectionViewCell", for: indexPath) as! ImgListCollectionViewCell
        
        let dirC = AuthorDataList[indexPath.row]
        
        cell.setUpUI(listData: dirC)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return  CGSize(width: (self.collectionView.frame.size.width/2) - 10, height: 150)
    }

    
    
   func postAction()
    {
        let task = URLSession.shared.dataTask(with: NSURL(string: "https://picsum.photos/list")! as URL, completionHandler: { (data, response, error) -> Void in
             do{
                let listArray = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [[String:AnyObject]]
                
                if listArray.count > 0{
                 
                for  dirC in listArray
                {
                let objectmovies = dataList(objectID: dirC)
                self.AuthorDataList.append(objectmovies)
                
                }
                    
                    if self.AuthorDataList.count != 0{
                        
                         DispatchQueue.main.async {
                    self.collectionView.reloadData()
                        }
                    }
                }
                
               
                
                print(self.AuthorDataList)
                
                
              
             }
             catch {
                 print("json error: \(error)")
             }
         })
         task.resume()
        
    }

}

