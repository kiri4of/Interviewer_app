import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    private var audioPlayer: AVAudioPlayer?
    private var isSoundEnabled = true
    
    private init() {}
    
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
    
    func toggleSound(_ isEnabled: Bool) {
        isSoundEnabled = isEnabled
        if isEnabled{
            isSoundEnabled = false
        } else {
            isSoundEnabled = true
        }
    }
    
 
    
}
