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
    @State private var showReferences = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Now select all bleeding risk factors that apply").font(.headline).foregroundColor(purple).padding(), content: {
                    ShowToggle(binding: $vte.age60, text: "Age ≥ 60 years")
                    ShowToggle(binding: $vte.previousBleed,  text: "Previous bleed")
                    ShowToggle(binding: $vte.anemia,  text: "Anemia")
                    ShowToggle(binding: $vte.activeCancer, text: "Active cancer")
                    ShowToggle(binding: $vte.renalFailure,  text: "Renal insufficiency/failure")
                    ShowToggle(binding: $vte.maleHTN,  text: "Male with uncontrolled hypertension")
                    Text("Based on VTE-BLEED score").font(.caption)
                })
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
        //References nav button
        .navigationBarItems(trailing: Button(action: {
            self.showReferences.toggle()
        }) {
            Image(systemName: "r.square")
        }.sheet(isPresented: $showReferences) {
            VTEReferences()
        })
    }
}

struct VTEBleedingRisk_Previews: PreviewProvider {
    static var previews: some View {
        VTEBleedingRisk(vte: VTEData())
    }
}
