//
//  ViewController.swift
//  ColourSwitcher
//
//  Created by Anna Lavrova on 01.02.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var yellowLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!

    @IBOutlet weak var redLabelCount: UILabel!
    @IBOutlet weak var yellowLabelCount: UILabel!
    @IBOutlet weak var greenLabelCount: UILabel!

    @IBOutlet weak var redColorSlider: UISlider!
    @IBOutlet weak var yellowColorSlider: UISlider!
    @IBOutlet weak var greenColorSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()

        redLabel.text = "Red"
        yellowLabel.text = "Yellow"
        greenLabel.text = "Green"

        colorView.layer.cornerRadius = 15

        setSlider(redColorSlider)
        setSlider(yellowColorSlider)
        setSlider(greenColorSlider)

        redLabelCount.text = "0.00"
        yellowLabelCount.text = "0.00"
        greenLabelCount.text = "0.00"
    }

    @IBAction func getNumberOfRed() {
        redLabelCount.text = String(format: "%.2f", redColorSlider.value)
        updateColor()
    }

    @IBAction func getNumberOfYellow() {
        yellowLabelCount.text = String(format: "%.2f", yellowColorSlider.value)
        updateColor()
    }

    @IBAction func getNumberOfGreen() {
        greenLabelCount.text = String(format: "%.2f", greenColorSlider.value)
        updateColor()
    }

    func setSlider(_ slider: UISlider) {
        slider.minimumValue = 0
        slider.maximumValue = 255
        slider.value = 0
    }

    func updateColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value) / 255,
            green: CGFloat(greenColorSlider.value) / 255,
            blue: CGFloat(yellowColorSlider.value) / 255,
            alpha: 1.0
        )
    }
}
