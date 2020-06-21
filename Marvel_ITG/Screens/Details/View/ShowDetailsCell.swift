//
//  ShowDetailsCell.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/20/20.
//

import UIKit

protocol ShowDetailsCellDelegate {
    func showImageWithIndex(data:  [ShowType], index: Int)
}

class ShowDetailsCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var noItemsFound: UILabel!
    
    // MARK: - Properties
    var dalegate: ShowDetailsCellDelegate?
    var showTypes: [ShowType]!
    
    // MARK: - Display Function
    func display(showType: [String: Any?]) {
        collectionView.register(UINib(nibName: "ShowCell", bundle: nil), forCellWithReuseIdentifier: "ShowCell")
        titleLabel.text = showType["title"] as? String
        showTypes = showType["data"] as? [ShowType]
        if showType["loading"] as? Bool ?? false {
            noItemsFound.isHidden = true
            loading.isHidden = false
        } else if showTypes.count > 0 {
            noItemsFound.isHidden = true
            loading.isHidden = true
        } else {
            noItemsFound.isHidden = false
            loading.isHidden = true
            noItemsFound.text = "No \(showType["title"] as! String) Found!"
        }
        collectionView.reloadData()
    }
    
}

// MARK: - UICollectionViewDataSource

extension ShowDetailsCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return showTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowCell", for: indexPath) as? ShowCell {
            cell.display(showType: showTypes[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

// MARK: - UICollectionViewDelegate

extension ShowDetailsCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        AppDelegate.shared.rootViewController.present(constructShowImageViewControllerModal(index: indexPath.row), animated: true, completion: nil)
    }
    
    func constructShowImageViewControllerModal(index: Int) -> ShowImageViewController {
        let modalViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShowImageViewController") as! ShowImageViewController
        modalViewController.modalPresentationStyle = .overCurrentContext
        modalViewController.data = showTypes
        modalViewController.index = index
        
        return modalViewController
    }
}
