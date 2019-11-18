//
//  CatFactsService.swift
//  Catfacts
//
//  Created by Hadley Igoe on 2019-11-18.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import Foundation
import Alamofire

class CatFactsService {
    let FACTS_URL = "https://cat-fact.herokuapp.com/facts"
    
    var catFacts: CatFact?

    func fetchData(completion: @escaping ([All], Bool) -> Void){
        Alamofire.request(FACTS_URL, method: .get).responseJSON { response in
            if response.result.isSuccess{
                guard let data = response.data else {return}
                if let json = try? JSONDecoder().decode(CatFact.self, from: data) {
                    completion(json.all, false)
                } else {
                    completion([], true)
                }
            } else {
                completion([], true)
            }
        }
    }
}

