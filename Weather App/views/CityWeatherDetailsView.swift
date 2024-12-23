//
//  CityWeatherDetailsView.swift
//  Weather App
//
//  Created by Hillol Talukdar on 18/12/24.
//

import SwiftUI

struct CityWeatherDetailsView: View {
    let cityName: String
    
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let weather = weather {
                WeatherView(weather: weather)
            } else {
                LoadingView().task {
                    do {
                        weather = try await weatherManager.getCitytWeather(cityName: cityName)
                    } catch {
                        print("Error getting weather: \(error)")
                    }
                }
            }
            
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}


#Preview {
    CityWeatherDetailsView(cityName: "Dhaka")
}
