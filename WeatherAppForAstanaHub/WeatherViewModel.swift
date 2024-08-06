//
//  WeatherViewModel.swift
//  WeatherAppForAstanaHub
//
//  Created by Andas on 06.08.2024.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var weatherList = [Weather]()
    private var weatherService = WeatherService()
    
    init() {
        fetchWeather()
    }
    
    func fetchWeather() {
        weatherService.fetchWeather { [weak self] response in
            DispatchQueue.main.async {
                if let response = response {
                    self?.weatherList = response.list.filter { $0.dt_txt.contains("12:00:00") }
                }
            }
        }
    }
    
    func formatDateString(_ dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd MMMM"
        
        if let date = inputFormatter.date(from: dateString) {
            return outputFormatter.string(from: date)
        }
        return dateString
    }
    
    func getWeatherIcon(for condition: String) -> UIImage {
        switch condition {
        case "Clear":
            return UIImage(resource: .sunny)
        case "Rain":
            return UIImage(resource: .moderateRain)
        case "Clouds":
            return UIImage(resource: .cloudy)
        case "Overcast Clouds":
            return UIImage(resource: .overcastClouds)
        case "Snow":
            return UIImage(resource: .snow)
        default:
            return UIImage(resource: .sunny)
        }
    }
}



