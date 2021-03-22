import UIKit

class ViewController: UIViewController {
	@IBOutlet var textField: UITextField!
	@IBOutlet var imageView: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()
		drawTriforce(level: 5)
	}

	@IBAction func drawButtonPressed(_ sender: UIButton) {
		guard let text = textField.text, let level = Int(text) else { return }
		drawTriforce(level: level)
	}

	func drawTriforce(level: Int) {
		let scaleAmount = CGFloat(200.0 / (Float(level) * 2.0))
		let renderer = UIGraphicsImageRenderer(size: CGSize(width: 200, height: 200))

		let image = renderer.image { a in
			a.cgContext.scaleBy(x: scaleAmount, y: scaleAmount)
			for i in 0..<level {
				var j = level - i
				for _ in 0...i {
					a.cgContext.drawTriangle(at: CGPoint(x: j, y: i * 2))
					j += 2
				}
			}
		}

		imageView.image = image
	}
}
extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}

extension CGContext {
	func drawTriangle(at point: CGPoint) {
		move(to: point)
		let x = point.x, y = point.y
		addLine(to: CGPoint(x: x - 1, y: y + 2))
		addLine(to: CGPoint(x: x + 1, y: y + 2))
		closePath()
		drawPath(using: .fill)
	}
}


