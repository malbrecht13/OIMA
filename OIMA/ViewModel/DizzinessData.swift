//
//  DizzinessData.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/9/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class DizzinessData: ObservableObject {
    
    //DizzinessFirst.swift
    @Published var symptDuration = 0  //0 is < 1 minute, 1 is > 1 minute
    @Published var triggered = 0  //0 is yes, 1 is no
    
    //EpisodicTriggeredDizziness.swift
    @Published var dh = 1 // 0 is Yes (Dix-Hallpike abnormal), 1  is no (not abnormal)
    @Published var ov = 1 // 0 is Yes (orthostatic vitals abnormal), 1 is no (not abnormal)
    
    //EpisodicSpontaneous.swift (toggles)
    @Published var hearingLoss = false  //if assymetric, need MRI brain to r/o Schwannoma.  Could also be Meniere's
    @Published var nystagmus = false
    @Published var migraine = false
    @Published var trauma = false
    @Published var medications = false
    @Published var alcohol = false
    @Published var psych = false
    @Published var neuroDeficits = false // doubleVision, gait or limb ataxia, new focal neurologic deficits
    @Published var nullCount = 0
    
    //Used in NeuroTestsDizziness.swift
    @Published var hints = 0 // 0 is yes (HINTS is abnormal), 1 is no (HINTS is normal)
}

