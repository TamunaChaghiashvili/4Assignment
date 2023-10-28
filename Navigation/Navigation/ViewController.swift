import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signInButton: UIButton!
    
//    private let usernameTextField = UITextField()
//    private let passwordTextField = UITextField()
//    private let signInButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // singIn
        usernameTextField.placeholder = "Username"
        passwordTextField.placeholder = "Password"
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)

        
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)

    }

    @objc func signInButtonTapped() {
        let homeViewController = HomeViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
    }
}



//homePage

class HomeViewController: UIViewController {
    @IBOutlet private weak var presentColorPaletteButton: UIButton!
    @IBOutlet private weak var pushColorPaletteButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

      
        presentColorPaletteButton.setTitle("Present Color Palette", for: .normal)
        pushColorPaletteButton.setTitle("Push Color Palette", for: .normal)

        presentColorPaletteButton.addTarget(self, action: #selector(presentColorPaletteTapped), for: .touchUpInside)
        pushColorPaletteButton.addTarget(self, action: #selector(pushColorPaletteTapped), for: .touchUpInside)

        
        view.addSubview(presentColorPaletteButton)
        view.addSubview(pushColorPaletteButton)
    }

    @objc func presentColorPaletteTapped() {
        let colorPaletteViewController = ColorPaletteViewController()
        present(colorPaletteViewController, animated: true, completion: nil)
    }

    @objc func pushColorPaletteTapped() {
        let colorPaletteViewController = ColorPaletteViewController()
        navigationController?.pushViewController(colorPaletteViewController, animated: true)
    }
}




//colorPalett

class ColorPaletteViewController: UIViewController {
    @IBOutlet private weak var homeBackgroundLabel: UILabel!
    @IBOutlet private weak var  buttonBackgroundLabel: UILabel!
    @IBOutlet private weak var  homeColorButtonsStack: UIStackView!
    @IBOutlet private weak var  buttonColorButtonsStack:  UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        
        homeBackgroundLabel.text = "Change Home Buttons Background Colors"
        buttonBackgroundLabel.text = "Change Home Background Color"

        
        let homeColorButtons = createColorButtons()
        homeColorButtonsStack.addArrangedSubview(homeColorButtons)

        let buttonColorButtons = createColorButtons()
        buttonColorButtonsStack.addArrangedSubview(buttonColorButtons)


        view.addSubview(homeBackgroundLabel)
        view.addSubview(buttonBackgroundLabel)
        view.addSubview(homeColorButtonsStack)
        view.addSubview(buttonColorButtonsStack)
    }

    private func createColorButtons() -> UIStackView {
        
        var colors: [UIColor] = [.red, .blue, .green, .yellow, .orange, .purple]

        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10

        for color in colors {
            let colorButton = UIButton()
            colorButton.backgroundColor = color
            colorButton.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)
            stackView.addArrangedSubview(colorButton)
        }

        return stackView
    }

    @objc func colorButtonTapped(sender: UIButton) {

    }
}
