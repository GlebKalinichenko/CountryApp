//
//  CountryEntity.swift
//  CountryApp
//
//  Created by Gleb Kalinichenko on 25.09.17.
//  Copyright © 2017 Gleb Kalinichenko. All rights reserved.
//

import Foundation

public class CountryEntity {
    var code: String?
    var countryName: String?
    var capital: String?
    var url: String?
    
    init(code: String?, countryName: String?, url: String?) {
        self.code = code
        self.countryName = countryName
        self.url = url
    }
    
    convenience init(code: String?, countryName: String?, url: String?, capital: String?) {
        self.init(code: code, countryName: countryName, url: url)
        self.capital = capital
    }
}
