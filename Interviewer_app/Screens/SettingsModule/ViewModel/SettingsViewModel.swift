
import Foundation

class SettingsViewModel: ObservableObject {
    @Published var isSoundEnabled: Bool = SoundManager.shared.isSoundEnabled {
        didSet {
            SoundManager.shared.toggleSound(isSoundEnabled)
        }
    }
    @Published var isSoundsEnabled = true //works
    
    @Published var isSequanceEnable = false //future
    @Published var isTipsShowsEnable = false //future
    @Published var isGoingAfterPrompEnable = true //future
    @Published var isVibrationEnabled = false //future
    
    init() {
        isSoundEnabled = SoundManager.shared.isSoundEnabled
    }
    
}

