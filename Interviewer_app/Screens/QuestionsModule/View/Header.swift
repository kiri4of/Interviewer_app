import UIKit
import SnapKit

class HeaderView: UIView {
    var currentTopicLabel: UILabel = {
        var label = UILabel()
        label.font = AppFonts.inter14SemiBold
        label.textColor = AppColor.lightPrimaryTextColor
        return label
    }()
    
    private var totalQuestionsLabel: UILabel = {
        var label = UILabel()
        label.font = AppFonts.inter12Regular
        label.textColor = AppColor.lightPrimaryTextColor
        return label
    }()
    
    private var gamesPlayedLabel: UILabel = {
        var label = UILabel()
        label.font = AppFonts.inter12Regular
        label.textColor = AppColor.lightPrimaryTextColor
        return label
    }()
    
    private var playButton = CustomButton(title: "Play", font: AppFonts.inter14SemiBold)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configurateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(currentTopicLabel)
        addSubview(totalQuestionsLabel)
        addSubview(gamesPlayedLabel)
        addSubview(playButton)
        
        currentTopicLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(15)
        }
        
        totalQuestionsLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalTo(currentTopicLabel.snp.bottom).offset(10)
        }
        
        gamesPlayedLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalTo(totalQuestionsLabel.snp.bottom).offset(7)
        }
        
        playButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(adapted(dimensionSize: 32, to: dimension))
            make.width.equalTo(adapted(dimensionSize: 85, to: dimension))
        }
    }
    
    func configurateUI() {
        currentTopicLabel.text = "Middle interview"
        totalQuestionsLabel.text = "Questions at all:"
        gamesPlayedLabel.text = "Attempts: "
        playButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        let soundManager = SoundManager.shared
        soundManager.playSound(named: AppSounds.click.rawValue)
    }
}
