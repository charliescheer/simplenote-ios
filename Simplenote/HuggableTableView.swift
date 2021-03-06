import UIKit

// MARK: - HuggableTableView
// Table View that wraps it's own content (tries to set it's own height to match the content)
//
class HuggableTableView: UITableView {

    override var frame: CGRect {
        didSet {
            updateScrollState()
        }
    }

    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override func safeAreaInsetsDidChange() {
        super.safeAreaInsetsDidChange()
        invalidateIntrinsicContentSize()
    }

    override func invalidateIntrinsicContentSize() {
        super.invalidateIntrinsicContentSize()
        updateScrollState()
    }

    override var intrinsicContentSize: CGSize {
        var size = contentSize
        size.height += safeAreaInsets.top + safeAreaInsets.bottom
        return size
    }

    private func updateScrollState() {
        isScrollEnabled = frame.size.height < intrinsicContentSize.height
    }
}
