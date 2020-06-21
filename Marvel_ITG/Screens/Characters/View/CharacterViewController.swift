//
//  CharacterViewController.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/20/20.
//

import UIKit

class CharacterViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var charactersTableView: UITableView!
    
    // MARK: - Properties
    private var viewModel = CharacterViewModel()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charactersTableView.dataSource = viewModel
        charactersTableView.delegate = viewModel
        viewModel.delegate = self
        charactersTableView.separatorStyle = .none
        charactersTableView.backgroundColor = UIColor.darkGray
        
        loadData(offset: 0, limit: 10)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
}

extension CharacterViewController {
    func loadData(offset: Int, limit: Int) {
        APIClient.getCharchters(offset: offset, limit: limit) { (result) in
            switch result {
            case .success(let charactesResponse):
                self.viewModel.characters.append(contentsOf: charactesResponse.data?.characters ?? [])
                self.charactersTableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsScreen" {
            let destination = segue.destination as! DetailsViewController
            destination.character = (sender as! Character)
        }
    }
}

extension CharacterViewController: CharactersDelegate {
    func didTapSearch() {
        
    }
    
    func didTapCancelSearch() {

    }
    
    func didSelect(character: Character) {
        performSegue(withIdentifier: "detailsScreen", sender: character)
    }
}
