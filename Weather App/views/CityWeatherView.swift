//
//  CityWeatherView.swift
//  Weather App
//
//  Created by Hillol Talukdar on 4/12/24.
//

import SwiftUI

struct CityWeatherView: View {
    @State private var searchText: String = ""
    @State private var isNavigationActive: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                // NavigationLink for programmatic navigation
                NavigationLink(
//                    destination: CityWeatherDetailView(cityName: searchText),
                    destination: CurrentWeatherView(),
                    isActive: $isNavigationActive
                ) {
                    EmptyView()
                }

                // Main Search View
                Text("Enter a city name to search for weather")
                    .padding()
                    .navigationTitle("Search")
                    .searchable(text: $searchText)
                    .onSubmit(of: .search) {
                        isNavigationActive = true
                    }
            }
            .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    CityWeatherView()
}
