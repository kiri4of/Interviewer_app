import Foundation
import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    private var audioPlayer: AVAudioPlayer?
    private var isSoundEnabledEnternal = true
    
    var isSoundEnabled: Bool {
        get { isSoundEnabledEnternal }
        set {
            isSoundEnabledEnternal = newValue
            if !isSoundEnabledEnternal {
                stopSound()
            }
        }
    }
    
    private init() {
        loadInitialSettings()
    }
    
    private func loadInitialSettings() {
        if let savedValue = UserDefaultsManager.shared.getValue(forKey: "isSoundEnabled", as: Bool.self) {
            isSoundEnabledEnternal = savedValue
        } else {
            isSoundEnabledEnternal = true
        }
    }
    
    func toggleSound(_ isEnabled: Bool) {
        isSoundEnabled = isEnabled
        saveSettings()
    }
    
    private func saveSettings() {
        UserDefaultsManager.shared.setValue(isSoundEnabledEnternal, forKey: "isSoundEnabled")
    }
    
    func playSound(named soundName: String, withExtension soundExtension: String = "mp3"){
        
        guard isSoundEnabled else {
            print("Sound disabled")
            return
        }
        
        guard let url = Bundle.main.url(forResource: soundName, withExtension: soundExtension) else {
            print("No sound found")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play() 
        } catch {
            print("Audio playback error \(error.localizedDescription)")
        }
    }
    
    func stopSound() {
        audioPlayer?.stop()
    }
    
}
