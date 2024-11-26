
import UIKit

final class MenuScreenBuilder {
    public static func createMenuViewController() -> MenuViewController {
        let view = MenuView()
        let viewModel = MenuViewModel()
        let vc = MenuViewController(mainView: view, viewModel: viewModel)
        return vc
    }
}

