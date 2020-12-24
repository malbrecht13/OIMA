//
//  MHData.swift
//  OIMA
//
//  Created by Michael Albrecht on 12/24/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

//for Microscopic hematuria

class MHData: ObservableObject {
    //for MHNonCancerCauses.swift
    @Published var nonCancerCause = 0 // 0 is yes a non-cancer cause is likely, 1 is no
    
    //for HighRiskMH.swift
    @Published var highRFs = 0 // 0 is yes for high risk factors, 1 is no
    
    //for IntRiskMH.swift
    @Published var intRFs = 0 // 0 is yes for intermediate risk factors, 1 is no
}
