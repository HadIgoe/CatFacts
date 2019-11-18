//
//  CatFactCell.swift
//  Catfacts
//
//  Created by Hadley Igoe on 2019-11-19.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import UIKit


class CatFactCell: UITableViewCell {
    
     @IBOutlet weak var authorLabel: UILabel!
     @IBOutlet weak var factsLabel: UILabel!

    func configCell(catFactsData: All) {
        factsLabel.text = "FACT \n\n" + catFactsData.text
        authorLabel.text = "By: " + (catFactsData.user?.name.fullName() ?? "Anonymous")
    }
}
