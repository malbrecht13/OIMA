//
//  VTEProvokingFactors.swift
//  OIMA
//
//  Created by Michael Albrecht on 8/26/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct VTEProvokingFactors: View {
    
    @ObservedObject var vte: VTEData
    
    private let fillColor = Color(hue: 0.67, saturation: 0.46, brightness: 0.69, opacity: 1.00)
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Select any provoking factors that apply").font(.headline).foregroundColor(fillColor).padding()) {
                    ShowToggle(binding: $vte.surgery, count: $vte.insignificantCount, text: "Surgery in last 3 months")
                    ShowToggle(binding: $vte.malignancy, count: $vte.insignificantCount, text: "Active malignancy")
                    ShowToggle(binding: $vte.estrogen, count: $vte.insignificantCount, text: "Estrogen therapy")
                    ShowToggle(binding: $vte.flight8hours, count: $vte.insignificantCount, text: "Flight/trip > 8 hours")
                    ShowToggle(binding: $vte.legInjury, count: $vte.insignificantCount, text: "Significant leg injury")
                    ShowToggle(binding: $vte.pregnancy, count: $vte.insignificantCount, text: "Pregnancy")
                }
            }
            
            Button(action: {
                //do something
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: fillColor))
            }.navigationBarTitle("Provoking factors", displayMode: .inline)
    }
}

struct VTEProvokingFactors_Previews: PreviewProvider {
    static var previews: some View {
        VTEProvokingFactors(vte: VTEData())
    }
}
