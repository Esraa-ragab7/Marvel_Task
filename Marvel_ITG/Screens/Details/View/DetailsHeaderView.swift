//
//  DetailsHeaderView.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/20/20.
//

import UIKit
import Kingfisher

class DetailsHeaderView: UITableViewHeaderFooterView {

    // MARK: - Outlets
    
    @IBOutlet private weak var headerImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - Display Function
    
    func display(character: Character) {
        headerImageView.kf.setImage(with: character.thumbnail?.imageUrl)
        nameLabel.text = character.name
        descriptionLabel.text = character.description
    }
    
}
