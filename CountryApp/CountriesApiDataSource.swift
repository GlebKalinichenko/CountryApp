//
//  CountriesApiDataSource.swift
//  CountryApp
//
//  Created by Gleb Kalinichenko on 26.09.17.
//  Copyright © 2017 Gleb Kalinichenko. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class CountriesApiDataSource : ApiDataSourceProcol {
    
    
    public func receiveListCountries() -> DataRequest {
        return Alamofire.request("https://restcountries.eu/rest/v2/all")
    }
    
    public func receiveItemCountry(countryCode: String) -> CountryEntity {
        var country: CountryEntity?
        
        Alamofire.request("https://restcountries.eu/rest/v2/alpha/" + countryCode).responseJSON { response in
            guard (response.data) != nil else {
                fatalError()
            }
            
            let json = JSON(data: response.data!)
            let countryName = json["name"].string
            let countryCode = json["alpha2Code"].string
            let countryCapital = json["capital"].string
            let countryFlag = json["flag"].string
            country?.code = countryCode
            country?.countryName = countryName
            country?.capital = countryCapital
            country?.url = countryFlag
        }
        
        return country!
    }
    
    
}
