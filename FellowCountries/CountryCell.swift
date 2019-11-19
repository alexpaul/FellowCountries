//
//  CountryCell.swift
//  FellowCountries
//
//  Created by Alex Paul on 11/18/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

// Steps to connect Custom Cell to Storybard:
// 1. Click on the cell in storyboard
// 2. Navigate to the "identity inspector" for the cell
// 3. Change the default UITableViewCell to the name of your
//    custom cell in this case it is CountryCell

class CountryCell: UITableViewCell {
  
  @IBOutlet weak var countryImageView: UIImageView!
  @IBOutlet weak var countryNameLabel: UILabel!
  @IBOutlet weak var countryDescriptionLabel: UILabel!
  @IBOutlet weak var countryFlagImageView: UIImageView!
  
  
  // additional view setup code needs to be in the override layoutSubviews() method
  override func layoutSubviews() {
    super.layoutSubviews()
    
    // make the country image view circular
    // we use half the diameter to get the radius of the circle
    // e.g if diameter is 100, the radius is 50
    
    // at the bottom of a UIView is a CALayer
    countryImageView.layer.cornerRadius = countryImageView.frame.size.width / 2
  }
  
  // method to update UI elements for the cell
  // this method will be called by the cellForRowAt() in the
  // CountryListConroller
  func configureCell(for country: Country) {
    countryImageView.image = UIImage(named: country.thumbnailImageName)
    countryNameLabel.text = country.name
    countryDescriptionLabel.text = country.countryDescription
    countryFlagImageView.image = UIImage(named: country.countryCode) // "UA"
  }
}
