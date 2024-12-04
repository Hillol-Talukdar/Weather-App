//
//  ContentView.swift
//  Weather App
//
//  Created by Hillol Talukdar on 5/11/24.
//

import SwiftUI

struct CurrentWeatherView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                //                Text("Your coorditantes are: \(location.latitude), \(location.longitude)")
                
                
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView().task {
                        do {
                            weather = try await weatherManager.getCurrentWeather(
                                latitude: location.latitude,
                                longitude: location.longitude
                            )
                        } catch {
                            print("Error getting weather: \(error)")
                        }
                    }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    RequestCurrentLocationView().environmentObject(locationManager)
                }
            }
            
            
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    CurrentWeatherView()
}
