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
    @State private var showReferences = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Select if any of these patient factors are present:").font(.headline).foregroundColor(green).padding(), content: {
                    ShowToggle(binding: $dizzy.nystagmus, text: "Ongoing nystagmus")
                    ShowToggle(binding: $dizzy.neuroDeficits, text: "New focal neurologic deficits, ataxic gait, limb ataxia (abnormal finger-nose or heel-shin testing), or diplopia")
                    ShowToggle(binding: $dizzy.hearingLoss, text: "New hearing loss")
                    ShowToggle(binding: $dizzy.migraine, text: "Headaches or history of migraine")
                    ShowToggle(binding: $dizzy.medications, text: "Recent new medication that could cause dizziness")
                    ShowToggle(binding: $dizzy.trauma, text: "Head trauma")
                    ShowToggle(binding: $dizzy.alcohol, text: "Alcohol use/abuse")
                    ShowToggle(binding: $dizzy.psych, text: "Psychiatric symptoms")
                })

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
                .navigationBarTitle("Other factors", displayMode: .inline)
                
                //References nav button
                .navigationBarItems(trailing: Button(action: {
                    self.showReferences.toggle()
                }) {
                    Image(systemName: "r.square")
                }.sheet(isPresented: $showReferences) {
                    DizzinessReference()
                })
        }
    }


struct EpisodicSpontaneous_Previews: PreviewProvider {
    static var previews: some View {
        EpisodicSpontaneous(dizzy: DizzinessData())
    }
}
