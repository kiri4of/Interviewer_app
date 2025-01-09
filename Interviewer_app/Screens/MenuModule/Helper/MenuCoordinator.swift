
import UIKit

class MenuCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let menuVC = MenuScreenBuilder.createMenuViewController()
        menuVC.coordinator = self
        navigationController.pushViewController(menuVC, animated: true)
    }
    
    func goQuestionsViewController(){
        let questionsVC = QuestionsScreenBuilder.createQuesionsViewController()
        navigationController.viewControllers.first?.present(questionsVC, animated: true)
        //navigationController.pushViewController(questionsVC, animated: false)
    }
    
    func goSettingsViewController() {
        let settingsVC = SettingsViewController()
        settingsVC.modalPresentationStyle = .overFullScreen
        settingsVC.modalTransitionStyle = .crossDissolve
        navigationController.viewControllers.first?.present(settingsVC, animated: true)
    }
}

