//
//  ColorViewController.swift
//  ColourSwitcher
//
//  Created by Anna Lavrova on 27.02.2024.
//

import UIKit

class ColorViewController: UIViewController {

    private var color = UIColor.white

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as? ViewController

        viewController?.delegate = self
        viewController?.color = color
    }
}

extension ColorViewController: ViewControllerDelegate {

    func updateBackgroundView(color: UIColor) {
        self.color = color
        view.backgroundColor = color
        navigationController?.popViewController(animated: true)
    }
}
