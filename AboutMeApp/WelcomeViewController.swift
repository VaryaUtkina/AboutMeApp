//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by Варвара Уткина on 25.11.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var welcomeMessage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = welcomeMessage
        
        let gradientLayer = CAGradientLayer()
        let topColor = UIColor(
            red: 222 / 255,
            green: 144 / 255,
            blue: 200 / 255,
            alpha: 1
        )
        let bottomColor = UIColor(
            red: 103 / 255,
            green: 132 / 255,
            blue: 211 / 255,
            alpha: 1
        )
        
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)

    }

}
