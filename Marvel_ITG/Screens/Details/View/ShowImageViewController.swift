//
//  ShowImageViewController.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/21/20.
//

import UIKit

class ShowImageViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    // MARk: - Properties
    private var viewModel: ShowImageViewModel!
    var data: [ShowType]!
    var index: Int!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ShowImageViewModel(collectionData: data, index: index)
        imageCollectionView.dataSource = viewModel
        imageCollectionView.layoutIfNeeded()
        imageCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .right, animated: false)
    }

    // MARK: - Actions
    
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
