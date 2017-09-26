//
//  ItemCountryModel.swift
//  CountryApp
//
//  Created by Gleb Kalinichenko on 26.09.17.
//  Copyright © 2017 Gleb Kalinichenko. All rights reserved.
//

import Foundation
import Alamofire

public class ItemCountryModel {
    var apiDataSource = CountriesApiDataSource()
    
    
    func receiveItemCountry(countryCode: String) -> DataRequest {
       return apiDataSource.receiveItemCountry(countryCode: countryCode)
    }
}
