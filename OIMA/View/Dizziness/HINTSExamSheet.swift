//
//  HINTSExamSheet.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/9/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct HINTSExamSheet: View {
    var body: some View {
        
        VStack {
            Text("HINTS exam instructions").modifier(TitleModifier(fillColor: green)).padding(.bottom)
            
            Button(action: {
                let url = URL(string: "https://youtu.be/1q-VTKPweuk")
                
                if let url = url {
                    UIApplication.shared.open(url)
                }
                
            }) {
                Text("HINTS exam YouTube Video")
            }.buttonStyle(NextButtonStyle(fillColor: red))
            
            VStack(alignment: .leading, spacing: 10) {
                Text("This test is to be performed in patients with ongoing vertigo and nystagmus. HINTS consists of three exam maneuvers, described below:")
                
                Text("Head-impulse test")
                Text("\n")
            }
        }
    }
}

struct HINTSExamSheet_Previews: PreviewProvider {
    static var previews: some View {
        HINTSExamSheet()
    }
}
