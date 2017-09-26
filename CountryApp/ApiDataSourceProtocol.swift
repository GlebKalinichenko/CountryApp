//
//  ApiDataSourceProtocol.swift
//  CountryApp
//
//  Created by Gleb Kalinichenko on 26.09.17.
//  Copyright © 2017 Gleb Kalinichenko. All rights reserved.
//

import Foundation

public protocol ApiDataSourceProcol {
    func receiveListCountries() -> [CountryEntity]
    func receiveItemCountry(countryCode: String) -> CountryEntity
}
