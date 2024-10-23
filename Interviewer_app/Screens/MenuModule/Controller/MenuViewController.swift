
import UIKit

class MenuViewController: BaseViewController<MenuView> {
    private var viewModel: MenuViewModelProtocol
    
    init(mainView: MenuView,viewModel: MenuViewModelProtocol) {
        self.viewModel = viewModel
        super.init(mainView: mainView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
