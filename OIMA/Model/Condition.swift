//
//  Condition.swift
//  OIMA
//
//  Created by Michael Albrecht on 8/24/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import SwiftUI

enum FieldOfMedicine: String, CaseIterable {
    case ID = "Infectious Disease"
    case nephrology = "Nephrology"
    case rheumatology = "Rheumatology"
    case hematology = "Hematology"
    case oncology = "Oncology"
    case cardiology = "Cardiology"
    case endocrinology = "Endocrinology"
    case woundCare = "Wound Care"
    case sportsMed = "Sports Medicine/Orthopedics"
}

struct Condition: Identifiable {
    let id = UUID()
    let name: String
    let field: FieldOfMedicine
    var isFavorite: Bool = false
    var nextView: AnyView

}
