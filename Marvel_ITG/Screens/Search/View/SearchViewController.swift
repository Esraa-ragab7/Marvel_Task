//
//  SearchViewController.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/21/20.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var searchTableView: UITableView!
    
    // MARK: - Properties
    
    private var viewModel = SearchViewModel()
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.definesPresentationContext = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.delegate = self
        searchController.searchBar.placeholder = "Search"
        return searchController
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.delegate = viewModel
        searchTableView.dataSource = viewModel
        viewModel.delegate = self
        setUpNavigationItem()
        getSearchData(searchText: "A")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchController.isActive = true
    }
    
    // MARK: - Prepare For Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsScreen" {
            let destination = segue.destination as! DetailsViewController
            destination.character = (sender as! Character)
        }
    }
}

// MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        getSearchData(searchText: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - UISearchControllerDelegate

extension SearchViewController: UISearchControllerDelegate {
    func didPresentSearchController(_ searchController: UISearchController) {
        DispatchQueue.main.async { searchController.searchBar.becomeFirstResponder() }
    }
}

// MARK: - Private Functions

extension SearchViewController {
    
    // MARK: - GetSearchData
    
    private func getSearchData(searchText: String){
        APIClient.getCharchters(text: searchText, offset: 0, limit: 5) { (result) in
            switch result {
            case .success(let charactesResponse):
                self.viewModel.characters.append(contentsOf: charactesResponse.data?.characters ?? [])
                self.searchTableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - SetUp NavigationItem
    
    private func setUpNavigationItem() {
        navigationItem.hidesBackButton = true
        navigationItem.titleView = searchController.searchBar
    }
}

// MARK: - SearchViewModelDelegate

extension SearchViewController: SearchViewModelDelegate {
    func didSelect(character: Character) {
        performSegue(withIdentifier: "detailsScreen", sender: character)
    }
}
