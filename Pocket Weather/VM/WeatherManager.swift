//
//  WeatherManager.swift
//  Pocket Weather
//
//  Created by Geoffrey Johnson on 1/7/22.
//

import SwiftUI
import Combine

class WeatherManager {
    // Retrieve stored key for OpenWeather API
    let API_KEY = Bundle.main.infoDictionary?["WEATHER_API_KEY"] as! String
    let urlBase = "http://api.openweathermap.org/"
    let defaultLocation = Location(name: "Vancouver", state: "British Columbia", country: "CA", lat: 49.2608724, lon: -123.113952)  // TEST DATA: TODO => Remove

    
    func getWeatherData(loc: Location) {
        // URL to retrieve weather for the returned lat and lon
        //    static let weatherUrl = "https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&appid={WEATHER_API_KEY}"
        print(loc)
    }
    
    func getLatLon(location: String) async throws -> Location {
        let limit = 1
        // URL to retrieve latitude and longitude for searched location
        guard let geoUrl = URL( string: "\(urlBase)/geo/1.0/direct?q=\(location)&limit=\(limit)&appid=\(API_KEY)") else { fatalError("unable to retrieve location") }
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: geoUrl))
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("unable to retrieve location")
        }
        
        // Decode data returned (an array of locations with length of 1)
        let locData = try JSONDecoder().decode([Location].self, from: data)
        return locData[0]
    }
}
