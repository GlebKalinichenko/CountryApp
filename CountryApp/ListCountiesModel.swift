//
//  ListCountiesModel.swift
//  CountryApp
//
//  Created by Gleb Kalinichenko on 26.09.17.
//  Copyright © 2017 Gleb Kalinichenko. All rights reserved.
//

import Foundation
import Alamofire

public class ListCountriesModel {
    var apiDataSource = CountriesApiDataSource()
    
    
    /// Receive list countries from REST API
    ///
    /// - Returns: request with list of countries
    func receiveAllCountris() -> DataRequest {
        return apiDataSource.receiveListCountries()
    }
}
