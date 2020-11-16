//
//  ViralVBacterialSinusitis.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/30/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct ViralVBacterialSinusitis: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @ObservedObject var sinusitis: SinusitisData
    
    @State private var nextView = false
    @State private var showReferences = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Are either of these present?").modifier(SectionHeaderModifier(textColor: green)), content: {
                    ShowToggle(binding: $sinusitis.notImproved10Days, text: "Symptoms/signs of acute rhinosinusitis fail to improve within 10 days or more beyond the onset of upper respiratory symptoms")
                    ShowToggle(binding: $sinusitis.worsenIn10Days, text: "Symptoms/signs of acute rhinosinusitis worsen within 10 days after an initial improvement (double worsening)")
                    Spacer()
                    
                    if sinusitis.notImproved10Days || sinusitis.worsenIn10Days {
                        //obtain CT sinuses with contrast if any of these are present
                        ShowToggle(binding: $sinusitis.complication, text: "Facial swelling, cranial nerve palsy, bulging eye (proptosis), or severe headache?")
                    }
                    
                })
            }
            NavigationLink(destination: SinusitisManagement(sinusitis: sinusitis), isActive: $nextView) {
                Button(action: {
                    self.nextView = true
                }) {
                    Text("Next")
                }.buttonStyle(NextButtonStyle(fillColor: green))
            }
            .navigationBarTitle("Viral vs. Bacterial", displayMode: .inline)
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
                        self.mode.wrappedValue.dismiss()
                        self.mode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "house")
                    }
                }
            )
        }
    }
}

struct ViralVBacterialSinusitis_Previews: PreviewProvider {
    static var previews: some View {
        ViralVBacterialSinusitis(sinusitis: SinusitisData())
    }
}
