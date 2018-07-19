import UIKit

/// A class(usually a view) marked with `WithViewModel`
/// indicates that all its required dependencies
/// will be bundled in 1 dependency, `viewModel`.
public protocol WithViewModel: class {
    associatedtype ViewModel = Any
    var viewModel: ViewModel? { get set }
}

/// Because ViewModel is an associated type,
/// we can inject dependencies with compile-time
/// certainty that a view is receiving the correct
/// dependency object to render itself by inject(:).
///
/// Additionally, if we want to render a view from a xib
/// and not via storyboard/IBOutlets, we can initialize a
/// view with required dependencies with a convenient `fromNib`
/// initializer. NOTE: In the view's init(:frame), we still have
/// to `loadNibContents` from the view's corresponding xib file (See HasNib.swift)
extension WithViewModel where Self: UIView {

    public func inject(with viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    public init(frame: CGRect, viewModel: ViewModel) {
        self.init(frame: frame)
        self.viewModel = viewModel
    }
}
