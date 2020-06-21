//
//  RootViewController.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/19/20.
//

import UIKit

class RootViewController: UIViewController {

    // MARK: - Proerties
    
    var current: UIViewController
    
    // MARK: - Init
    
    init() {
        self.current = UIStoryboard(name: "SplashScreen", bundle: nil).instantiateViewController(withIdentifier: "SplashViewController")
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.current = UIStoryboard(name: "SplashScreen", bundle: nil).instantiateViewController(withIdentifier: "SplashViewController")
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - ViewController Life Cycle
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParent: self)
        
    }

}

// MARK: - private functions

extension RootViewController {
    
    private func animateDismissTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        current.willMove(toParent: nil)
        addChild(new)
        transition(from: current, to: new, duration: 0.3, options: [], animations: {
            new.view.frame = self.view.bounds
        }) { completed in
            self.current.removeFromParent()
            new.didMove(toParent: self)
            self.current = new
            completion?()
        }
    }
    
    func switchToMainScreen() {
        let mainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharacterViewController")
        let mainScreen = UINavigationController(rootViewController: mainViewController)
        
        let searchIcon = UIImage(named: "icn-nav-search-")
        let searchIconView = UIImageView(image:searchIcon)
        let rightButtonItem = UIBarButtonItem.init(customView: searchIconView)
        mainViewController.navigationItem.rightBarButtonItem = rightButtonItem
        
        let logo = UIImage(named: "icn-nav-marvel")
        let imageView = UIImageView(image:logo)
        mainViewController.navigationItem.titleView = imageView
        mainViewController.navigationController?.navigationBar.backgroundColor = UIColor.black
        mainViewController.navigationController?.navigationBar.barTintColor = UIColor.black
        
        animateDismissTransition(to: mainScreen)
    }
    
}
