//
//  AcuteSinusitis.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/22/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

/*
Rosenfeld et al. Clinical practice guideline (update): adult sinusitis.  Otolaryngoloy-Head and Neck Surgery 2015;152(2S):S1-S39.
 
 This article has a fantastic algorithm in flow-chart form on page S8.  Additional info from the article:

Page S6
If a patient has up to 4 weeks of purulent drainage accompanied by nasal obstruction or facial pain-pressure-fullness, or both, they have Acute rhinosinusitis (ARS).  If there is no purulent drainage, there is no rhinosinusitis.  If a patient has ARS then the clinician should distinguish between viral (AVS) and bacterial rhinosinusitis (ABRS).

 */

import SwiftUI

struct AcuteSinusitis: View {
    
    @ObservedObject var sinusitis: SinusitisData
    
    @State private var nextView: String? = nil
    @State private var showReferences = false
    
    var body: some View {
        
        VStack {
            Form {
                Section(header: Text("Select if the patient has any of the following").modifier(SectionHeaderModifier(textColor: green)), content: {
                    
                    //Patient needs purulenet drainage plus either nasal obstruction or facial pain/pressure/fullness to qualify for ARS.  Need new slide to differentiate viral from bacterial if ARS is present.  Otherwise, patient has viral URI (management)
                    ShowToggle(binding: $sinusitis.purulent, text: "Purulent (not clear) nasal drainage in nasal cavity or posterior oropharynx")
                    ShowToggle(binding: $sinusitis.obstruction, text: "Nasal obstruction")
                    ShowToggle(binding: $sinusitis.faceSymptoms, text: "Facial pain, pressure, or fullness")
                    
                    
                })
            }
            
            Button(action: {
                if self.sinusitis.purulent && (self.sinusitis.obstruction || self.sinusitis.faceSymptoms) {
                    self.nextView = "viralVBacterial"
                } else {
                    self.nextView = "management"
                }
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: green))
            
            NavigationLink(destination: ViralVBacterialSinusitis(sinusitis: sinusitis), tag: "viralVBacterial", selection: $nextView) { EmptyView() }
            NavigationLink(destination: SinusitisManagement(sinusitis: sinusitis), tag: "management", selection: $nextView) { EmptyView() }
            
                .navigationBarTitle("Symptoms", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showReferences.toggle()
                }) {
                    Image(systemName: "r.square")
                }.sheet(isPresented: $showReferences) {
                    SinusitisReference()
                })
        }
    }
}

struct AcuteSinusitis_Previews: PreviewProvider {
    static var previews: some View {
        AcuteSinusitis(sinusitis: SinusitisData())
    }
}
