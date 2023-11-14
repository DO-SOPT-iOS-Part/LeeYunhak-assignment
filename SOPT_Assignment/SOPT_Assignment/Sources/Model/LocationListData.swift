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
    let main: String
}
struct CurrentTemperatureState: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}
