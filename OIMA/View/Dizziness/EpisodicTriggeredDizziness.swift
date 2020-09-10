//
//  EpisodicDizziness.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/9/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct EpisodicTriggeredDizziness: View {
    
    @ObservedObject var dizzy: DizzinessData
    
    @State private var showDixHallpikeSheet = false
    @State private var showOrthoVitalsSheet = false
    @State private var nextView: String? = nil
    
    private let dixHallpike = ["Yes", "No"]
    private let orthoVitals = ["Yes", "No"]
    
    var body: some View {
        VStack {
            Spacer()
                .frame(maxHeight: 20)
            
            //Button brings up sheet to show you how to perform the Dix-Hallpike maneuver
            Button(action: {
                self.showDixHallpikeSheet.toggle()
            }) {
                Text("Dix-Hallpike maneuver instructions")
            }.sheet(isPresented: $showDixHallpikeSheet, content: {
                Dix_HallpikeSheet()
            }).buttonStyle(NextButtonStyle(fillColor: green))
                .padding()
            
            //Button brings up sheet to show user how to properly perform orthostatic vitals
            Button(action: {
                self.showOrthoVitalsSheet.toggle()
            }) {
                Text("Orthostatic vitals instructions")
            }.sheet(isPresented: $showOrthoVitalsSheet, content: {
                OrthoVitalsSheet()
            }).buttonStyle(NextButtonStyle(fillColor: green))

            
            Spacer()
            
            ShowPicker(parentBinding: $dizzy.dh, text: "Is the Dix-Hallpike test abnormal?", parentArray: dixHallpike)
            ShowPicker(parentBinding: $dizzy.ov, text: "Are orthostatic vitals abnormal?", parentArray: orthoVitals)
            
            Spacer()
            
            Button(action: {
                //if dix-hallpike and/or orthostatic vitals are abnormal, go to management page
                if self.dizzy.dh == 0 || self.dizzy.ov == 0 {
                    self.nextView = "Management"
                } else {
                    self.nextView = "EpisodicSpontaneous"
                }
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: green))
            
            NavigationLink(destination: DizzinessManagement(dizzy: dizzy), tag: "Management", selection: $nextView) { EmptyView() }
            NavigationLink(destination: EpisodicSpontaneous(dizzy: dizzy), tag: "EpisodicSpontaneous", selection: $nextView) { EmptyView() }
            
        }.navigationBarTitle("Episodic dizziness tests", displayMode: .inline)
    }
}

struct EpisodicDizziness_Previews: PreviewProvider {
    static var previews: some View {
        EpisodicTriggeredDizziness(dizzy: DizzinessData())
    }
}
