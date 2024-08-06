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
                    self?.weatherList = response.list
                }
            }
        }
    }
}

