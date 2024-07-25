//
//  CountryDetailModel.swift
//  CountryApp
//
//  Created by Darsh on 25/07/24.
//

import Foundation

struct CountryDetailModel: Decodable {
    
    let name: String
    let capital: String
    let currency: String
    var population: Int32?
    let media: MediaModel
    
    struct MediaModel: Decodable {
        let flag: String
    }
}
