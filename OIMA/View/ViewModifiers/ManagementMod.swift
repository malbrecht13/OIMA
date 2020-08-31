//
//  ManagementMod.swift
//  OIMA
//
//  Created by Michael Albrecht on 8/30/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import SwiftUI

struct ManagementMod: ViewModifier {
    
    var textColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(textColor)
            .font(.largeTitle)
            .padding()
    }
}

