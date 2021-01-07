//
//  SyncopeData.swift
//  OIMA
//
//  Created by Michael Albrecht on 1/7/21.
//  Copyright © 2021 Michael Albrecht. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class SyncopeData: ObservableObject {
    //SyncopeQuestions.swift
    @Published var structuralHD = false
    @Published var arrhythmia = false
    @Published var exertional = false
    @Published var orthostatic = false
    @Published var vvs = false
}
