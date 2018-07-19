import UIKit

class ViewController: UIViewController {

    @IBOutlet var customView: EmbeddableCustomView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add custom view in code.
        let anotherCustomViewHeader = EmbeddableCustomView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: view.bounds.width,
                height: 100
            )
        )
        anotherCustomViewHeader.titleLabel.text = "This is the same custom view initialized in code"
        view.addSubview(anotherCustomViewHeader)
    }
}
