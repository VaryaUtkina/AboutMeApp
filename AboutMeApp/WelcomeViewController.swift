//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by Варвара Уткина on 25.11.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var userName: String!
    
    private let topColor = UIColor(
        red: 222 / 255,
        green: 144 / 255,
        blue: 200 / 255,
        alpha: 1
    )
    private let bottomColor = UIColor(
        red: 103 / 255,
        green: 132 / 255,
        blue: 211 / 255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: topColor, bottomColor: bottomColor)
        welcomeLabel.text = "Welcome, \(userName ?? "")!"
    }

}

// MARK: - Set background color
extension UIView {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
