
import UIKit
import SnapKit

class InformationView: UIView {
   private var lastGameInfoLabel: UILabel = {
        let label = UILabel()
       label.font = AppFonts.inter14Regular
       label.text = "Last game information: "
       label.textColor = AppColor.itemPrimaryBgColor
        return label
    }()
    
    private var categoryLabel: UILabel = {
         let label = UILabel()
         label.font = AppFonts.inter12Regular
         label.textColor = AppColor.lightPrimaryTextColor
         return label
     }()
    
    private var questionsLabel: UILabel = {
         let label = UILabel()
         label.font = AppFonts.inter12Regular
         label.textColor = AppColor.lightPrimaryTextColor
         return label
     }()
    
    private var correctAnswersLabel: UILabel = {
         let label = UILabel()
         label.font = AppFonts.inter12Regular
         label.textColor = AppColor.lightPrimaryTextColor
         return label
     }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configurateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func setUI(categoryText: String, questionsText: String, correctAnswersText: String) {
        categoryLabel.text = "Category: \(categoryText)"
        questionsLabel.text = "Questions: \(questionsText)"
        correctAnswersLabel.text = "Correct answers: \(correctAnswersText)"
    }
}
 
extension InformationView {
    private func setupViews() {
        addSubview(lastGameInfoLabel)
        addSubview(categoryLabel)
        addSubview(questionsLabel)
        addSubview(correctAnswersLabel)
        
        lastGameInfoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(12)
        }
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(lastGameInfoLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(12)
        }
        questionsLabel.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(12)
        }
        correctAnswersLabel.snp.makeConstraints { make in
            make.top.equalTo(questionsLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
    
    private func configurateUI(){
        backgroundColor = AppColor.viewPrimaryColor
        
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.cornerRadius = 10
    }
    
}
