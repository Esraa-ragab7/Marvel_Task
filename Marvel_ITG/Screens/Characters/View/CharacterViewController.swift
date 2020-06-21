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
    var limit = 20
    var offset = 0
    var availableItems = true
    var loadingView: UIView!
    var offline = false
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charactersTableView.dataSource = viewModel
        charactersTableView.delegate = viewModel
        viewModel.delegate = self
        charactersTableView.separatorStyle = .none
        charactersTableView.backgroundColor = UIColor.darkGray
        loadingViewSetup()
        loadData(offset: offset, limit: limit)
        navigationItem.rightBarButtonItem?.customView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onBarButtonItemClicked)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsScreen" {
            let destination = segue.destination as! DetailsViewController
            destination.character = (sender as! Character)
        }
    }
}

// MARK: - Interactions & Load Data
extension CharacterViewController {
    private func loadData(offset: Int, limit: Int) {
        charactersTableView.tableFooterView = loadingView
        charactersTableView.tableFooterView?.frame = .init(x: 0, y: 0, width: charactersTableView.frame.width, height: 100)

        APIClient.getCharchters(offset: offset, limit: limit) { (result) in
            switch result {
            case .success(let charactesResponse):
                self.viewModel.characters.append(contentsOf: charactesResponse.data?.characters ?? [])
                self.availableItems = charactesResponse.data?.total ?? 0 > ((offset + 1) * limit)
                RealmSingletoneManager.addCharactersR(charactersR: RealmSingletoneManager.convertFromCharactersToCharactersR(characters: charactesResponse.data?.characters ?? []), completionHandler: {_,_,_  in})
                self.charactersTableView.reloadData()
            case .failure( _):
                self.offline = true
                self.viewModel.characters = RealmSingletoneManager.getCharacter()
                self.charactersTableView.reloadData()
            }
            self.charactersTableView.tableFooterView = nil
        }
    }
    
    private func loadingViewSetup(){
        loadingView = (UINib(nibName: "LoadingView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! UIView)
    }
    
    @objc func onBarButtonItemClicked() {
        performSegue(withIdentifier: "searchView", sender: nil)
    }
}

// MARK: - CharactersDelegate

extension CharacterViewController: CharactersDelegate {
    func loadMoreData() {
        availableItems && !offline ? loadData(offset: offset + 1, limit: limit) : nil
    }
    
    func didSelect(character: Character) {
        performSegue(withIdentifier: "detailsScreen", sender: character)
    }
}
