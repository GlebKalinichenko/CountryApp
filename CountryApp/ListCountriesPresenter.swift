//
//  ListCountriesPresenter.swift
//  CountryApp
//
//  Created by Gleb Kalinichenko on 26.09.17.
//  Copyright © 2017 Gleb Kalinichenko. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol ListCountriesView : NSObjectProtocol {
    func startProgressIndicator()
    func finishProgressIndicator()
    func showCountriesList(countries: [CountryEntity])
}

public class ListCountriesPresenter {
    private var countries = [CountryEntity]()
    private weak var view : ListCountriesView?
    private let model  : ListCountriesModel
    
    init(model: ListCountriesModel) {
        self.model = model
    }
    
    func attachView(view : ListCountriesView) {
        self.view = view
    }
    
    
    /// Receive list of countries from REST API
    func receiveCounries() {
        model.receiveAllCountris().responseJSON { response in
            let json = JSON(data: response.data!)
            self.countries = JsonHelper.parseCountriesJson(key1: "name", key2: "alpha2Code", key3: "flag", json: json)
         
            print(response.result)
            print(response.response)

            self.view?.showCountriesList(countries: self.countries)
        }
    }
}
