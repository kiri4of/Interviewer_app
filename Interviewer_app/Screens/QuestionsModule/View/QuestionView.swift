import UIKit
import SnapKit

class QuestionsView: UIView {
    private let verticalScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isScrollEnabled = true
        return scroll
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private let sectionInsets: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    private var headerView = HeaderView()
    private var viewModel: QuestionViewModel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AppColor.backgroundPrimaryColor
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindViewModel(viewModel: QuestionViewModel) {
        self.viewModel = viewModel
        reloadStackView()
    }
    
}

extension QuestionsView {
    
    private func setupViews() {
        addSubview(headerView)
        addSubview(verticalScrollView)
        verticalScrollView.addSubview(verticalStackView)
        
        let screenHeight = UIScreen.main.bounds.height
        let headerHeight = screenHeight / 10
        
        headerView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(adapted(dimensionSize: headerHeight, to: dimension))
        }
        
        verticalScrollView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(self.snp.leading).offset(15)
            make.trailing.equalTo(self.snp.trailing).offset(-15)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalTo(verticalScrollView.snp.edges)
            make.width.equalTo(verticalScrollView.snp.width)
        }
    }
    
    private func reloadStackView() {
        verticalStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        guard let viewModel = viewModel else { return }
        
        for section in sections {
            let headerLabel = UILabel()
            headerLabel.text = section.title
            headerLabel.font = AppFonts.inter16SemiBold
            verticalStackView.addArrangedSubview(headerLabel)
            
            let rows = viewModel.splitIntoRows(items: section.items, itemsPerRow: 3)
            
            for row in rows {
                let horizontalStackView = createHorizontalStackView(with: row)
                verticalStackView.addArrangedSubview(horizontalStackView)
            }
        }
    }

    
    private func createHorizontalStackView(with items: [String]) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        
        for row in items {
            let button = CustomButton(title: row, bgColor: AppColor.itemPrimaryBgColor, font: AppFonts.inter12Regular)
            button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
            
            button.snp.makeConstraints { make in
                make.height.equalTo(adapted(dimensionSize: 33, to: dimension))
            }
            stackView.addArrangedSubview(button)
        }
        return stackView
    }
    
    @objc private func didTapButton(){
        let soundManager = SoundManager.shared
        soundManager.playSound(named: AppSounds.click.rawValue)
    }
    
}


//Заебок, теперь реши проблему с viewModel у question и перенеси метод splitToRows во viewModel, а дальше заебашь звук для всех кнопочек и сделай высоту кнопок тоже чуток больше, ну а потом придумаешь че делать, ЕЩьКЕРЕЕ АБАДУЮНДУНДА ЭЭЭЭ
