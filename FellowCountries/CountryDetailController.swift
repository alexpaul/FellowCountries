//
//  CountryDetailController.swift
//  FellowCountries
//
//  Created by Alex Paul on 11/18/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CountryDetailController: UIViewController {
  
  @IBOutlet weak var countryImageView: UIImageView!
  @IBOutlet weak var countryDescriptionLabel: UILabel!
  
  // we need the object (country) coming from the CountryListController
  
  var country: Country?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }
  
  // helper method
  func updateUI() {
    guard let theCountry = country else {
      fatalError("Couldn't get a country value, verify prepare(for segue: )")
    }
    // set the navigation title
    navigationItem.title = theCountry.name // title is a property on the view controller
    countryImageView.image = UIImage(named: theCountry.fullImageName)
    countryDescriptionLabel.text = theCountry.countryDescription
  }
}
