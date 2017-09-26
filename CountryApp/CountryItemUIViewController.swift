//
//  CountryItemUIViewController.swift
//  CountryApp
//
//  Created by Gleb Kalinichenko on 25.09.17.
//  Copyright © 2017 Gleb Kalinichenko. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CountryItemUIViewController: UIViewController {
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    var country: CountryEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItemCountry()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func loadItemCountry() {
    
        Alamofire.request("https://restcountries.eu/rest/v2/alpha/" + country!.code!).responseJSON { response in
            guard (response.data) != nil else {
                fatalError()
            }
            
            let json = JSON(data: response.data!)
            let countryName = json["name"].string
            let countryCode = json["alpha2Code"].string
            let countryCapital = json["capital"].string
            self.country?.code = countryCode
            self.country?.countryName = countryName
            self.country?.capital = countryCapital
            
            self.setCountryContent()
        }
    }
    
    private func setCountryContent() {
        countryLabel.text = country?.countryName
        capitalLabel.text = country?.capital
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
