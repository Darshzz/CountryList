//
//  ViewController.swift
//  CountryApp
//
//  Created by Darsh on 25/07/24.
//

import UIKit

class CountryListViewController: UIViewController {

    @IBOutlet weak var lblCurrentDate: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private let viewModel = CountryListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchCountryList()
    }


}

extension CountryListViewController {
    
    func fetchCountryList() {
        viewModel.fetchCountryList()
        viewModel.reloadTableView = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension CountryListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countryList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableCell", for: indexPath) as! CountryTableCell
        
        cell.configureCell(model: viewModel.countryList[indexPath.row])
        return cell
    }
}
