//
//  fullScreenImageCell.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/21/20.
//

import UIKit
import Kingfisher

class fullScreenImageCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageNumber: UILabel!
    
    func display(showType: ShowType, index: Int, count: Int) {
        imageView.kf.setImage(with: showType.thumbnail.imageUrl)
        title.text = showType.title
        imageNumber.text = "\(index)/\(count)"
    }
}
