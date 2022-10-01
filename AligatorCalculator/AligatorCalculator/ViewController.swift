//
//  ViewController.swift
//  AligatorCalculator
//
//  Created by Eymen Varilci on 27.09.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - PROPERTIES
    var secondNumber = 0
    var firstNumber = 0
    var resultNumber = 0
    // Labels
    @IBOutlet weak var lastResultLabel: UILabel!
    @IBOutlet weak var calculationsLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // retrieving last result data from userdefaults
        lastResultLabel.text = UserDefaults.standard.object(forKey: "lastResult") as? String ?? "0"
        buttonsStyle()
        calculationsLabel.text = "0"
    }
    // MARK: - BUTTON CUSTOMIZATIONS
    // under this method I customize buttons according to their layout and functions
    func buttonsStyle() {
        
        buttons[0].layer.cornerRadius = 39
        buttons[0].backgroundColor = UIColor(hexString: "#9f9f9f")
        buttons[0].tintColor = UIColor.black
        
        buttons[2].layer.cornerRadius = 39
        buttons[2].backgroundColor = UIColor(hexString: "#9f9f9f")
        buttons[2].tintColor = UIColor.black
        
        buttons[3].layer.cornerRadius = 39
        buttons[3].backgroundColor = UIColor(hexString: "#f69906")
        buttons[3].tintColor = UIColor.black
        
        buttons[4].layer.cornerRadius = 39
        buttons[4].backgroundColor = UIColor(hexString: "#313131")
        buttons[4].tintColor = UIColor.white
        
        buttons[5].layer.cornerRadius = 39
        buttons[5].backgroundColor = UIColor(hexString: "#313131")
        buttons[5].tintColor = UIColor.white
        
        buttons[6].layer.cornerRadius = 39
        buttons[6].backgroundColor = UIColor(hexString: "#313131")
        buttons[6].tintColor = UIColor.white
        
        buttons[7].layer.cornerRadius = 39
        buttons[7].backgroundColor = UIColor(hexString: "#f69906")
        buttons[7].tintColor = UIColor.white
        
        buttons[8].layer.cornerRadius = 39
        buttons[8].backgroundColor = UIColor(hexString: "#313131")
        buttons[8].tintColor = UIColor.white
        
        buttons[9].layer.cornerRadius = 39
        buttons[9].backgroundColor = UIColor(hexString: "#313131")
        buttons[9].tintColor = UIColor.white
        
        buttons[10].layer.cornerRadius = 39
        buttons[10].backgroundColor = UIColor(hexString: "#313131")
        buttons[10].tintColor = UIColor.white
        
        
        buttons[11].layer.cornerRadius = 39
        buttons[11].backgroundColor = UIColor(hexString: "#f69906")
        buttons[11].tintColor = UIColor.white
        
        buttons[12].layer.cornerRadius = 39
        buttons[12].backgroundColor = UIColor(hexString: "#313131")
        buttons[12].tintColor = UIColor.white
        
        buttons[13].layer.cornerRadius = 39
        buttons[13].backgroundColor = UIColor(hexString: "#313131")
        buttons[13].tintColor = UIColor.white
        
        buttons[14].layer.cornerRadius = 39
        buttons[14].backgroundColor = UIColor(hexString: "#313131")
        buttons[14].tintColor = UIColor.white
        
        buttons[15].layer.cornerRadius = 39
        buttons[15].backgroundColor = UIColor(hexString: "#f69906")
        buttons[15].tintColor = UIColor.white
        
        buttons[16].layer.cornerRadius = 39
        buttons[16].backgroundColor = UIColor(hexString: "#313131")
        buttons[16].tintColor = UIColor.white
        
        buttons[17].layer.cornerRadius = 39
        buttons[17].backgroundColor = UIColor(hexString: "#313131")
        buttons[17].tintColor = UIColor.white
        
        buttons[18].layer.cornerRadius = 39
        buttons[18].backgroundColor = UIColor(hexString: "#f69906")
        buttons[18].tintColor = UIColor.white
        
        buttons[1].layer.cornerRadius = 39
        buttons[1].backgroundColor = UIColor(hexString: "#9f9f9f")
        buttons[1].tintColor = UIColor.white
    }
    
    // MARK: - NUMBER PAD METHODS
    // this is an IBAction collection. That means I've connected multiple number button to single outlet. This returns array of buttons.
    @IBAction private func digitsTapped(_ sender: UIButton) {
        guard let currentTitle = Int(sender.currentTitle!) else {
            return
        }
        if calculationsLabel.text == "0" {
            calculationsLabel.text = "\(currentTitle)"
        } else if let text = calculationsLabel.text {
            calculationsLabel.text = "\(text)\(currentTitle)"
            secondNumber = Int(calculationsLabel.text!)!
        }
    }
    
    // MARK: - OPERATIONS BUTTONS METHODS
    // this is an IBAction collection. That means I've connected multiple operations button to single outlet. This returns array of buttons.
    @IBAction private func operantTapped(_ sender: UIButton) {
        // this takes input number, change it to Int then assign it to firstNumber
        if let text = calculationsLabel.text, let value = Int(text), firstNumber == 0  {
            firstNumber = value
        }
        
        // this takes input number, change it to Int then assign it to secondNumber
        if let text = calculationsLabel.text, let value = Int(text) {
            secondNumber = value
        }
        // getting operations button's title to differetiate it's purpose
        guard let currentTitle = sender.currentTitle else {
            return
        }
        // according to our button's title we handle operations
        switch currentTitle {
        case "X":
            let result = firstNumber * secondNumber
            resultNumber = result
            calculationsLabel.text = "0"
        case ":":
            let result = firstNumber / secondNumber
            resultNumber = result
            calculationsLabel.text = "0"
        case "-":
            let result = (firstNumber - secondNumber)
            resultNumber = result
            calculationsLabel.text = "0"
        case "+":
            let result = firstNumber + secondNumber
            resultNumber = result
            calculationsLabel.text = "0"
        case "=":
            calculationsLabel.text = "\(resultNumber)"
            lastResultLabel.text = "\(resultNumber)"
            // saving last result to userdefault
            UserDefaults.standard.setValue(lastResultLabel.text, forKey: "lastResult")
        case "+/-":
            // either - or + of your current number
            calculationsLabel.text = "\(secondNumber - (secondNumber * 2))"
            // divides typed number by 100
        case "%":
            calculationsLabel.text = "\(secondNumber / 100)"
            
        default:
            break
        }
    }
    // clears up everything except lastResult
    @IBAction func clearButton(_ sender: Any) {
        calculationsLabel.text = "0"
        firstNumber = 0
        resultNumber = 0
        secondNumber = 0
    }
}

