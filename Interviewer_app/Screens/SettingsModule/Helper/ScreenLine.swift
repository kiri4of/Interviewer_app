
import SwiftUI

struct ScreenLine: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: UIScreen.main.bounds.width - 100, y: 0))
        
        return path
    }
    
}

#Preview {
    ScreenLine()
}