//
//  CatFactHeaderView.swift
//  Catfacts
//
//  Created by Hadley Igoe on 2019-11-19.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//
import UIKit

class CatFactHeaderView: UITableViewHeaderFooterView {
    
    static let reuseIdentifier: String = String(describing: self)

    @IBOutlet weak var headerLabel: UILabel!
    
    var title: String? {
        get { return headerLabel.text }
        set { headerLabel.text = newValue }
    }
}
