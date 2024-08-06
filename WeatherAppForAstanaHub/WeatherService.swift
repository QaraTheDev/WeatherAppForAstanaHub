//
//  WeatherService.swift
//  WeatherAppForAstanaHub
//
//  Created by Andas on 06.08.2024.
//

import Foundation

class WeatherService {
    private let apiKey = "229270de48826e1b97ad575c03b97b92"
    private let city = "Astana"
    
    func fetchWeather(completion: @escaping (WeatherResponse?) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                    completion(weatherResponse)
                } catch {
                    print("Error decoding weather data: \(error.localizedDescription)")
                    completion(nil)
                }
            } else {
                print("Error fetching weather data: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
            }
        }.resume()
    }
}
