//
//  JsonHelper.swift
//  CountryApp
//
//  Created by Gleb Kalinichenko on 25.09.17.
//  Copyright © 2017 Gleb Kalinichenko. All rights reserved.
//

import Foundation
import SwiftyJSON

public class JsonHelper {
    
    
    public static func parseCountriesJson(key1: String, key2: String, key3: String, json: JSON) -> [CountryEntity] {
        var countries = [CountryEntity]()
        
        for (index, subJson):(String, JSON) in json {
            var countryName = subJson.dictionary?[key1]?.string
            var countryCode = subJson.dictionary?[key2]?.string
            var url = subJson.dictionary?[key3]?.string
            countries.append(CountryEntity(code: countryCode, countryName: countryName, url: url))
        }
        
        return countries
    }
}
