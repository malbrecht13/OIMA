//
//  NeuroTestsDizziness.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/9/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct NeuroTestsDizziness: View {
    
    @ObservedObject var dizzy: DizzinessData
    
    @State private var hintsPositive = ["Yes", "No"]
    @State private var showHINTSsheet = false
    @State private var nextView = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Since the patient has continuous dizziness and/or nystagmus, perform the HINTS exam.").multilineTextAlignment(.center).padding()
            
            Spacer()
            
            Button(action: {
                self.showHINTSsheet.toggle()
            }) {
                Text("HINTS exam instructions")
            }.sheet(isPresented: $showHINTSsheet) {
                HINTSExamSheet()
            }.buttonStyle(NextButtonStyle(fillColor: green))
            
            Spacer()
            
            ShowPicker(parentBinding: $dizzy.hints, text: "Are any of the HINTS exam tests suggestive of central etiology?", parentArray: hintsPositive).lineLimit(3)
            NavigationLink(destination: DizzinessManagement(dizzy: dizzy), isActive: $nextView) {
                Button(action: {
                    self.nextView = true
                }) {
                    Text("Next")
                }.buttonStyle((NextButtonStyle(fillColor: green)))
            }
            
            Spacer()
            
        }.padding()
            .navigationBarTitle("HINTS exam", displayMode: .inline)
    }
}

struct NeuroTestsDizziness_Previews: PreviewProvider {
    static var previews: some View {
        NeuroTestsDizziness(dizzy: DizzinessData())
    }
}
