//
//  Condition.swift
//  OIMA
//
//  Created by Michael Albrecht on 8/24/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import SwiftUI

struct Condition: Identifiable {
    let id = UUID()
    let name: String
    var isFavorite: Bool = false
    var nextView: AnyView
}


