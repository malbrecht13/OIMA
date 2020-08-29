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
    @State private var nextView = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Select any provoking factors that apply").font(.headline).foregroundColor(purple).padding()) {
                    ShowToggle(binding: $vte.surgery, count: $vte.insignificantCount, text: "Surgery in last 3 months")
                    ShowToggle(binding: $vte.malignancy, count: $vte.insignificantCount, text: "Active malignancy")
                    ShowToggle(binding: $vte.estrogen, count: $vte.insignificantCount, text: "Estrogen therapy")
                    ShowToggle(binding: $vte.flight8hours, count: $vte.insignificantCount, text: "Flight/trip > 8 hours")
                    ShowToggle(binding: $vte.legInjury, count: $vte.insignificantCount, text: "Significant leg injury")
                    ShowToggle(binding: $vte.pregnancy, count: $vte.insignificantCount, text: "Pregnancy")
                    Text("(If none apply, simply select the 'Next' button below)").font(.caption)
                }
            }
            
            NavigationLink(destination: VTEAnticoagChoiceInfluencers(vte: VTEData()), isActive: $nextView) {
                EmptyView()
            }
            
            Button(action: {
                self.nextView = true
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: purple))
            }.navigationBarTitle("Provoking factors", displayMode: .inline)
    }
}

struct VTEProvokingFactors_Previews: PreviewProvider {
    static var previews: some View {
        VTEProvokingFactors(vte: VTEData())
    }
}
