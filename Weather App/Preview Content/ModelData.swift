//
//  ModelData.swift
//  Weather App
//
//  Created by Hillol Talukdar on 12/11/24.
//

import Foundation
// for weather data: https://api.openweathermap.org/data/2.5/weather?q=dhaka&appid=58d86cfff245d9067abd8ee20410ecbd&units=metric
var previewWeather: ResponseBody = load("weatherData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
