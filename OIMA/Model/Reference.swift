//
//  Reference.swift
//  OIMA
//
//  Created by Michael Albrecht on 10/7/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

//Citation is used to create a reference to the medical literature

import Foundation
import SwiftUI

struct Citation: Hashable {
    let first: String
    let italicized: String
    let last: String
    
    init(first: String, italicized: String, last: String) {
        self.first = first
        self.italicized = italicized
        self.last = last
    }
}
