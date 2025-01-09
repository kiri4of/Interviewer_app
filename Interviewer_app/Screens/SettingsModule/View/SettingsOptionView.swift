
import SwiftUI

struct SettingsOptionView: View {
    let title: String
    @Binding var selection: Bool
    let onText: String
    let offText: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(Font(AppFonts.inter14Regular))
                .foregroundStyle(Color(AppColor.lightPrimaryTextColor))
            
            Picker("", selection: $selection) {
                Text(onText).tag(true)
                Text(offText).tag(false)
            }
            .pickerStyle(.segmented)
            .frame(width: 300)
            .colorMultiply(Color(AppColor.itemPrimaryBgColor))
        }
        //.padding()
    }
}


