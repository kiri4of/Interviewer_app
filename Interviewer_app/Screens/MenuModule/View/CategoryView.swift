import UIKit

class CategoryView: UIView {
    private var currentCategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Current category:"
        label.font = AppFonts.inter14Regular
        label.textColor = AppColor.buttonPrimaryBgColor
        return label
    }()
    
    private var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.inter12SemiBold
        label.textColor = AppColor.primaryTextColor
        return label
    }()
    
    private var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.forward.circle")
        image.tintColor = AppColor.buttonPrimaryBgColor
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configurateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(categoryText: String) {
        categoryLabel.text = categoryText
    }
}

extension CategoryView {
    private func setupViews() {
        addSubview(currentCategoryLabel)
        addSubview(categoryLabel)
        addSubview(imageView)
        
        currentCategoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(16)
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(currentCategoryLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-12)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
            make.right.equalToSuperview().offset(-16)
            make.width.height.equalTo(24)
        }
    }
    
    private func configurateUI(){
        backgroundColor = AppColor.viewPrimaryColor
        
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.cornerRadius = 10
    }
}
