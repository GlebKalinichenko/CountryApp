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
    
    init(code: String?, countryName: String?) {
        self.code = code
        self.countryName = countryName
    }
    
    convenience init(code: String?, countryName: String?, capital: String?) {
        self.init(code: code, countryName: countryName)
        self.capital = capital
    }
}
