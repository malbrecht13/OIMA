//
//  IntroSyncope.swift
//  OIMA
//
//  Created by Michael Albrecht on 12/24/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct IntroSyncope: View {
    
    @State private var showReferences = false
    @State private var nextView = false
    @State private var showHospitalize = false
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                Text("A quick note").fontWeight(.black).padding().foregroundColor(.red)

                Text("The evaluation of syncope should start with a thorough history and physical exam.  The exam should include cardiac and neurologic examinations. \n\nIn addition, orthostatic vitals (blood pressure and heart rate) should be obtained with patient lying down, sitting, immediately upon standing, and after 3 minutes of standing.\n\nAn ECG should be performed as well.\n\nAfter this initial evaluation, it should be determined whether or not patient should be hospitalized.  Click on the 'Hospitalize?' button to see possible medical conditions that might warrant hospitalization for syncope.")
                
                Button(action: {
                    self.showHospitalize.toggle()
                }) {
                    Text("Hospitalize?")
                }.sheet(isPresented: $showHospitalize) {
                    SyncopeHospitalizeReasons()
                }.buttonStyle(NextButtonStyle(fillColor: red))
                Spacer()
                
                
                Text("If the patient does not need hospitalization proceed with this outpatient algorithm.")
                Spacer()
                    .frame(height: 50)
                NextButton1(nextView: $nextView, fillColor: red)
                NavigationLink(destination: MHReference(), isActive: $nextView) { EmptyView() }
            
            }.padding()
            .navigationBarTitle("Quick note", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showReferences.toggle()
            }) {
                Image(systemName: "r.square")
            }).sheet(isPresented: $showReferences) {
                SyncopeReference()
        }
        }
    }
}

struct IntroSyncope_Previews: PreviewProvider {
    static var previews: some View {
        IntroSyncope()
    }
}
