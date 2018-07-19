import UIKit

protocol FromStoryboard: class {
    static var storyboardName: String { get }
}

public protocol Identifiable {
    static var identifier: String { get }
}


extension FromStoryboard where Self: UIViewController, Self: Identifiable {
    static func fromStoryboard() -> Self? {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: Self.identifier) as? Self
    }
}

extension FromStoryboard where Self: UIViewController, Self: WithViewModel {
    static func fromStoryboard(identifierString: String? = nil, withViewModel viewModel: Self.ViewModel) -> Self? {
        let idString = identifierString ?? String(describing: self)
        guard let viewController = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: idString) as? Self else {
            return nil
        }

        viewController.viewModel = viewModel
        return viewController
    }
}
