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
    
    var imageView: EnlargedImageView = {
        let image = EnlargedImageView()
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
            make.width.height.equalTo(adapted(dimensionSize: 24, to: dimension))
            make.right.equalToSuperview().offset(-16)
        }
    }
    
    private func configurateUI(){
        backgroundColor = AppColor.viewPrimaryColor
        
        imageView.touchInsets = UIEdgeInsets(top: 70, left: 70, bottom: 70, right: 70)
        
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.cornerRadius = 10
    }
}
