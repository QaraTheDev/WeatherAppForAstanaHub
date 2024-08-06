//
//  ContentView.swift
//  WeatherAppForAstanaHub
//
//  Created by Andas on 06.08.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            Text("Astana")
                .font(.largeTitle)
                .bold()
            
            if let todayWeather = viewModel.weatherList.first {
                VStack {
                    Text("Today")
                        .font(.title)
                    Text("\(Int(todayWeather.main.temp))°C")
                    Text(todayWeather.weather.first?.description.capitalized ?? "")
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
            }
            
            Text("Forecast for 7 days")
                .font(.headline)
                .padding(.top)
            
            List(viewModel.weatherList.dropFirst(), id: \.id) { weather in
                VStack(alignment: .leading) {
                    Text(weather.dt_txt)
                    Text("\(Int(weather.main.temp))°C")
                    Text(weather.weather.first?.description.capitalized ?? "")
                }
            }
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
