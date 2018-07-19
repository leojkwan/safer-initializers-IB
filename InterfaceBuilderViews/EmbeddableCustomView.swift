import Foundation
import UIKit

class EmbeddableCustomView: UIView, HasNib {

    @IBOutlet var titleLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        // Render xib view from code.
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Render xib view from interface builder.
        commonInit()
    }
    
    private func commonInit() {
        // layout .xib view tree & activate layout constraints.
        loadNibContent()

        // Your setup code below.
        titleLabel.text = "This view is loaded from a custom xib file, cool huh?"
    }
}
