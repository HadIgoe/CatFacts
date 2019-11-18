//
//  ViewController.swift
//  Catfacts
//
//  Created by Hadley Igoe on 2019-11-15.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import UIKit

class CatFactViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let headerTitle = "Cat Facts \n by \n Hadley Igoe"
    var catFactsService = CatFactsService()
    private var allCatFacts: [All] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    
    private func loadData() {
        catFactsService.fetchData { data, error in
            !error ? self.allCatFacts = (data): print("There was an error...")
            !error ? self.setupTableView(): print("There was an error...")
        }
    }
    
    private func setupTableView() {
        let headerNib = UINib.init(nibName: "CatFactHeaderView", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "CatFactHeaderView")
        tableView.reloadData()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
}

extension CatFactViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CatFactHeaderView") as? CatFactHeaderView else {return UIView()}
        headerView.title = headerTitle
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCatFacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CatFactCell", for: indexPath)
            as? CatFactCell else {return UITableViewCell()}
        let catFact = allCatFacts[indexPath.row]
        cell.configCell(catFactsData: catFact)
        return cell
    }
}

