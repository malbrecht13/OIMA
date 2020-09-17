//
//  DizzinessFirst.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/9/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct DizzinessFirst: View {
    
    @ObservedObject var dizzy: DizzinessData = DizzinessData()
    
    @State private var nextView: String? = nil
    
    private let symptomDuration = ["< 1 minute", "> 1 minute"]
    private let ifTriggered = ["Yes", "No"]
    
    
    
    var body: some View {
        VStack {
            Spacer()
            
            ShowPicker(parentBinding: $dizzy.symptDuration, text: "How long do the symptoms last when they occur?", parentArray: symptomDuration)
            
            if dizzy.symptDuration == 0 {
                ShowPicker(parentBinding: $dizzy.triggered, text: "Are the symptoms only triggered by head or body position change?", parentArray: ifTriggered).minimumScaleFactor(0.5)
            }
            Button(action: {
                
                resetVariables()

                //choose next view based on selections
                if self.dizzy.symptDuration == 1 {
                    self.nextView = "EpisodicSpontaneous"
                } else if self.dizzy.triggered == 0 {
                    self.nextView = "EpisodicTriggered"
                } else if self.dizzy.triggered == 1 {
                    self.nextView = "EpisodicSpontaneous"
                }
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: green))
            
            NavigationLink(destination: EpisodicTriggeredDizziness(dizzy: dizzy), tag: "EpisodicTriggered", selection: $nextView) { EmptyView() }
            NavigationLink(destination: EpisodicSpontaneous(dizzy: dizzy), tag: "EpisodicSpontaneous", selection: $nextView) { EmptyView() }
            Spacer()
            
            Text("First: are any of the patient's vital signs abnormal?  If so, work up and treat the abnormal vital sign before conducting this algorithm.  For example, if the patient is bradycardic or tachycardic, hypotensive, low O2 sat, fever, or high respiratory rate, the dizziness the patient is experiencing may be related to these. ").minimumScaleFactor(0.5)
            
                
            
            
        }.navigationBarTitle("Dizziness symptom duration", displayMode: .inline)
        .padding()
    }
    
    
    // Methods
    
    /// Resets all variables so that subsequent views have their toggles and pickers reset
    func resetVariables() {
        self.dizzy.dh = 1
        self.dizzy.ov = 1
        self.dizzy.hearingLoss = false
        self.dizzy.nystagmus = false
        self.dizzy.migraine = false
        self.dizzy.trauma = false
        self.dizzy.medications = false
        self.dizzy.alcohol = false
        self.dizzy.psych = false
        self.dizzy.neuroDeficits = false
        self.dizzy.nullCount = 0
        self.dizzy.hints = 0
    }
}

struct DizzinessFirst_Previews: PreviewProvider {
    static var previews: some View {
        DizzinessFirst()
    }
}
