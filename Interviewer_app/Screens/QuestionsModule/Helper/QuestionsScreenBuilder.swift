import UIKit

final class QuestionsScreenBuilder {
    public static func createQuesionsViewController() -> QuestionsViewController {
        let viewModel = QuestionViewModel()
        let view = QuestionsView()
        let vc = QuestionsViewController(mainView: view, viewModel: viewModel)
        return vc
    }
}
