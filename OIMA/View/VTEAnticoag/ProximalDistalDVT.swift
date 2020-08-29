//
//  ProximalDistalDVT.swift
//  OIMA
//
//  Created by Michael Albrecht on 8/27/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct ProximalDistalDVT: View {
    
    @ObservedObject var vte: VTEData
    
    private let siteChoice = ["Proximal", "Distal"]
    private let severeChoice = ["Yes", "No"]
    
    var body: some View {
        VStack {
            Spacer()
            ShowPicker(parentBinding: $vte.proxDistSelection, text: "Was the DVT proximal or distal?", parentArray: siteChoice)

            
            if vte.proxDistSelection == 1 {
                ShowPicker(parentBinding: $vte.severeSymptoms, text: "Were the distal DVT symptoms severe?", parentArray: severeChoice)
                
            }
            Button(action: {
                //do something
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: purple))
            Spacer()
            Text("*A distal DVT is one that is soley in a deep vein below the knee").padding()
                .navigationBarTitle("DVT site", displayMode: .inline)
        }
    }
}

struct ProximalDistalDVT_Previews: PreviewProvider {
    static var previews: some View {
        ProximalDistalDVT(vte: VTEData())
    }
}
