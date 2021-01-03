//
//  IntroSyncope.swift
//  OIMA
//
//  Created by Michael Albrecht on 12/24/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

enum ModalView {
    case hospitalize
    case reference
}

struct IntroSyncope: View {
    
    
    @State private var modalView: ModalView = .hospitalize
    @State private var isSheetShown = false
    @State private var nextView = false

    
    var body: some View {
        ScrollView {
            VStack {
                
                Text("A quick note").fontWeight(.black).padding().foregroundColor(.red)

                Text("The evaluation of syncope should start with a thorough history and physical exam.  The exam should include cardiac and neurologic examinations. \n\nIn addition, orthostatic vitals (blood pressure and heart rate) should be obtained with patient lying down, sitting, immediately upon standing, and after 3 minutes of standing.\n\nAn ECG should be performed as well.\n\nAfter this initial evaluation, it should be determined whether or not patient should be hospitalized.  Click on the 'Hospitalize?' button to see possible medical conditions that might warrant hospitalization for syncope.\n").padding()
                
                Button(action: {
                    self.modalView = .hospitalize
                    self.isSheetShown.toggle()
                }) {
                    Text("Hospitalize?")
                }.buttonStyle(NextButtonStyle(fillColor: red))
                
                Text("If the patient does not need hospitalization, proceed with this algorithm.").padding(.vertical).padding(.horizontal, 0)
               
                Spacer()
                    .frame(height: 50)
                
                NextButton1(nextView: $nextView, fillColor: red)
                NavigationLink(destination: MHReference(), isActive: $nextView) { EmptyView() }
            
            }
            .navigationBarTitle("Quick note", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.modalView = .reference
                self.isSheetShown.toggle()
            }) {
                Image(systemName: "r.square")
            })
            .sheet(isPresented: $isSheetShown,  content: {
                if self.modalView == .hospitalize {
                    SyncopeHospitalizeReasons()
                } else if self.modalView == .reference {
                    SyncopeReference()
                }
            })
        }
        }
    }


struct IntroSyncope_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            IntroSyncope()
            IntroSyncope()
            IntroSyncope()
        }
    }
}
