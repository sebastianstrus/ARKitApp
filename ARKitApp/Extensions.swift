import UIKit

@IBDesignable class BorderButton : UIButton {
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}


extension UIButton {
    func bounce() {
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.transform = CGAffineTransform.identity
                        }
        })
    }
}
