//
//  ViewController.swift
//  ColourSwitcher
//
//  Created by Anna Lavrova on 01.02.2024.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func updateBackgroundView(color: UIColor)
}

class ViewController: UIViewController {

    weak var delegate: ViewControllerDelegate?

    var color = UIColor.white

    private var redValue: Float = 0
    private var greenValue: Float = 0
    private var blueValue: Float = 0

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

    @IBOutlet var valueTextField: [UITextField]!

    override func viewDidLoad() {
        super.viewDidLoad()

        redLabel.text = "Red"
        yellowLabel.text = "Yellow"
        greenLabel.text = "Green"

        colorView.layer.cornerRadius = 15

        setSlider(redColorSlider)
        setSlider(yellowColorSlider)
        setSlider(greenColorSlider)

        redLabelCount.text = String(format: "%.2f", redValue)
        yellowLabelCount.text = String(format: "%.2f", blueValue)
        greenLabelCount.text = String(format: "%.2f", greenValue)
    }

    @IBAction func getNumberOfRed() {
        redValue = redColorSlider.value
        valueTextField[0].text = String(format: "%.2f", redValue)
        redLabelCount.text = String(format: "%.2f", redValue)
        updateColor()
    }

    @IBAction func getNumberOfYellow() {
        blueValue = yellowColorSlider.value
        valueTextField[1].text = String(format: "%.2f", blueValue)
        yellowLabelCount.text = String(format: "%.2f", blueValue)
        updateColor()
    }

    @IBAction func getNumberOfGreen() {
        greenValue = greenColorSlider.value
        valueTextField[2].text = String(format: "%.2f", greenValue)
        greenLabelCount.text = String(format: "%.2f", greenValue)
        updateColor()
    }
    
    @IBAction func doneButtonTapped() {
        delegate?.updateBackgroundView(color: color)
        dismiss(animated: true)
    }

    @IBAction func redColorTextFieldDidEdited() {
        redValue = Float(valueTextField[0].text ?? "") ?? 0
        redColorSlider.value = redValue
        redLabelCount.text = String(format: "%.2f", redValue)
        updateColor()
    }
    
    @IBAction func greenColorTextFieldDidEdited() {
        greenValue = Float(valueTextField[2].text ?? "") ?? 0
        greenColorSlider.value = greenValue
        greenLabelCount.text = String(format: "%.2f", greenValue)
        updateColor()
    }
    
    @IBAction func blueColorTextFieldDidEdited() {
        blueValue = Float(valueTextField[1].text ?? "") ?? 0
        yellowColorSlider.value = blueValue
        yellowLabelCount.text = String(format: "%.2f", blueValue)
        updateColor()
    }

    @objc private func didTapDone() {
        view.endEditing(true)
    }

    func setSlider(_ slider: UISlider) {
        slider.minimumValue = 0
        slider.maximumValue = 255
        slider.value = 0
    }

    func updateColor() {
        color = UIColor(
            red: CGFloat(redValue) / 255,
            green: CGFloat(greenValue) / 255,
            blue: CGFloat(blueValue) / 255,
            alpha: 1.0
        )

        colorView.backgroundColor = color
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar

        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )

        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )

        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}

