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
                .padding(.top)
            
            if let todayWeather = viewModel.weatherList.first {
                VStack {
                    Text("Today")
                        .font(.title)
                        .foregroundColor(.white)
                    Text("\(Int(todayWeather.main.temp))°C")
                        .foregroundColor(.white)
                    Text(todayWeather.weather.first?.description.capitalized ?? "")
                        .foregroundColor(.white)
                    Image(uiImage: viewModel.getWeatherIcon(for: todayWeather.weather.first?.main ?? ""))
                        .font(.system(size: 40))
                }
                .padding()
                .background(Color.purple)
                .cornerRadius(20)
                .padding(.horizontal)
            }
            
            Text("Forecast for 7 days")
                .font(.headline)
                .padding(.top)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.weatherList, id: \.id) {weather in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(viewModel.formatDateString(weather.dt_txt))
                                    .font(.title)
                                Text(weather.weather.first?.description.capitalized ?? "")
                                    .font(.headline)
                            }
                            .foregroundColor(.white)
                            Spacer()
                            VStack {
                                Text("\(Int(weather.main.temp))°C")
                                    .foregroundColor(.white)
                                Image(uiImage: viewModel.getWeatherIcon(for:weather.weather.first?.main ?? ""))
                                    .font(.system(size: 30))
                            }
                        }
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(20)
                    }
                }
            }
//            List(viewModel.weatherList, id: \.id) { weather in
//                HStack {
//                    VStack(alignment: .leading) {
//                        Text(viewModel.formatDateString(weather.dt_txt))
//                            .font(.headline)
//                        Text(weather.weather.first?.description.capitalized ?? "")
//                            .font(.subheadline)
//                    }
//                    .foregroundColor(.white)
//                    Spacer()
//                    VStack {
//                        Text("\(Int(weather.main.temp))°C")
//                            .foregroundColor(.white)
//                        Image(systemName: getWeatherIcon(for: weather.weather.first?.main ?? ""))
//                            .foregroundColor(.blue)
//                            .font(.system(size: 30))
//                    }
//                }
//                .padding()
//                .background(Color.purple)
//                .cornerRadius(20)
//                .shadow(radius: 10)
//            }
//            .listStyle(PlainListStyle())
        }
        .padding()
    }
}



#Preview {
    ContentView()
}
