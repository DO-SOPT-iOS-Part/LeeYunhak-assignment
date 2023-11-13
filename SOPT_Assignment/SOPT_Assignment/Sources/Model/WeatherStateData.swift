//
//  WeatherState.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 10/27/23.
//

struct WeatherState {
    var timeText: String?
    var weatherimageName: String
    var temperature: Int
}

extension WeatherState{
    static let dummyData: [WeatherState] = [
        WeatherState(timeText: "Now", weatherimageName: "cloud.moon", temperature: 21),
        WeatherState(timeText: "10시", weatherimageName: "cloud.drizzle", temperature: 21),
        WeatherState(timeText: "11시", weatherimageName: "cloud.heavyrain", temperature: 19),
        WeatherState(timeText: "12시", weatherimageName: "cloud.bolt", temperature: 19),
        WeatherState(timeText: "1시", weatherimageName: "cloud.rain.sun", temperature: 19),
        WeatherState(timeText: "2시", weatherimageName: "cloud.drizzle", temperature: 20),
        WeatherState(timeText: "3시", weatherimageName: "cloud.bolt", temperature: 21),
        WeatherState(timeText: "4시", weatherimageName: "cloud.moon", temperature: 22),
        WeatherState(timeText: "5시", weatherimageName: "cloud.heavyrain", temperature: 21),
        WeatherState(timeText: "6시", weatherimageName: "cloud.moon", temperature: 21),
        WeatherState(timeText: "7시", weatherimageName: "cloud.rain.sun", temperature: 20),
        WeatherState(timeText: "8시", weatherimageName: "cloud.bolt", temperature: 18),
        WeatherState(timeText: "9시", weatherimageName: "cloud.rain.sun", temperature: 17),
        WeatherState(timeText: "10시", weatherimageName: "cloud.drizzle", temperature: 17),
        WeatherState(timeText: "11시", weatherimageName: "cloud.moon", temperature: 17),
        WeatherState(timeText: "12시", weatherimageName: "cloud.rain.sun", temperature: 16)
    ]
}
