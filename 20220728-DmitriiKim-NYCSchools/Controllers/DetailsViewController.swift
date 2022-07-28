//
//  DetailsViewController.swift
//  20220728-DmitriiKim-NYCSchools
//
//  Created by Mitya Kim on 7/28/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - Properties
    var school: School?
    var dbnSchool: String?

    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mathSATLabel: UILabel!
    @IBOutlet weak var readingSATLabel: UILabel!
    @IBOutlet weak var writingSATLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDetails()
        updateView()
    }
    
    // MARK: - Helper Methods
    func fetchDetails() {
        guard let dbnSchool = dbnSchool else { return }
        guard let description = school?.description else { return }
        WebServiceManager.fetchSchoolDetails(dbn: dbnSchool) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let details):
                    self?.overviewLabel.text = description
                    self?.nameLabel.text = "\(details.name)"
                    self?.mathSATLabel.text = "SAT Math Score: \(details.mathSAT)"
                    self?.readingSATLabel.text = "SAT Reading Score: \(details.readingSAT)"
                    self?.writingSATLabel.text = "SAT Writing Score: \(details.writingSAT)"
                    self?.view.reloadInputViews()
                case .failure(let error):
                    print(error)
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func updateView() {
        guard let description = school?.description else { return }
        if nameLabel.text == "(Name)" {
            overviewLabel.text = description
            nameLabel.text = school?.name
            mathSATLabel.text = "SAT Math: No SAT Information"
            readingSATLabel.text = "SAT Reading: No SAT Information"
            writingSATLabel.text = "SAT Writing: No SAT Information"
        }
    }
}
