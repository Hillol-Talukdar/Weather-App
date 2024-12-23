//
//  HomeView.swift
//  Weather App
//
//  Created by Hillol Talukdar on 25/11/24.
//

import SwiftUI

struct HomeView: View {
    @State private var shouldOpenWeatherView = false
    @State private var shouldOpenCityWeatherView = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 10) {
                    Text("Welcome to the Weather App")
                        .bold()
                        .font(.title)
                }
                .multilineTextAlignment(.center)
                .padding()
                
                NavigationLink(destination: CurrentWeatherView()) {
                    Text("Current Location Weather")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                
                NavigationLink(destination: CityWeatherView()) {
                    Text("Weather of a City")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
            .preferredColorScheme(.dark)
            .navigationTitle("Weather App")
        }
    }
}

#Preview {
    HomeView()
}
