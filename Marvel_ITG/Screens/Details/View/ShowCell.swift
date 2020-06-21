//
//  ShowCell.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/20/20.
//

import UIKit
import Kingfisher

class ShowCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func display(showType: ShowType){
        imageView.kf.setImage(with:  showType.thumbnail.imageUrl)
        titleLabel.text = showType.title
    }
}
