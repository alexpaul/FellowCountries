//
//  ViewController.swift
//  FellowCountries
//
//  Created by Alex Paul on 11/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CountryListController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var continents = [[Country]]() {
    didSet { // using didSet{....} property observer to reload the table view
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // need to get access the continents array of arrays in Country.swift file
    
    // review: we have instance methods and we have type methods
    // an instance method is called explicity on the instance
    // let nigeria = Country() - nigeria is an instance of Country
    // nigeria.info()
    
    // Country is a type
    // getContinents() is a type method, it's defined as static func getContinents()
    continents = Country.getContinents()
    
    // set the view controller as the data source for the table view
    tableView.dataSource = self
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    // 1. we need a reference to the country detail controller
    // 2. which indexPath got selected so we can retrieve the country at the indexPath
    guard let countryDC = segue.destination as? CountryDetailController,
      let indexPath = tableView.indexPathForSelectedRow else {
      fatalError("country detail controller, indexPath failed to be configured")
    }
    
    // 3. we will use the indexPath to get the selected country
    // 4. then we will set the countryDC.country property
    let country = continents[indexPath.section][indexPath.row]
    countryDC.country = country // this needs to be set or it will be nil in country detail controller
  }
  
}

// step 1: conform to UITableViewDataSource
extension CountryListController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // since we have sections (array of arrays), we need to return the section's count
    // each section (continent) knows how many countries it has,
    // e.g Africa for now has 1 country
    continents[section].count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryCell else {
      // explicity crashed the app at runtime if
      // a CountryCell does not exist, this is a developer error
      fatalError("Couldn't dequeue a CountryCell")
    }
    
    // get the object (country) to be set an the current indexPath
    let country = continents[indexPath.section][indexPath.row]
    
    // configure the country cell
    cell.configureCell(for: country)
    
    return cell
  }
  
  // 2 more section specific protocol methods we need
  // default count for sections is 1 if numberOfSections is not implemented
  func numberOfSections(in tableView: UITableView) -> Int {
    return continents.count // 5
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return continents[section].first?.continent // e.g "Africa"
  }
}
