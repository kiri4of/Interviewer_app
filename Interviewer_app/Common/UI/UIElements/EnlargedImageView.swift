import UIKit

class EnlargedImageView: UIImageView {
    var touchInsets = UIEdgeInsets(top: -20, left: -20, bottom: -20, right: -20)

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let expandedBounds = bounds.inset(by: touchInsets)
        return expandedBounds.contains(point)
    }
}

