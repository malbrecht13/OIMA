//
//  TitleModifier.swift
//  OIMA
//
//  Created by Michael Albrecht on 8/26/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import SwiftUI

struct TitleModifier: ViewModifier {
    var fillColor = Color(hue: 0.67, saturation: 0.46, brightness: 0.69, opacity: 1.00)
    
    var foregroundColor = Color.white
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, minHeight: 15, maxHeight: 20)
            .font(.headline)
        .foregroundColor(foregroundColor)
        .padding(10)
        .cornerRadius(10.0)
        .background(fillColor)
        .padding(.vertical)
    }
}
