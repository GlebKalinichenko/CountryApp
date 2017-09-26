//
//  ApiDataSourceProtocol.swift
//  CountryApp
//
//  Created by Gleb Kalinichenko on 26.09.17.
//  Copyright © 2017 Gleb Kalinichenko. All rights reserved.
//

import Foundation
import Alamofire

public protocol ApiDataSourceProcol {
    func receiveListCountries() -> DataRequest
    func receiveItemCountry(countryCode: String) -> DataRequest
}
