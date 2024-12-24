import UIKit
import SnapKit

class HeaderReusableView: UICollectionReusableView {
    static let identifier = "UICollectionReusableView"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.inter14SemiBold
        label.textColor = AppColor.primaryTextColor
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(16)
            make.centerY.equalTo(self.snp.centerY)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
}
