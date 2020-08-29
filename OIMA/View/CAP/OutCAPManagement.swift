//
//  OutCAPManagement.swift
//  medlearn
//
//  Created by Michael Albrecht on 8/8/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct OutCAPManagement: View {
    
    @ObservedObject var capToggle: CAPData
    
    var body: some View {
 
            ScrollView {
            Group {
                Text("Management")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(Color.pink)
                    .padding()
                    .padding(.top, 50)
                }
                
                
                //outpatient CAP with risk factors
                if capToggle.selection == 0 {
                    Group {
                        Text("Renal dosing may be necessary").font(.footnote)
                        Text("You've indicated that the patient has risk factors for MRSA or Pseudomonas").font(.footnote).padding()
                        Text("Treat using the following combination therapy:").underline().padding().multilineTextAlignment(.center)
                        Text("Choose one of these:").padding()
                        VStack(alignment: .leading) {
                            Text("Amoxicillin/clavulanate 500mg/125mg PO TID")
                            Text("Amoxicillin/clavulanate 875 mg/125 mg PO BID")
                            Text("Cefpodoxime 200 mg PO BID")
                            Text("Cefuroxime 500 mg PO BID")
                        }
                        Text("AND one of these:").padding(.top)
                        VStack(alignment: .leading) {
                            Text("Azithromycin 500 mg day 1, then 250 mg daily for 4 days").lineLimit(2).minimumScaleFactor(0.5)
                            Text("Clarithromycin 500 mg PO BID")
                            Text("Clarithromycin ER 1000 mg PO daily")
                            Text("Doxycycline 100 mg PO BID")
                        }.padding()
                    }
                    Text("OR").underline()
                    Text("Treat with monotherapy with a respiratory fluoroquinolone:").underline().padding()
                    Text("Choose one of these:").padding()
                    VStack(alignment: .leading) {
                        Text("Levofloxacin 750 mg PO daily")
                        Text("Moxifloxacin 400 mg PO daily")
                        Text("Gemifloxacin 320 mg PO daily")
                    }
                }
                if capToggle.selection == 1 {
                    Text("You've indicated that the patient does not have risk factors for MRSA or Pseudomonas").font(.footnote).padding()
                    Text("Treat using the following therapy:").underline().padding()
                    Text("Choose one of these:").padding()
                    VStack(alignment: .leading) {
                        Text("Amoxicillin 1 g PO TID")
                        Text("Doxycycline 100 mg PO BID")
                        Text("Azithromycin 500 mg day 1, then 250 mg daily for 4 days").lineLimit(2).minimumScaleFactor(0.5)
                        Text("Clarithromycin 500 mg PO BID")
                        Text("Clarithromycin ER 1,000 mg PO daily")
                    }
                    Text("Note: macrolides should be used as monotherapy only if local pneuococcal resistance is < 25%").font(.footnote).padding()
                    
                }
                Text("Treatment duration is 5 days unless patients fail to improve").font(.footnote).padding()
                
                
            }
            .edgesIgnoringSafeArea(.top).padding(.bottom, 50)
        }
        
    
}

struct OutCAPManagement_Previews: PreviewProvider {
    static var previews: some View {
        OutCAPManagement(capToggle: CAPData())
    }
}
