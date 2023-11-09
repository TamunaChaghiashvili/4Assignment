import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateFactorials()
    }
    
    func generateRandomNumber() -> Int {
        return Int.random(in: 20...50)
    }
    
    func calculateFactorial(_ number: Int, completion: @escaping (Int) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            var result = 1
            for i in 1...number {
                
                if result > Int.max / i {
                    print("Factorial calculation overflowed. Returning -1.")
                    completion(-1)
                    return
                }
                result *= i
            }
            completion(result)
        }
    }
    
    func calculateFactorials() {
        let firstNumber = generateRandomNumber()
        let secondNumber = generateRandomNumber()
        
        calculateFactorial(firstNumber) { result in
            if result >= 0 {
                print("Factorial of the first number (\(firstNumber)) is: \(result)")
            }
        }
        
        calculateFactorial(secondNumber) { result in
            if result >= 0 {
                print("Factorial of the second number (\(secondNumber)) is: \(result)")
            }
        }
        
        // Winner thread
        let winnerThread = Thread.isMainThread ? "Main Thread" : "Background Thread"
        print("Winner thread is: \(winnerThread)")
    }
}

