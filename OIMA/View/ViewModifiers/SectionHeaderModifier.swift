//
//  SectionHeaderModifier.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/23/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import SwiftUI

struct SectionHeaderModifier: ViewModifier {
    
    var textColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(textColor)
            .padding()
    }
    
}
