//
//  CharacterViewModel.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/20/20.
//

import Foundation
import UIKit

protocol CharactersDelegate {
    func loadMoreData()
    func didSelect(character: Character)
}

class CharacterViewModel: NSObject {
    
    // MARK: - Properties
    
    var characters = [Character]()
    var delegate: CharactersDelegate?
    
}

// MARK: - UITableViewDataSource

extension CharacterViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == characters.count - 1 {
            delegate?.loadMoreData()
        }
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CharactersCell", for: indexPath) as? CharacterCell {
            cell.display(character: characters[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension CharacterViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(character: characters[indexPath.row])
    }
}
