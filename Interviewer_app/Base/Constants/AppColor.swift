import UIKit

enum AppColor {
    static let viewPrimaryColor: UIColor = #colorLiteral(red: 0.3882352941, green: 0.3490196078, blue: 0.5215686275, alpha: 1)
    static let backgroundPrimaryColor: UIColor = #colorLiteral(red: 0.2666666667, green: 0.2352941176, blue: 0.4078431373, alpha: 1)
    static let descriptionColor: UIColor = #colorLiteral(red: 0.8352941176, green: 0.8078431373, blue: 0.6392156863, alpha: 1)
    static let titlePrimaryBgColor: UIColor = #colorLiteral(red: 1, green: 0.8274509804, blue: 0.4117647059, alpha: 1)
    static let lightPrimaryTextColor: UIColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.7960784314, alpha: 1)
    static let darkPrimaryTextColor: UIColor = #colorLiteral(red: 0.2235294118, green: 0.1882352941, blue: 0.3254901961, alpha: 1)
    static let itemPrimaryBgColor: UIColor = #colorLiteral(red: 1, green: 0.8274509804, blue: 0.4117647059, alpha: 1)
    static let selectedItemBgColor: UIColor = #colorLiteral(red: 0.5450980392, green: 0.4117647059, blue: 0, alpha: 1)

    enum Gradient {
        static let yellow =  #colorLiteral(red: 1, green: 0.7647058824, blue: 0.1607843137, alpha: 1)
        static let red =  #colorLiteral(red: 1, green: 0.5098039216, blue: 0.9333333333, alpha: 1)
        static let pink = #colorLiteral(red: 1, green: 0.3620835543, blue: 0.7334597707, alpha: 1)
        static let blue = #colorLiteral(red: 0.2345032394, green: 0.3246327043, blue: 0.9795067906, alpha: 1)
        
        static var yellowRed: [UIColor] {
            return [yellow, red]
        }
        
        static var pinkBlue: [UIColor] {
            return [blue, pink]
        }
    }
}

