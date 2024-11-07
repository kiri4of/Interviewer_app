
import UIKit

class CustomButton: UIButton {
    private var title: String
    private var bgColor: UIColor
    private var font: UIFont
    
    init(title: String, bgColor: UIColor = AppColor.buttonPrimaryBgColor, font: UIFont) {
        self.title = title
        self.bgColor = bgColor
        self.font = font
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
        setTitle(title, for: .normal)
        titleLabel?.font = font
        layer.cornerRadius = cornerRadius
        layer.shadowColor = bgColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 2.0
    }
}

