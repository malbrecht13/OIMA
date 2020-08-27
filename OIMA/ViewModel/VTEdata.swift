//
//  VTEdata.swift
//  OIMA
//
//  Created by Michael Albrecht on 8/26/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class VTEData: ObservableObject {
    //Used in VTEFirst.swift
    @Published var selection = 0
    
    //Used in VTEProvokingFactors.swift
    @Published var insignificantCount = 0
    @Published var surgery = false
    @Published var malignancy = false
    @Published var estrogen = false
    @Published var pregnancy = false
    @Published var legInjury = false
    @Published var flight8hours = false
    
    //Used in ProximalDistalDVT.swift
    @Published var proxDistSelection = 0
    @Published var severeSymptoms = 0
    
}
