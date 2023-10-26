
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var modeSwitch: UISwitch!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var numberTextField1: UITextField!
    @IBOutlet weak var numberTextField2: UITextField!
    
    
    var currentMode: CalculationMode = .LCD
    
    enum CalculationMode {
        case LCD
        case GCD
    }
    
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn {
            currentMode = .GCD
            modeLabel.text = "Mode: Greatest Common Denominator"
        } else {
            currentMode = .LCD
            modeLabel.text = "Mode: Least Common Divisor"
        }
    }
    
   
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        if let number1 = Int(numberTextField1.text ?? ""), let number2 = Int(numberTextField2.text ?? "") {
            switch currentMode {
            case .LCD:
                resultLabel.text = "Result: \(calculateLCD(a: number1, b: number2))"
            case .GCD:
                resultLabel.text = "Result: \(calculateGCD(a: number1, b: number2))"
            }
        }
    }
    
    func calculateLCD(a: Int, b: Int) -> Int {
        var x = a
        var y = b
        while y != 0 {
            let temp = y
            y = x % y
            x = temp
        }
        return abs(x)
    }
    
    func calculateGCD(a: Int, b: Int) -> Int {
        return (a * b) / calculateLCD(a: a, b: b)
    }
}
