//
//  ItemCountryPresenter.swift
//  CountryApp
//
//  Created by Gleb Kalinichenko on 26.09.17.
//  Copyright © 2017 Gleb Kalinichenko. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol ItemCountriesView : NSObjectProtocol {
    func startProgressIndicator()
    func finishProgressIndicator()
    func showCountryContent(country: CountryEntity)
}

public class ItemCountryPresenter {
    private var model : ItemCountryModel
    private weak var view : ItemCountriesView?
    private var countryCode : String
    
    init(model: ItemCountryModel, countryCode : String, view: ItemCountriesView) {
        self.view = view
        self.model = model
        self.countryCode = countryCode
    }
    
    func receiveItemCountry() {
        model.receiveItemCountry(countryCode: countryCode).responseJSON { response in
            guard (response.data) != nil else {
                fatalError()
            }
            
            let json = JSON(data: response.data!)
            let countryName = json["name"].string
            let countryCode = json["alpha2Code"].string
            let countryCapital = json["capital"].string
            let countryFlag = json["flag"].string
            let country = CountryEntity(code: countryCode, countryName: countryName, url: countryFlag, capital: countryCapital)
            
            self.view?.showCountryContent(country: country)
        }
    }
}
