//
//  fullScreenImageCell.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/21/20.
//

import UIKit
import Kingfisher

class FullScreenImageCell: UICollectionViewCell {
    
    // MARK: - Outlets

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageNumber: UILabel!
    
    // MARK: - Display Function
    
    func display(showType: ShowType, index: Int, count: Int) {
        imageView.kf.setImage(with: showType.thumbnail.imageUrl)
        title.text = showType.title
        imageNumber.text = "\(index + 1)/\(count)"
    }
}
