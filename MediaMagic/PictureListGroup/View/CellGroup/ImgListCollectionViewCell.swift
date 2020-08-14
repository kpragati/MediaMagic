//
//  ImgListCollectionViewCell.swift
//  MediaMagic
//
//  Created by ABDUL KADIR ANSARI on 13/08/20.
//  Copyright © 2020 ABDUL KADIR ANSARI. All rights reserved.
//

import UIKit

class ImgListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var imgName: UILabel!
    
    func setUpUI(listData : dataList){
        
        imgName.text = listData.imgName
        DispatchQueue.main.async {
            self.imgView.downloaded(from: "https://picsum.photos/300/300?image=" + listData.imgID)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
