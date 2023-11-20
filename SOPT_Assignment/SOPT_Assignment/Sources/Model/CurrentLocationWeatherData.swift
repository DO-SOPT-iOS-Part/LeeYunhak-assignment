//
//  CurrentLocationWeatherData.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/17/23.
//

import Foundation

struct CurrentLocationWeatherData: Decodable {
    let weather: [CurrentWeatherState]
    let main: CurrentTemperatureState
    let name: String
}
struct CurrentWeatherState: Decodable {
    let description: String
}
struct CurrentTemperatureState: Decodable {
    let temp: Double
    let tempMin: Double
    let tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

extension CurrentLocationWeatherData {
    static func bindOnlineData(data: CurrentLocationWeatherData) -> LocationListData {
        var locationListData = LocationListData()
        
        let formatter = DateFormatter().then {
            $0.dateFormat = "HH:mm"
        }
        let currentTime = formatter.string(from: Date())
        
        locationListData.titleText = Location.koreanName(of: data.name)
        locationListData.locationText = currentTime
        locationListData.weatherText = data.weather[0].description
        locationListData.tempuratureText = "\(lround(data.main.temp))°"
        locationListData.tempuratureHighText = "최고:\(lround(data.main.tempMax))°"
        locationListData.tempuratureLowText = "최저:\(lround(data.main.tempMin))°"
        
        return locationListData
    }
}

enum Location: String, CaseIterable {
    case 구미, 서울, 제주, 부산, 서산
    
    var englishName: String {
        switch self {
        case .구미:
            return "gumi"
        case .서울:
            return "seoul"
        case .제주:
            return "jeju"
        case .부산:
            return "busan"
        case .서산:
            return "seosan"
        }
    }
    
    static func koreanName(of name: String) -> String {
        switch name {
        case "Gumi":
            return Self.구미.rawValue
        case "Seoul":
            return Self.서울.rawValue
        case "Jeju City":
            return Self.제주.rawValue
        case "Busan":
            return Self.부산.rawValue
        case "Seosan City":
            return Self.서산.rawValue
        default:
            return "Where we are?"
        }
    }
}
