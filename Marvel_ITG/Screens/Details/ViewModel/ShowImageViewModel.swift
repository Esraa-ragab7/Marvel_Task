//
//  ShowImageViewModel.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/21/20.
//

import Foundation
import UIKit

class ShowImageViewModel: NSObject {
    
    // MARK: - Properties
    
    var collectionData: [ShowType]!
    var index: Int!
    
    init(collectionData: [ShowType], index: Int) {
        super.init()
        self.collectionData = collectionData
        self.index = index
    }
    
}

// MARK: - UICollectionViewDataSource

extension ShowImageViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FullScreenImageCell", for: indexPath) as? FullScreenImageCell {
            cell.display(showType: collectionData[indexPath.row], index: indexPath.row, count: collectionData.count)
            return cell
        }
        return UICollectionViewCell()
    }
}
