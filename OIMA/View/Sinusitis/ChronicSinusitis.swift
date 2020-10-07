//
//  ChronicSinusitis.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/22/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

/*
 Definitions:
 
 Chronic sinusitis-  must have two or more of the following: nasal obstruction, facial congestion-pressure-fullness, discolored nasal discharge, hyposmia for at least 12 weeks, PLUS evidence of inflammation on exam:  polyps, edema, or purulent mucus
 */

import SwiftUI

struct ChronicSinusitis: View {
    
    @ObservedObject var sinusitis: SinusitisData
    
    @State private var inflammationSelection = ["Yes", "No"]
    @State private var nextView = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Select if the patient has any of the following:").modifier(SectionHeaderModifier(textColor: green)), content: {
                    ShowToggle(binding: $sinusitis.nasalObstruction, text: "Nasal obstruction")
                    ShowToggle(binding: $sinusitis.congestion, text: "Facial congestion-pressure-fullness")
                    ShowToggle(binding: $sinusitis.discoloredDischarge, text: "Discolored nasal discharge")
                    ShowToggle(binding: $sinusitis.hyposmia, text: "Decreased sense of smell")
                    
                    if symptomCount() >= 2 {
                        Section(header: Text("Are any of these present?").modifier(SectionHeaderModifier(textColor: green)), content: {
                            ShowPicker(parentBinding: $sinusitis.inflammationSigns, text: "Middle turbinate edema (boggy/swollen appearance, pink/white in color), polyps, purulent mucus, or radiographic imaging showing inflammation of paranasal sinuses", parentArray: inflammationSelection)
                        })
                    }
                    
                })
            }
            
            Button(action: {
                //this block of code is here in case the user first selects that there are 2 or more symptoms, changes inflammationsigns to Yes (0), and later deselects symptoms so that there are less than 2.  We don't want chronic sinusitis to be the diagnosis unless there are at least 2 symptoms plus inflammation.
                if self.symptomCount() < 2 {
                    self.sinusitis.inflammationSigns = 1
                }
                
                self.nextView = true
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: green))
            
            NavigationLink(destination: SinusitisManagement(sinusitis: sinusitis), isActive: $nextView) { EmptyView() }
            
                .navigationBarTitle("Chronic sinusitis symptoms", displayMode: .inline)
        }
    }
    
    //methods
    
    /// Adds up number of symptoms of chronic rhinosinusitis.  Must have 2 or more symptoms to be CRS.
    /// - Returns: count/number of symptoms
    func symptomCount() -> Int {
        var count = 0
        
        if self.sinusitis.nasalObstruction {
            count += 1
        }
        if self.sinusitis.congestion {
            count += 1
        }
        if self.sinusitis.discoloredDischarge {
            count += 1
        }
        if self.sinusitis.hyposmia {
            count += 1
        }
        
       

        
        return count
    }
}

struct ChronicSinusitis_Previews: PreviewProvider {
    static var previews: some View {
        ChronicSinusitis(sinusitis: SinusitisData())
    }
}
