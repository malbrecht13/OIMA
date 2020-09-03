//
//  VTEFirst.swift
//  OIMA
//
//  Created by Michael Albrecht on 8/26/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct VTEFirst: View {
    
    @ObservedObject var vte: VTEData = VTEData()
    @State private var nextView: String? = nil
    
    private let vteType = ["PE", "DVT"]
    private let occurrences = ["First occurrence", "Second or greater"]
    private let subseg = ["Yes", "No"]
    private let onAnticoag = ["Yes", "No"]

    
    var body: some View {
        VStack {
            Spacer()
            
            ShowPicker(parentBinding: $vte.selection, text: "Select VTE type", parentArray: vteType)
            
            ShowPicker(parentBinding: $vte.occurrence, text: "Select number of VTE occurrences", parentArray: occurrences).minimumScaleFactor(0.5)
            
            if vte.occurrence == 1 {
                ShowPicker(parentBinding: $vte.vteOnAnticoag, text: "Did the VTE recur while adherent to taking anticoagulation?", parentArray: onAnticoag).animation(.easeInOut(duration: 1)).transition(.slide)
            }
            
            
            Button(action: {
                if self.vte.selection == 0 {
                    self.nextView = "PE"
                } else if self.vte.selection == 1 {
                    self.nextView = "DVT"
                }
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: purple))
            
            
            NavigationLink(destination: VTEProvokingFactors(vte: vte), tag: "PE", selection: $nextView) {
                EmptyView()
            }
            NavigationLink(destination: ProximalDistalDVT(vte: vte), tag: "DVT", selection: $nextView) {
                EmptyView()
            }
            
            Spacer()
            
            Text("This algorithm helps with choosing duration of therapy in VTE disease.  None of the recommendations provided are set in stone. For those on long-term anticoagulation, assess risk/benefit ratio of continuing anticoagulation at least once yearly.").padding()
            
            

            }.navigationBarTitle("VTE home", displayMode: .inline)
        
        
            
    }
}

struct VTEFirst_Previews: PreviewProvider {
    static var previews: some View {
        VTEFirst()
    }
}
