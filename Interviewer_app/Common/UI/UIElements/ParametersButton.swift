
import UIKit

class ParametersButton: UIButton {
    private var bgColor: UIColor
    
    init(bgColor: UIColor = AppColor.itemPrimaryBgColor) {
        self.bgColor = bgColor
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let cornerRadius = self.frame.height / 3
        backgroundColor = bgColor
        setTitleColor(AppColor.backgroundPrimaryColor, for: .normal)
        setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        tintColor = AppColor.backgroundPrimaryColor
        imageView?.contentMode = .scaleAspectFit
        imageView?.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1.2)
        //layer
        layer.cornerRadius = cornerRadius
        layer.shadowColor = bgColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 2.0
    }
}

