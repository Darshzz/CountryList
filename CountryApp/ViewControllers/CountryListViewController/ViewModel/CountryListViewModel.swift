//
//  CountryListViewModel.swift
//  CountryApp
//
//  Created by Darsh on 26/07/24.
//

import Foundation

final class CountryListViewModel {
    
    var countryList: [CountryDetailModel] = []
    private let serviceManager: ServiceManager = ServiceManager.live
    
    var reloadTableView: (() -> Void)?
    
    func fetchCountryList() {
        Task {
            do {
                countryList = try await serviceManager.fetchCountryList()
                print(countryList)
                reloadTableView?()
            }catch {
                // show some error
            }
        }
    }
    
}
