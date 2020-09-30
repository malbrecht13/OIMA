//
//  SinusitisData.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/22/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class SinusitisData: ObservableObject {
    
    //in SinusitisDuration.swift
    @Published var duration = 0 // 0 is < 4 weeks, 1, is 4-12 weeks, 2 is > 12 weeks
    @Published var subacute = 0 // 0 is acute, 1 is chronic
    
    //in AcuteSinusitis.swift
    @Published var purulent = false
    @Published var obstruction = false
    @Published var faceSymptoms = false
    @Published var complication = false
    
    //in ViralVBacterialSinusitis.swift
    @Published var notImproved10Days = false
    @Published var worsenIn10Days = false
}
