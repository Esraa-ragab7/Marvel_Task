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

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dalegate: ShowDetailsCellDelegate?
    var showTypes: [ShowType]!
    
    override func prepareForReuse() {
        showTypes = nil
    }
    
    func display(showType: [String: Any?]) {
        collectionView.register(UINib(nibName: "ShowCell", bundle: nil), forCellWithReuseIdentifier: "ShowCell")
        titleLabel.text = showType["title"] as? String
        showTypes = showType["data"] as? [ShowType]
        print(showTypes.count)
        collectionView.reloadData()
    }
    
}

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

extension ShowDetailsCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let modalViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShowImageViewController") as! ShowImageViewController
        modalViewController.modalPresentationStyle = .overCurrentContext
        modalViewController.data = showTypes
        modalViewController.index = indexPath.row
        AppDelegate.shared.rootViewController.present(modalViewController, animated: true, completion: nil)
    }
}
