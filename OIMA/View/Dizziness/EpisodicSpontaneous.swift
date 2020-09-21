//
//  EpisodicSpontaneous.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/9/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct EpisodicSpontaneous: View {
    
    @ObservedObject var dizzy: DizzinessData
    
    @State private var nextView: String? = nil
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Select if any of these patient factors are present:").font(.headline).foregroundColor(green).padding()) {
                    ShowToggle(binding: $dizzy.nystagmus, count: $dizzy.nullCount, text: "Ongoing nystagmus")
                    ShowToggle(binding: $dizzy.neuroDeficits, count: $dizzy.nullCount, text: "New focal neurologic deficits, ataxic gait, limb ataxia (abnormal finger-nose or heel-shin testing), or diplopia")
                    ShowToggle(binding: $dizzy.hearingLoss, count: $dizzy.nullCount, text: "New hearing loss")
                    ShowToggle(binding: $dizzy.migraine, count: $dizzy.nullCount, text: "Headaches or history of migraine")
                    ShowToggle(binding: $dizzy.medications, count: $dizzy.nullCount, text: "Recent new medication that could cause dizziness")
                    ShowToggle(binding: $dizzy.trauma, count: $dizzy.nullCount, text: "Head trauma")
                    ShowToggle(binding: $dizzy.alcohol, count: $dizzy.nullCount, text: "Alcohol use/abuse")
                    ShowToggle(binding: $dizzy.psych, count: $dizzy.nullCount, text: "Psychiatric symptoms")

                }

            }
            Button(action: {
                self.dizzy.nullCount = 0
                
                if self.dizzy.nystagmus {
                    self.nextView = "NeuroTests"
                } else {
                    self.nextView = "Management"
                }
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: green))
            
            NavigationLink(destination: NeuroTestsDizziness(dizzy: dizzy), tag: "NeuroTests", selection: $nextView) { EmptyView() }
            NavigationLink(destination: DizzinessManagement(dizzy: dizzy), tag: "Management", selection: $nextView) { EmptyView() }
        }.navigationBarTitle("Other factors", displayMode: .inline)
    }
}

struct EpisodicSpontaneous_Previews: PreviewProvider {
    static var previews: some View {
        EpisodicSpontaneous(dizzy: DizzinessData())
    }
}
