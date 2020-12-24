//
//  NextButton1.swift
//  OIMA
//
//  Created by Michael Albrecht on 12/23/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct NextButton1: View {
    
    @Binding var nextView: Bool
    let fillColor: Color
    
    var body: some View {
        Button(action: {
            nextView = true
        }) {
            Text("Next")
        }.buttonStyle(NextButtonStyle(fillColor: fillColor))
    }
}
