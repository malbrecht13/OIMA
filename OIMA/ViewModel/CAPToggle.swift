//
//  CAPToggle.swift
//  medlearn
//
//  Created by Michael Albrecht on 8/7/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

//for Toggles in Community Acquired pneumonia

class CAPToggle: ObservableObject {
    
    //variables for OutpatientCAP.swift
    @Published var selection = 0
}
