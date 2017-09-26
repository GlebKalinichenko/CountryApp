//
//  CountriesUITableTableViewController.swift
//  CountryApp
//
//  Created by Gleb Kalinichenko on 25.09.17.
//  Copyright © 2017 Gleb Kalinichenko. All rights reserved.
//

import UIKit

class CountriesUITableTableViewController: UITableViewController {
    var countries = [CountryEntity] ()
    let presenter = ListCountriesPresenter(model: ListCountriesModel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        presenter.receiveCounries()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryItemListId", for: indexPath) as? CountryTableViewCell else {
            fatalError()
        }
        let country = countries[indexPath.row]
        cell.countryName.text = country.countryName

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let curCountry = countries[indexPath.row]
        self.performSegue(withIdentifier: "countrySegue", sender: curCountry);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow
        var rowIndex = indexPath!.row
        let country = countries[rowIndex]
        
        guard let countryViewController = segue.destination as? CountryItemUIViewController else {
            fatalError()
        }
        countryViewController.country = country
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CountriesUITableTableViewController : ListCountriesView {
    func startProgressIndicator() {
        
    }
    
    func finishProgressIndicator() {
        
    }
    
    func showCountriesList(countries: [CountryEntity]) {
        self.countries = countries
        tableView.reloadData()
    }
}

