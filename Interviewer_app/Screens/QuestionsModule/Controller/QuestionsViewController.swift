
import UIKit

class QuestionsViewController: BaseViewController<QuestionsView> {
    
    private var viewModel: QuestionViewModel
    
    init(mainView: QuestionsView, viewModel: QuestionViewModel) {
        self.viewModel = viewModel
        super.init(mainView: mainView)
        self.mainView.bindViewModel(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
    }
    
}
