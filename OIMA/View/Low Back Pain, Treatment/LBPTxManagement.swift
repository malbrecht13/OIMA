//
//  LBPTxManagement.swift
//  OIMA
//
//  Created by Michael Albrecht on 11/12/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct LBPTxManagement: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @ObservedObject var mlbpt: MLBPT
    
    @State private var showReferences = false
    
    private let acuteNonPharmTx = ["Heat", "Massage", "Acupuncture", "Spinal manipulation"]
    private let acutePharmTx = ["NSAIDs", "Skeletal muscle relaxant for < 1 week"]
    private let chronicNonPharmTx = ["Tai Chi", "Yoga", "Stretch/strengthening/motor control exercise", "Multidisciplinary rehab", "Accupuncture", "Mindfulness-based stress reduction", "Cognitive behavioral therapy", "Progressive relaxation", "Electromyography biofeedback", "Low light laser therapy", "Spinal manipulation"]
    private let chronicPharmTx = ["NSAIDS (first line)", "Tramadol", "Duloxetine (Cymbalta)", "Opioids (small effect)"]
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Management").fontWeight(.black).modifier(ManagementMod(textColor: orange))
            
                Text("Effective treatment options:").fontWeight(.bold).multilineTextAlignment(.center)
                
                // if back pain is acute or subacute
                if (mlbpt.duration == 0) {
                    VStack(alignment: .leading) {
                        Text("\nFor acute/subacute low back pain (less than 12 weeks)").multilineTextAlignment(.center)
                        Text("\nNon-pharmacologic options:").underline()
                        ForEach(acuteNonPharmTx, id: \.self) { treatment in
                            Text(treatment)
                        }
                        Text("\nPharmacologic treatment options").underline()
                        ForEach(acutePharmTx, id: \.self) { treatment in
                            Text(treatment)
                        }
                        Text("\nCorticosteroids have not been found to be effective.")
                        Text("\nPatients should remain active as tolerated.")
                        Text("\nReassure patients that acute back pain tends to improve with time regardless of the treatment chosen.")
                    }
                    //if back pain is chronic
                } else if (mlbpt.duration == 1) {
                    VStack(alignment: .leading) {
                        Text("\nFor chronic low back pain (greater than 12 weeks)").multilineTextAlignment(.center)
                        Text("\nNon-pharmacologic options:").underline()
                        ForEach(chronicNonPharmTx, id: \.self) { treatment in
                            Text(treatment)
                        }
                        Text("\nPharmacologic treatment options").underline()
                        ForEach(chronicPharmTx, id: \.self) { treatment in
                            Text(treatment)
                        }
                        Text("\nTricyclic antidepressants have not been found to be effective.")
                        Text("\nCorticosteroids have not been found to be effective.")
                        Text("\nPatients should remain active as tolerated.")
                    }
                    
                }
                
                
            }.padding(.horizontal)
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {
                        self.showReferences.toggle()
                    }) {
                        Image(systemName: "r.square")
                    }.sheet(isPresented: $showReferences) {
                        LBPTxReference()
                    }
                    Button(action: {
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

struct LBPTxManagement_Previews: PreviewProvider {
    static var previews: some View {
        LBPTxManagement(mlbpt: MLBPT())
    }
}
