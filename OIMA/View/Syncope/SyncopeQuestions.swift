//
//  SyncopeQuestions.swift
//  OIMA
//
//  Created by Michael Albrecht on 1/7/21.
//  Copyright © 2021 Michael Albrecht. All rights reserved.
//

import SwiftUI


struct SyncopeQuestions: View {
    
    @ObservedObject var syncope: SyncopeData = SyncopeData()
    
    @State private var nextView = false
    @State private var showSheet = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Select all of the following that apply:").font(.headline).foregroundColor(red).padding(), content: {
                    ShowToggle(binding: $syncope.structuralHD, text: "Concern for structural heart disease (e.g., valvular disease, hypertrophic cardiomyopathy, LV dysfunction, abnormal ECG)")
                    ShowToggle(binding: $syncope.arrhythmia, text: "Palpitations or concern for possible arrhythmia")
                    ShowToggle(binding: $syncope.exertional, text: "Syncope occurring during exertion")
                    ShowToggle(binding: $syncope.orthostatic, text: "Abnormal orthostatic vitals")
                    Button(action: {
                        self.showSheet.toggle()
                    }) {
                            Toggle(isOn: $syncope.vvs, label: {
                                HStack {
                                    Text("History suggestive of vasovagal syncope")
                                    Image(systemName: "info.circle")
                                }
                                
                            })
                            
                        }
                        
                    .sheet(isPresented: $showSheet, content: {
                        VVSSheet()
                    }).foregroundColor(.black)
                    
                })
            }
            Button(action: {
                self.nextView = true
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: red))
            
            NavigationLink(destination: SyncopeManagement(), isActive: $nextView) { EmptyView() }
        }
    }
}

struct SyncopeQuestions_Previews: PreviewProvider {
    static var previews: some View {
        SyncopeQuestions()
    }
}
