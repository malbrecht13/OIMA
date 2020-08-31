//
//  InfluencingFactorsTx.swift
//  OIMA
//
//  Created by Michael Albrecht on 8/27/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct VTEAnticoagChoiceInfluencers: View {
    
    @ObservedObject var vte: VTEData
    @State private var nextView = false
    
    var body: some View {
        VStack {
        Form {
            Section(header: Text("Below are factors that influence anticoagulant choice.  Select any that apply.").font(.headline).foregroundColor(purple).padding()) {
                ShowToggle(binding: $vte.liverDisease, count: $vte.insignificantCount, text: "Liver disease with coagulopathy")
                ShowToggle(binding: $vte.lowCrClearance, count: $vte.insignificantCount, text: "CrCl < 30 mL/min")
                ShowToggle(binding: $vte.cad, count: $vte.insignificantCount, text: "History of CAD")
                ShowToggle(binding: $vte.GIBleedhx, count: $vte.insignificantCount, text: "History of GI bleed")
                Text("If none apply, simply select the 'Next' button below").font(.caption)
            }
        }
            
            NavigationLink(destination: VTEBleedingRisk(vte: vte), isActive: $nextView) {
                EmptyView()
            }
            
            Button(action: {
                self.nextView = true
                print(self.vte.malignancy)
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: purple))
        }.navigationBarTitle("Anticoagulation influencers", displayMode: .inline)
        
        
    }
}

struct InfluencingFactorsTx_Previews: PreviewProvider {
    static var previews: some View {
        VTEAnticoagChoiceInfluencers(vte: VTEData())
    }
}
