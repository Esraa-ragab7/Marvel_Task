//
//  SplashViewController.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/19/20.
//

import UIKit

class SplashViewController: UIViewController {
    
    // MARK: - Properties
    
    private let splashScreenTimerLenght = 1700
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter()
    }

}

// MARK: - private functions

extension SplashViewController {
    
    private func counter() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(splashScreenTimerLenght)) {
            AppDelegate.shared.rootViewController.switchToMainScreen()
        }
    }
    
}
