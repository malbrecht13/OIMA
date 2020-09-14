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
                    ShowToggle(binding: $dizzy.nystagmus, count: $dizzy.nullCount, text: "Nystagmus")
                    ShowToggle(binding: $dizzy.ataxia, count: $dizzy.nullCount, text: "Ataxic gait")
                    ShowToggle(binding: $dizzy.doubleVision, count: $dizzy.nullCount, text: "Diplopia")
                    ShowToggle(binding: $dizzy.earSymptoms, count: $dizzy.nullCount, text: "Ear pain, pressure, or fullness")
                    ShowToggle(binding: $dizzy.migraine, count: $dizzy.nullCount, text: "History of migraine")
                    ShowToggle(binding: $dizzy.medications, count: $dizzy.nullCount, text: "Recent new medication that could cause dizziness")
                    ShowToggle(binding: $dizzy.trauma, count: $dizzy.nullCount, text: "Head trauma")
                    ShowToggle(binding: $dizzy.alcohol, count: $dizzy.nullCount, text: "Alcohol use/abuse")
                    ShowToggle(binding: $dizzy.psych, count: $dizzy.nullCount, text: "Psychiatric symptoms")

                }

            }
            Button(action: {
                if self.dizzy.nystagmus && self.dizzy.symptDuration == 1 {
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
