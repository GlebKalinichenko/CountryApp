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
import Kingfisher

class CountryItemUIViewController: UIViewController {
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    var country: CountryEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setCountryContent() {
        countryLabel.text = country?.countryName
        capitalLabel.text = country?.capital
        let url = URL(string: (country?.url!)!)
        countryImage.kf.setImage(with: url)
    }
    
    private func startProgressIndicator() {
        progressIndicator.isHidden = false
        progressIndicator.startAnimating()
    }
    
    private func stopProgressIndicator() {
        progressIndicator.stopAnimating()
        progressIndicator.isHidden = true
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
