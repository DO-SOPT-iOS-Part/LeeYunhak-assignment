//
//  Config.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/14/23.
//

import Foundation

enum Config {
    enum Keys {
        enum Plist {
            static let weatherBaseURL = "WEATHER_BASE_URL"
            static let weatherAPIKey = "WEATHER_API_KEY"
        }
        
        private static let infoDictionary: [String: Any] = {
            guard let dict = Bundle.main.infoDictionary else {
                fatalError("plist cannot found.")
            }
            return dict
        }()
    }
    
    static func plistValue(forKey key: String) -> String {
        return Bundle.main.object(forInfoDictionaryKey: key) as? String ?? "Error"
    }
}
