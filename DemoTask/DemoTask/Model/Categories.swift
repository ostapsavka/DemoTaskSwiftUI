//
//  Categories.swift
//  DemoTask
//
//  Created by Sawka Ostap on 22.07.2020.
//  Copyright © 2020 SavkaOstap. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct CoctailCategories: Decodable {
    let drinks: [Category]
    
    struct Category: Decodable {
        let strCategory: String
    }
}
