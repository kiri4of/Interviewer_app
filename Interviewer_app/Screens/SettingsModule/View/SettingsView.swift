import UIKit
import SnapKit

class SettingsView: UIView {
    private let settingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.font = AppFonts.inter14Regular
        label.textColor = AppColor.buttonPrimaryBgColor
        return label
    }()
    
    private let configurationView = UIView()
    private let stackView = UIStackView()
    private let dissmissButton = UIButton()
    private let soundTextButton = UIButton()
    private let soundSegmentControl = UISegmentedControl()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SettingsView {
    private func setupViews() {
        addSubview(configurationView)
        configurationView.addSubview(settingsLabel)
        configurationView.addSubview(stackView)
        configurationView.addSubview(dissmissButton)
        
        stackView.addArrangedSubview(soundTextButton)
        stackView.addArrangedSubview(soundSegmentControl)
        
        settingsLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview()
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(settingsLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
}
