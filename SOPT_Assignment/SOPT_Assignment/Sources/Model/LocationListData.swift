//
//  WeatherLocationListData.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/7/23.
//
import Foundation

struct LocationListData {
    var titleText: String?
    var locationText: String?
    var weatherText: String?
    var tempuratureText: String?
    var tempuratureHighText: String?
    var tempuratureLowText: String?
}

extension LocationListData {
    static let dummyData: [LocationListData] = [
        LocationListData(titleText: "나의 위치", locationText: "의정부시", weatherText: "흐림", tempuratureText: "21°", tempuratureHighText: "최고:29°", tempuratureLowText: "최저:15°"),
        LocationListData(titleText: "나의 위치", locationText: "서울특별시", weatherText: "흐림", tempuratureText: "21°", tempuratureHighText: "최고:29°", tempuratureLowText: "최저:15°"),
        LocationListData(titleText: "나의 위치", locationText: "창원시", weatherText: "흐림", tempuratureText: "21°", tempuratureHighText: "최고:29°", tempuratureLowText: "최저:15°"),
        LocationListData(titleText: "나의 위치", locationText: "강릉시", weatherText: "흐림", tempuratureText: "21°", tempuratureHighText: "최고:29°", tempuratureLowText: "최저:15°"),
        LocationListData(titleText: "나의 위치", locationText: "일산시", weatherText: "흐림", tempuratureText: "21°", tempuratureHighText: "최고:29°", tempuratureLowText: "최저:15°"),
        LocationListData(titleText: "나의 위치", locationText: "창녕군", weatherText: "흐림", tempuratureText: "21°", tempuratureHighText: "최고:29°", tempuratureLowText: "최저:15°"),
        LocationListData(titleText: "나의 위치", locationText: "대전시", weatherText: "흐림", tempuratureText: "21°", tempuratureHighText: "최고:29°", tempuratureLowText: "최저:15°"),
        LocationListData(titleText: "나의 위치", locationText: "천안시", weatherText: "흐림", tempuratureText: "21°", tempuratureHighText: "최고:29°", tempuratureLowText: "최저:15°")
    ]
}

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

enum Location: String, CaseIterable {
    case 구미, 서울, 제주, 부산, 서산
    
    func englishName() -> String {
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


