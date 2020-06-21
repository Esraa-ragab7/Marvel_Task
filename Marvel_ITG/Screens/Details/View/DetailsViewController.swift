//
//  DetailsViewController.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/20/20.
//

import UIKit
import Kingfisher
import CoreImage

class DetailsViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var headerView: DetailsHeaderView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    // MARk: - Properties
    private var viewModel: DetailsViewModel!
    var character: Character!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ShowDetailsCell", bundle: nil), forCellReuseIdentifier: "ShowDetailsCell")
        viewModel = DetailsViewModel(character: character, tableView: tableView)
        tableView.dataSource = viewModel
        
        backgroundImage.kf.setImage(with: character.thumbnail?.imageUrl)
        addBlur(1, backgroundImage)
        headerView.display(character: character)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Prepare For Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showImage" {
            let destination = segue.destination as! ShowImageViewController
            destination.data = (sender as! [Any])[0] as? [ShowType]
            destination.index = (sender as! [Any])[1] as? Int
        }
    }
    
    
}

// MARK: - ShowDetailsCellDelegate

extension DetailsViewController: ShowDetailsCellDelegate {
    func showImageWithIndex(data: [ShowType], index: Int) {
        performSegue(withIdentifier: "showImage", sender: [data, index])
    }
}

// MARK: - Private Functions & InterActions

extension DetailsViewController {
    private func addBlur(_ alpha: CGFloat = 0.5, _ imageView: UIImageView) {
        // create effect
        let effect = UIBlurEffect(style: .dark)
        let effectView = UIVisualEffectView(effect: effect)

        // set boundry and alpha
        effectView.frame = imageView.bounds
        effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        effectView.alpha = alpha

        imageView.addSubview(effectView)
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
