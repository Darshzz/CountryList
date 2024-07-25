//
//  APIClient.swift
//  OnlineStoreMV
//
//  Created by Pedro Rojas on 05/03/24.
//

import Foundation

struct ServiceManager {
    var fetchCountryList: () async throws -> [CountryDetailModel]
    
    struct Failure: Error, Equatable {}
}

// This is the "live" fact dependency that reaches into the outside world to fetch the data from network.
// Typically this live implementation of the dependency would live in its own module so that the
// main feature doesn't need to compile it.
extension ServiceManager {
    static let live = Self(
        fetchCountryList: {
            let (data, response) = try await URLSession.shared
                .data(from: URL(string: "https://api.sampleapis.com/countries/countries")!)
            print("response ======================\n", response)
            let countries = try JSONDecoder().decode([CountryDetailModel].self, from: data)
            return countries
        }
    )
}

