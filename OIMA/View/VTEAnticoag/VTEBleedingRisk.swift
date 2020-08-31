//
//  VTEBleedingRisk.swift
//  OIMA
//
//  Created by Michael Albrecht on 8/27/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct VTEBleedingRisk: View {
    
    @ObservedObject var vte: VTEData
    @State private var nextView = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Now select all bleeding risk factors that apply").font(.headline).foregroundColor(purple).padding()) {
                    ShowToggle(binding: $vte.age60, count: $vte.bleedRFCount, text: "Age ≥ 60 years")
                    ShowToggle(binding: $vte.previousBleed, count: $vte.bleedRFCount, text: "Previous bleed")
                    ShowToggle(binding: $vte.anemia, count: $vte.bleedRFCount, text: "Anemia")
                    ShowToggle(binding: $vte.activeCancer, count: $vte.bleedRFCount, text: "Active cancer")
                    ShowToggle(binding: $vte.renalFailure, count: $vte.bleedRFCount, text: "Renal insufficiency/failure")
                    ShowToggle(binding: $vte.maleHTN, count: $vte.bleedRFCount, text: "Male with uncontrolled hypertension")
                    Text("Based on VTE-BLEED score").font(.caption)
                }
            }
            NavigationLink(destination: VTEManagement(vte: vte), isActive: $nextView) {
                Button(action: {
                    self.nextView = true
                    print(self.vte.malignancy)
                }) {
                    Text("Next")
                }.buttonStyle(NextButtonStyle(fillColor: purple))
            }
           
        }.navigationBarTitle("Bleeding risk", displayMode: .inline)
    }
}

struct VTEBleedingRisk_Previews: PreviewProvider {
    static var previews: some View {
        VTEBleedingRisk(vte: VTEData())
    }
}
