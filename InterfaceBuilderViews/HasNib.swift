import UIKit

public protocol HasNib: class {
    static var nib: UINib { get }
}

// MARK: Support for instantiation from NIB
public extension HasNib where Self: UIView {

    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }

    // Adds content loaded from the nib to the end of the
    // receiver's list of subviews and adds constraints automatically.
    func loadNibContent() {
        let layoutAttributes: [NSLayoutAttribute] = [.top, .leading, .bottom, .trailing]
        for view in Self.nib.instantiate(withOwner: self, options: nil) {
            if let view = view as? UIView {
                view.translatesAutoresizingMaskIntoConstraints = false
                self.addSubview(view)
                layoutAttributes.forEach { attribute in
                    self.addConstraint(
                        NSLayoutConstraint(
                            item: view,
                            attribute: attribute,
                            relatedBy: .equal,
                            toItem: self,
                            attribute: attribute,
                            multiplier: 1,
                            constant: 0.0))
                }
            }
        }
    }
}
