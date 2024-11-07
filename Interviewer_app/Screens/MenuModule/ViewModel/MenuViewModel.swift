
import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    func bind(callback: @escaping (T) -> Void){
        self.listener = callback
    }
    
    init(_ value: T) {
        self.value = value
    }
}

class MenuViewModel  {
    var image = Dynamic("")
    var currentCategory = Dynamic("")
    var lastGameCategory = Dynamic("")
    var lastGameQuestions = Dynamic("")
    var lastGameCorrectAnswer = Dynamic("")
    
    func configurateUI() {
        
    }
}
