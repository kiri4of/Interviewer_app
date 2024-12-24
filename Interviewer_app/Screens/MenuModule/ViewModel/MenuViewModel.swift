
import Foundation

class MenuViewModel  {
    var image = Dynamic("")
    var currentCategory = Dynamic("")
    var lastGameCategory = Dynamic("")
    var lastGameQuestions = Dynamic("")
    var lastGameCorrectAnswer = Dynamic("")
    
    func playClickSound() {
        SoundManager.shared.playSound(named: "click")
    }
}
