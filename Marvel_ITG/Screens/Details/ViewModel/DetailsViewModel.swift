//
//  DetailsViewModel.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/20/20.
//

import Foundation
import UIKit

class DetailsViewModel: NSObject {
    
    // MARk: - Properties
    var character: Character!
    var shows: [[String: Any?]] = []
    var tableView: UITableView!
    
    init(character: Character, tableView: UITableView) {
        super.init()
        self.tableView = tableView
        self.character = character
        constructAllTheData()
    }
}

// MARK: - UITableViewDataSource

extension DetailsViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ShowDetailsCell", for: indexPath) as? ShowDetailsCell {
            cell.display(showType: shows[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - getCollections

extension DetailsViewModel {
    
    func getCollections(_ url: String, _ limit: Int, _ key: Int) {
        url != "" ? APIClient.getCollections(limit: limit, url: url) { (result) in
            switch result {
            case .success(let res):
                self.shows[key]["data"] = res.data.results
                self.shows[key]["loading"] = false
                self.tableView.reloadData()
            case .failure(let error):
                self.shows[key]["loading"] = false
                self.tableView.reloadData()
            }
            } : nil
    }
    
}

// MARK: - constructAllTheData

extension DetailsViewModel {
    private func constructAllTheData() {
        if character.comics?.available ?? 0 > 0 {
            getCollections(character.comics?.collectionURI ?? "", character.comics?.available ?? 0, shows.count)
            appendInShows("COMICS", [], true)
        }
        if character.series?.available ?? 0 > 0 {
            getCollections(character.series?.collectionURI ?? "", character.series?.available ?? 0, shows.count)
            appendInShows("SERIES", [], true)
        }
        if character.stories?.available ?? 0 > 0 {
            getCollections(character.stories?.collectionURI ?? "", character.stories?.available ?? 0, shows.count)
            appendInShows("STORIES", [], true)
        }
        if character.events?.available ?? 0 > 0 {
            getCollections(character.events?.collectionURI ?? "", character.events?.available ?? 0, shows.count)
            appendInShows("EVENTS", [], true)
        }
    }
    
    func appendInShows(_ title: String, _ showTypes: [ShowType], _ loading: Bool){
        shows.append(["title": title, "data": showTypes, "loading": loading])
    }
}
