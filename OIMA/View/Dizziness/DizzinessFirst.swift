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
                if self.dizzy.symptDuration == 1 {
                    self.nextView = "Continuous"
                } else if self.dizzy.triggered == 0 {
                    self.nextView = "EpisodicTriggered"
                } else if self.dizzy.triggered == 1 {
                    self.nextView = "EpisodicSpontaneous"
                }
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: green))
            
            NavigationLink(destination: NeuroTestsDizziness(dizzy: dizzy), tag: "Continuous", selection: $nextView) { EmptyView() }
            NavigationLink(destination: EpisodicTriggeredDizziness(dizzy: dizzy), tag: "EpisodicTriggered", selection: $nextView) { EmptyView() }
            NavigationLink(destination: EpisodicSpontaneous(dizzy: dizzy), tag: "EpisodicSpontaneous", selection: $nextView) { EmptyView() }
            Spacer()
            
            Text("*Are any of the patient's signs abnormal for the patient?  If so, work up and treat the abnormal vital sign before conducting this algorithm.  For example, if the patient is bradycardic or tachycardic, hypotensive, low O2 sat, fever, or high respiratory rate, the dizziness the patient is experiencing may be related to these.").minimumScaleFactor(0.5)
            
                
            
            
        }.navigationBarTitle("Dizziness symptom duration", displayMode: .inline)
        .padding()
    }
}

struct DizzinessFirst_Previews: PreviewProvider {
    static var previews: some View {
        DizzinessFirst()
    }
}
