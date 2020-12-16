//
//  CoughData.swift
//  OIMA
//
//  Created by Michael Albrecht on 11/16/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class CoughData: ObservableObject {
    
    //CoughRedFlags.swift
    @Published var coughRedFlags = 0 //yes is 0, no is 1
    
    //BenignCough.swift
    @Published var coughEasyFixes = 0 //yes is 0, no is 1
    
    //CoughCommonCauses.swift
    @Published var commonCausesRO = 0 //yes is 0, no is 1
}
