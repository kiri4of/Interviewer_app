
import UIKit
import SnapKit

class MenuView: UIView {
    private let logoImageView = UIImageView()
    let categoryView = CategoryView()
    private let informationView = InformationView()
    private let playButton = CustomButton(title: "Play", font: AppFonts.inter18SemiBold)
    private let gameHistoryButton = CustomButton(title: "Game history", font: AppFonts.inter14Regular)
    private var viewModel: MenuViewModel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindViewModel(viewModel: MenuViewModel) {
        self.viewModel = viewModel
        configurateUI()
    }
}

extension MenuView {
    private func setupViews() {
        addSubview(logoImageView)
        addSubview(categoryView)
        addSubview(informationView)
        addSubview(playButton)
        addSubview(gameHistoryButton)
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp.centerY).offset(-150)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        categoryView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.7)
            make.centerX.equalTo(logoImageView.snp.centerX)
            make.top.equalTo(logoImageView.snp.bottom).offset(25)
        }
        informationView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.7)
            make.centerX.equalTo(categoryView.snp.centerX)
            make.top.equalTo(categoryView.snp.bottom).offset(15)
        }
        gameHistoryButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.55)
            make.height.equalTo(40)
            make.leading.equalTo(informationView.snp.leading)
            make.top.equalTo(informationView.snp.bottom).offset(25)
        }
        playButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(45)
            make.centerX.equalTo(informationView.snp.centerX)
            make.top.equalTo(gameHistoryButton.snp.bottom).offset(15)
        }
        
    }
    
    private func configurateUI() {
        backgroundColor = AppColor.backgroundPrimaryColor
        
        categoryView.setUI(categoryText: viewModel.currentCategory.value)
        informationView.setUI(categoryText: viewModel.lastGameCategory.value,
                              questionsText: viewModel.lastGameQuestions.value,
                              correctAnswersText: viewModel.lastGameCorrectAnswer.value)
    }
}
