
import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    func setValue<T: Codable>(_ value: T, forKey key: String){
        if let encoded = try? JSONEncoder().encode(value) {
            defaults.set(encoded, forKey: key)
        } else {
            print("Failed to encode value for key \(key)")
        }
    }
    
    func getValue<T: Codable>(forKey key: String, as type: T.Type) -> T? {
        guard let data = defaults.data(forKey: key) else {return nil}
        return try? JSONDecoder().decode(type, from: data)
    }
    
    func setValue(_ value: Any?, forKey key: String) {
        defaults.set(value, forKey: key)
    }
    
    func getValue<T>(forKey key: String) -> T? {
        return defaults.object(forKey: key) as? T
    }
    
    func remove(forKey key: String) {
        defaults.removeObject(forKey: key)
    }
    
}
