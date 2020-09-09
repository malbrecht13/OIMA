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
}

