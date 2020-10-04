//
//  SinusitisDuration.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/22/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

/*
 Definitions:
 
 Acute: < 4 weeks
 Subacute: 4-12 weeks
 Chronic: > 12 weeks
 
 If subacute, must use clinical judgment to decide if patient is presenting more like an acute sinusitis or a chronic sinusitis.  
 */

import SwiftUI

struct SinusitisDuration: View {
    
    @ObservedObject var sinusitis: SinusitisData = SinusitisData()
    
    @State private var nextView: String? = nil
    
    private let durationOptions = ["< 4 weeks", "4-12 weeks", "> 12 weeks"]
    private let subacuteDifferentiator = ["Acute", "Chronic"]
    
    
    var body: some View {
        VStack {
            ShowPicker(parentBinding: $sinusitis.duration, text: "Select duration of current episode of symptoms", parentArray: durationOptions)
            
            //if subacute
            if sinusitis.duration == 1 {
                ShowPicker(parentBinding: $sinusitis.subacute, text: "Using your clinical judgment, is this more like acute or chronic sinusitis?", parentArray: subacuteDifferentiator)
            }
            
            Button(action: {
                //reset variables
                
                //in AcuteSinusitis.swift
                sinusitis.purulent = false
                sinusitis.obstruction = false
                sinusitis.faceSymptoms = false
                sinusitis.complication = false
                
                //in ViralVBacterialSinusitis.swift
                sinusitis.notImproved10Days = false
                sinusitis.worsenIn10Days = false
                
                //in ChronicSinusitis.swift
                sinusitis.nasalObstruction = false
                sinusitis.congestion = false
                sinusitis.discoloredDischarge = false
                sinusitis.hyposmia = false
                sinusitis.inflammationSigns = 0

                
                if self.sinusitis.duration == 0 || (self.sinusitis.duration == 1 && self.sinusitis.subacute == 0) {
                    self.nextView = "Acute"
                } else {
                    self.nextView = "Chronic"
                }
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: green))
            
            NavigationLink(destination: AcuteSinusitis(sinusitis: sinusitis), tag: "Acute", selection: $nextView) { EmptyView() }
            NavigationLink(destination: ChronicSinusitis(sinusitis: sinusitis), tag: "Chronic", selection: $nextView) {EmptyView()}
                
        }.padding()
        .navigationBarTitle("Sinusitis duration", displayMode: .inline)
    }
}

struct SinusitisDuration_Previews: PreviewProvider {
    static var previews: some View {
        SinusitisDuration()
    }
}
