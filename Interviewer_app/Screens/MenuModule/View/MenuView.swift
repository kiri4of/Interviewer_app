
import UIKit
import SnapKit
import AVFoundation

protocol MenuViewProtocol: AnyObject {
    func didTapQuestions()
}

class MenuView: UIView {
    private let logoImageView = UIImageView()
    let categoryView = CategoryView()
    private let informationView = InformationView()
    private let playButton = CustomButton(title: "Play", font: AppFonts.inter18SemiBold)
    private let gameHistoryButton = CustomButton(title: "Game history", font: AppFonts.inter16Regular)
    private let settingsButton = ParametersButton()
    private var audioPlayer = AVAudioPlayer()
    private var viewModel: MenuViewModel!
    
    weak var delegate: MenuViewProtocol?
    
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
        addSubview(settingsButton)
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp.centerY).offset(adapted(dimensionSize: -200, to: dimension))
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
            make.height.equalTo(adapted(dimensionSize: 40, to: dimension))
            make.leading.equalTo(informationView.snp.leading)
            make.top.equalTo(informationView.snp.bottom).offset(25)
        }
        settingsButton.snp.makeConstraints { make in
            make.leading.equalTo(gameHistoryButton.snp.trailing).offset(15)
            make.top.equalTo(informationView.snp.bottom).offset(25)
            make.height.width.equalTo(gameHistoryButton.snp.height)
        }
        playButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(adapted(dimensionSize: 45, to: dimension))
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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapQuestions))
        categoryView.imageView.addGestureRecognizer(tapGesture)
        categoryView.imageView.isUserInteractionEnabled = true
        
        //Buttons
        playButton.addTarget(self, action: #selector(didTapPlay), for: .touchUpInside)
        gameHistoryButton.addTarget(self, action: #selector(didTapGameHistory), for: .touchUpInside)
        settingsButton.addTarget(self, action: #selector(didTapParameters), for: .touchUpInside)
    }
    
    @objc private func didTapQuestions(){
        viewModel.playClickSound()
        delegate?.didTapQuestions()
    }
    @objc private func didTapPlay(){
        viewModel.playClickSound()
        //...
    }
    @objc private func didTapGameHistory(){
        viewModel.playClickSound()
        //...
    }
    @objc private func didTapParameters(){
        viewModel.playClickSound()
        //...
    }
}


//Проблема в том что кнопка не отвечает, походу конфигурация не правильно работает и когда тапаешь у нее нету таргета
