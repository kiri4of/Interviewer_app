import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    private var audioPlayer: AVAudioPlayer?
    
    private init() {}
    
    func playSound(named soundName: String, withExtension soundExtension: String = "mp3"){
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
    
    
}
