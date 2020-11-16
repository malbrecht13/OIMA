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
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @ObservedObject var sinusitis: SinusitisData = SinusitisData()
    
    @State private var nextView: String? = nil
    @State private var showReferences = false
    
    private let durationOptions = ["< 4 weeks", "4-12 weeks", "> 12 weeks"]
    private let subacuteDifferentiator = ["Acute", "Chronic"]
    
    
    var body: some View {
        VStack {
            ShowPicker(parentBinding: $sinusitis.duration, text: "Select duration of current episode of symptoms", parentArray: durationOptions)
            
            //if subacute sinusitis (4-12 weeks duration), this view will appear
            if sinusitis.duration == 1 {
                ShowPicker(parentBinding: $sinusitis.subacute, text: "Using your clinical judgment, is this more like acute or chronic sinusitis?", parentArray: subacuteDifferentiator)
            }
            
            //Next button
            Button(action: {
                //reset variables so user can start over with selections on later screens
                resetVariables()
               
                //go to the Next view based on selections
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
        
        //title of the screen in the navbar
        .navigationBarTitle("Sinusitis duration", displayMode: .inline)
        
        //Reference button in navbar
        .navigationBarItems(trailing:
            HStack {
                Button(action: {
                    self.showReferences.toggle()
                }) {
                    Image(systemName: "r.square")
                }.sheet(isPresented: $showReferences) {
                    SinusitisReference()
                }
                Button(action: {
                    self.mode.wrappedValue.dismiss()
                
                }) {
                    Image(systemName: "house")
                }
            }
        )
    }
    
    
    //Resets variables for subsequent views for sinusitis
    private func resetVariables() {
        //in AcuteSinusitis.swift
        self.sinusitis.purulent = false
        self.sinusitis.obstruction = false
        self.sinusitis.faceSymptoms = false
        self.sinusitis.complication = false
        
        //in ViralVBacterialSinusitis.swift
        self.sinusitis.notImproved10Days = false
        self.sinusitis.worsenIn10Days = false
        
        //in ChronicSinusitis.swift
        self.sinusitis.nasalObstruction = false
        self.sinusitis.congestion = false
        self.sinusitis.discoloredDischarge = false
        self.sinusitis.hyposmia = false
        self.sinusitis.inflammationSigns = 0
    }
}



struct SinusitisDuration_Previews: PreviewProvider {
    static var previews: some View {
        SinusitisDuration()
    }
}
