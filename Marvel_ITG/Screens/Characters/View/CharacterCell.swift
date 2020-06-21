//
//  CharacterCell.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/20/20.
//

import UIKit
import Kingfisher

class CharacterCell: UITableViewCell {

    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterImageView.image = nil
    }
    
    func display(character: Character) {
        characterImageView.kf.setImage(with: character.thumbnail?.imageUrl, placeholder: nil)
        nameLabel.text = character.name
    }
}
