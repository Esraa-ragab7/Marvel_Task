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
    var tabelData: [[String: Any?]] = []
    
    init(character: Character, tableView: UITableView) {
        super.init()
        self.tableView = tableView
        self.character = character
        getCollections(character.comics.collectionURI, character.comics.available, 0)
        getCollections(character.series.collectionURI, character.series.available, 1)
        getCollections(character.stories.collectionURI, character.stories.available, 2)
        getCollections(character.events.collectionURI, character.events.available, 3)
        appendInShows("COMICS", [])
        appendInShows("SERIES", [])
        appendInShows("STORIES", [])
        appendInShows("EVENTS", [])
    }
}

extension DetailsViewModel {
    func appendInShows(_ title: String, _ showTypes: [ShowType]){
        shows.append(["title": title, "data": showTypes])
    }
}

extension DetailsViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tabelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ShowDetailsCell", for: indexPath) as? ShowDetailsCell {
            cell.display(showType: shows[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension DetailsViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension DetailsViewModel {
    
    func getCollections(_ url: String, _ limit: Int, _ key: Int) {
        APIClient.getCollections(limit: limit, url: url) { (result) in
            switch result {
            case .success(let res):
                self.shows[key]["data"] = res.data.results
                print(res.data.results.count)
                self.tabelData = self.shows.filter({ (dic) -> Bool in
                    if (dic["data"] as! [ShowType]).count > 0 {
                        return true
                    }
                    return false
                })
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
