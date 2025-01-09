import UIKit
import SwiftUI
import SnapKit

class SettingsViewController: UIViewController {
    private let viewModel = SettingsViewModel()
    private let contentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)

        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 16
        contentView.clipsToBounds = true

        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false

        contentView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.height.equalTo(view.snp.height).multipliedBy(0.6)
        }
        
        // add SUI to contentview
        let settingsView = SettingsView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: settingsView)

        addChild(hostingController)
        contentView.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])

        hostingController.didMove(toParent: self)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, touch.view == self.view {
            dismiss(animated: true, completion: nil) // close when taped
        }
    }
}
