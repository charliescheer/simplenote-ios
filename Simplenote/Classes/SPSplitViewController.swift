import Foundation
import UIKit


// MARK: - SPSplitViewController
//
class SPSplitViewController: UISplitViewController {

    // MARK: - Initializers

    init() {
        super.init(nibName: nil, bundle: nil)
        delegate = self
        preferredDisplayMode = .allVisible
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}


// MARK: - UISplitViewControllerDelegate Conformance
//
extension SPSplitViewController: UISplitViewControllerDelegate {

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        // Prevent the DetailsViewController from being pushed by default
        return true
    }
}
