//
//  WeatherModel.swift
//  WeatherAppForAstanaHub
//
//  Created by Andas on 06.08.2024.
//

import Foundation

struct WeatherResponse: Codable {
    let list: [Weather]
}

struct Weather: Codable, Identifiable {
    let id = UUID()
    let main: Main
    let weather: [WeatherDetail]
    let dt_txt: String

    private enum CodingKeys: String, CodingKey {
        case main, weather, dt_txt
    }
}

struct Main: Codable {
    let temp: Double
}

struct WeatherDetail: Codable {
    let main: String
    let description: String
}



