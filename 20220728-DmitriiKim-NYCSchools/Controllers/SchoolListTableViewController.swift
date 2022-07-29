//
//  SchoolListTableViewController.swift
//  20220728-DmitriiKim-NYCSchools
//
//  Created by Mitya Kim on 7/28/22.
//

import UIKit

class SchoolListTableViewController: UITableViewController {
    
    // MARK: - Properties
    private var schools: [School] = []

    // MARK: - Outlets
    @IBOutlet var schoolListTableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllSchools()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schools.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "schoolCell", for: indexPath) as? SchoolTableViewCell else { return UITableViewCell() }
        let school = schools[indexPath.row]
        cell.school = school
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue",
           let indexPath = schoolListTableView.indexPathForSelectedRow,
           let destinationVC = segue.destination as? DetailsViewController {
            let school = schools[indexPath.row]
            destinationVC.dbnSchool = school.dbn
            destinationVC.school = school
        }
    }
    
    // MARK: - Helper Methods
    private func fetchAllSchools() {
        WebServiceManager.fetchAllSchools { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let schools):
                    self?.schools = schools
                    self?.schoolListTableView.reloadData()
                case .failure(let error):
                    print(error)
                    print(error.localizedDescription)
                }
            }
        }
    }
}
