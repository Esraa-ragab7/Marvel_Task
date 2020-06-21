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
    private var viewModel = CharacterViewModel(useCase: useCase)
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

// MARK: - Interactions

private extension CharacterViewController {
    
//    @IBAction func didTapSearchButtonItem(_ sender: UIBarButtonItem) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let controller = storyboard.instantiateViewController(withIdentifier: "\(SearchViewController.self)")
//        navigationController?.pushViewController(controller, animated: true)
//    }
}
