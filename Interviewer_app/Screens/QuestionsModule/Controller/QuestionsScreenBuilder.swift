import UIKit

final class QuestionsScreenBuilder {
    public static func createQuesionsViewController() -> QuestionsViewController {
        let view = QuestionsView()
        let vc = QuestionsViewController(mainView: view)
        return vc
    }
}
