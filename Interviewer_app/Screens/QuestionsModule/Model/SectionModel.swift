
struct Section {
    let title: String
    let items: [String]
}

let sections: [Section] = [
    Section(title: "Random Question", items: ["10 questions", "20 questions", "50 questions", "All app questions"]),
    Section(title: "Interview", items: ["Junior","Junior+","Middle","Middle+","Senior"]),
    Section(title: "SwiftUI", items: ["SwiftUI Essentials","Drawing and Animation","Combine"]),
    Section(title: "UIKit", items: ["ViewController Lifecycle","Junior+","Middle","Middle+","Senior"])
]
