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
    @Published var occurrence = 0
    @Published var vteOnAnticoag = 0
    
    //Used in VTEProvokingFactors.swift
    @Published var provokedCount = 0
    @Published var surgery = false
    @Published var malignancy = false
    @Published var estrogen = false
    @Published var pregnancy = false
    @Published var legInjury = false
    @Published var flight8hours = false
    
    //Used in ProximalDistalDVT.swift
    @Published var proxDistSelection = 0
    @Published var severeSymptoms = 0 //0 is "Yes", 1 is "No"
    
    //Used in VTEAnticagChoiceInfluencers.swift
    @Published var liverDisease = false
    @Published var lowCrClearance = false
    @Published var cad = false
    @Published var GIBleedhx = false
    //malignancy above also matters here
    //pregnancy above also matters here
    
    //Used in VTEBleedingRisk.swift
    @Published var bleedRFCount = 0
    @Published var age60 = false  //1.5 points
    @Published var previousBleed = false //1.5 points
    @Published var activeCancer = false //2 points
    @Published var renalFailure = false //1.5 points
    @Published var anemia = false //1.5 points
    @Published var maleHTN = false //1 point
    
    

    
}
