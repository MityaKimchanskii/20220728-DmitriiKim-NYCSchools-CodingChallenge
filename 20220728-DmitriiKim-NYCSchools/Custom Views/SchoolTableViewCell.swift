//
//  SchoolTableViewCell.swift
//  20220728-DmitriiKim-NYCSchools
//
//  Created by Mitya Kim on 7/28/22.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var school: School? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    // MARK: - Helper Methods
    private func updateView() {
        guard let school = school else { return }
        nameLabel.text = school.name
        locationLabel.text = "Adress: \(school.address)"
        phoneLabel.text = "Phone: \(school.phone)"
        guard let email = school.email else { return }
        emailLabel.text = "Email: \(email)"
        websiteLabel.text = "Website: \(school.website)"
    }
}
