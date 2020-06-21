//
//  CharacterCell.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/20/20.
//

import UIKit
import Kingfisher

class CharacterCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Display Function
    
    func display(character: Character) {
        if let imageURL = character.thumbnail?.imageUrl {
            characterImageView.kf.indicatorType = .activity
            (characterImageView.kf.indicator?.view as? UIActivityIndicatorView)?.style = .large
            (characterImageView.kf.indicator?.view as? UIActivityIndicatorView)?.color = .white
            characterImageView.kf.setImage(with: imageURL, placeholder: nil, options: [.transition(.fade(0.7))])
        }
        nameLabel.text = character.name
    }
}
