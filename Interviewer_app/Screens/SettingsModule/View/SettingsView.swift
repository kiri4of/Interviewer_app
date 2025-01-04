
import SwiftUI

struct SettingOption {
    var title: String
    var selection: Binding<Bool>
    var onText: String
    var offText: String
}

struct SettingsView: View {
    @State private var isSequanceEnable = false
    @State private var isTipsShowsEnable = false
    @State private var isGoingAfterPrompEnable = true
    @State private var isSoundEnabled = true
   
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        var options = [
            SettingOption(title: "Sequence of questions:",
                          selection: $isSequanceEnable,
                          onText: "Default",
                          offText: "Random"),
            SettingOption(title: "Show tips/teory:",
                          selection: $isTipsShowsEnable,
                          onText: "Never",
                          offText: "After a tip"),
            SettingOption(title: "Going after the prompt:",
                          selection: $isGoingAfterPrompEnable,
                          onText: "Stay",
                          offText: "Go"),
            SettingOption(title: "Sounds in the game:",
                          selection: $isSoundEnabled,
                          onText: "On",
                          offText: "Off")
        ]
        
        VStack {
            Text("Settings")
                .padding()
                .font(Font(AppFonts.inter24SemiBold))
                .foregroundStyle(Color(AppColor.lightPrimaryTextColor))
            
            ForEach(options.indices, id: \.self) { index in
                let option = options[index]
                SettingsOptionView(title: option.title,
                                   selection: option.selection,
                                   onText: option.onText,
                                   offText: option.offText)
                .onChange(of: isSoundEnabled) { newValue in
                    SoundManager.shared.toggleSound(newValue)
                }
                .padding(.bottom)
            }
            
            
            ScreenLine()
                .stroke(.gray, lineWidth: 1)
                .frame(height: 1)
                .padding(.horizontal, 30)
            
            Spacer()
                .frame(height: 30)
            
            Button {
                dismiss()
            } label: {
                Text("Close")
                    .font(Font(AppFonts.inter18SemiBold))
                    .foregroundColor(Color(AppColor.darkPrimaryTextColor))
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(
                        Color(AppColor.itemPrimaryBgColor),
                        in: RoundedRectangle(
                            cornerRadius: 16,
                            style: .continuous
                        )
                    )
            }
            .padding(.horizontal, 16)
            Spacer()
                .frame(height: 50)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(AppColor.backgroundPrimaryColor))
    }
}

#Preview {
    SettingsView()
}

