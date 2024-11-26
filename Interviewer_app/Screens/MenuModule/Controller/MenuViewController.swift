
import UIKit

class MenuViewController: BaseViewController<MenuView> {
    private var viewModel: MenuViewModel
    var coordinator: MenuCoordinator?
    
    init(mainView: MenuView, viewModel: MenuViewModel) {
        self.viewModel = viewModel
        super.init(mainView: mainView)
        self.mainView.bindViewModel(viewModel: viewModel)
        self.mainView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //устанавливаем связь просто связь йоууу
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.currentCategory.bind { text in
            self.mainView.categoryView.setUI(categoryText: text)
        }
        saveData()
    }
    
    //сохраняем данные
    func saveData() {
        viewModel.currentCategory.value = "Combine"
    }
    
}

extension MenuViewController: MenuViewProtocol {
    func didTapQuestions() {
        coordinator?.goQuestionsViewController()
    }
}
