//
//  WeatherForcastData.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/10/23.
//

import UIKit

struct WeatherForecastData {
    var dayText: Day
    var weatherImage: UIImage
    var percentageText: String?
    var tempuratureLowNumber: Int
    var tempuratureHighNumber: Int
    var temperatureLineGraphImage: UIImage

    enum Day: String {
        case today = "오늘"
        case mon = "월"
        case tue = "화"
        case wed = "수"
        case thu = "목"
        case fri = "금"
        case sat = "토"
        case sun = "일"
    }
}

extension WeatherForecastData {
    static let dummyData: [WeatherForecastData] = [
        WeatherForecastData(dayText: .today, weatherImage: .sun, tempuratureLowNumber: 15, tempuratureHighNumber: 29, temperatureLineGraphImage: .temperatureLineGraph1),
        WeatherForecastData(dayText: .mon, weatherImage: .cloudDrizzleMini, percentageText: "60%", tempuratureLowNumber: 18, tempuratureHighNumber: 27, temperatureLineGraphImage: .temperatureLineGraph2),
        WeatherForecastData(dayText: .tue, weatherImage: .cloudDrizzleMini, percentageText: "60%", tempuratureLowNumber: 20, tempuratureHighNumber: 25, temperatureLineGraphImage: .temperatureLineGraph3),
        WeatherForecastData(dayText: .wed, weatherImage: .cloudDrizzleMini, percentageText: "70%", tempuratureLowNumber: 17, tempuratureHighNumber: 25, temperatureLineGraphImage: .temperatureLineGraph4),
        WeatherForecastData(dayText: .thu, weatherImage: .cloudDrizzleMini, percentageText: "50%", tempuratureLowNumber: 17, tempuratureHighNumber: 25, temperatureLineGraphImage: .temperatureLineGraph5),
        WeatherForecastData(dayText: .fri, weatherImage: .cloudSun, tempuratureLowNumber: 20, tempuratureHighNumber: 26, temperatureLineGraphImage: .temperatureLineGraph6),
        WeatherForecastData(dayText: .sat, weatherImage: .sun, tempuratureLowNumber: 18, tempuratureHighNumber: 25, temperatureLineGraphImage: .temperatureLineGraph7),
        WeatherForecastData(dayText: .sun, weatherImage: .cloudDrizzleMini, percentageText: "50%", tempuratureLowNumber: 13, tempuratureHighNumber: 21, temperatureLineGraphImage: .temperatureLineGraph8),
        WeatherForecastData(dayText: .mon, weatherImage: .cloudDrizzleMini, percentageText: "50%", tempuratureLowNumber: 12, tempuratureHighNumber: 19, temperatureLineGraphImage: .temperatureLineGraph9),
        WeatherForecastData(dayText: .tue, weatherImage: .sun, tempuratureLowNumber: 18, tempuratureHighNumber: 25, temperatureLineGraphImage: .temperatureLineGraph10),
        WeatherForecastData(dayText: .wed, weatherImage: .sun, tempuratureLowNumber: 18, tempuratureHighNumber: 25, temperatureLineGraphImage: .temperatureLineGraph11)
    ]
}
