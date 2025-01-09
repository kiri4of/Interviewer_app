import UIKit

final class QuestionsScreenBuilder {
    public static func createQuesionsViewController() -> QuestionsViewController {
        let sections: [Section] = [
            Section(title: "Random Question", items: ["10 questions", "20 questions", "50 questions", "All app questions"]),
            Section(title: "Interview", items: ["Junior", "Junior+", "Middle", "Middle+", "Senior", "All app questions"]),
            Section(title: "SwiftUI", items: ["SwiftUI Essentials", "Drawing and Animation", "Combine"]),
            Section(title: "UIKit", items: ["ViewController Lifecycle", "Junior+", "Middle", "Middle+", "Senior", "Magic", "Fire+", "Patt of Exile", "Banana+", "Tomato", "Juice", "Antonoi+", "Trash", "ARC", "Queue"]),
            Section(title: "Combine", items: ["ViewController Lifecycle", "Junior+", "Middle", "Middle+", "Senior"]),
        ]
        let viewModel = QuestionViewModel(sections: sections)
        let view = QuestionsView()
        let vc = QuestionsViewController(mainView: view, viewModel: viewModel)
        return vc
    }
}
