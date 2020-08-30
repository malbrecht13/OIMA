//
//  SegmentedPickerModifier.swift
//  medlearn
//
//  Created by Michael Albrecht on 6/3/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import Foundation
import SwiftUI

struct SegmentedPickerModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
        .pickerStyle(SegmentedPickerStyle())
        .frame(minWidth: 200, maxWidth: 350 )
        .labelsHidden()
        .padding(.bottom, 20)
    }
}


