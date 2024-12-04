//
//  HomeView.swift
//  Weather App
//
//  Created by Hillol Talukdar on 25/11/24.
//

import SwiftUI

struct HomeView: View {
    @State private var shouldOpenWeatherView = false
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("welcome to the Weather app")
                    .bold()
                    .font(.title)
            }
            .multilineTextAlignment(.center)
            .padding()
            
            Button(action: {shouldOpenWeatherView.toggle()}) {
                Text("Current Location Weather")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(30)
            .fullScreenCover(isPresented: $shouldOpenWeatherView) {
                gotoCurrentWeatherView()
            }
            
            Button(action: {}) {
                Text("Weather of a city")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
    
    private func gotoCurrentWeatherView()-> some View  {
        CurrentWeatherView()
    }
}

#Preview {
    HomeView()
}
