//
//  SearchViewModel.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/21/20.
//

import Foundation
import UIKit

// MARK: - SearchViewModel Protocol

protocol SearchViewModelDelegate {
    func didSelect(character: Character)
}

class SearchViewModel: NSObject {
    
    // MARK: - Properties
    
    var characters = [Character]()
    var delegate: SearchViewModelDelegate?
    
}

// MARK: - UITableViewDataSource

extension SearchViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as? SearchCell {
            cell.display(character: characters[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension SearchViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(character: characters[indexPath.row])
    }
}
