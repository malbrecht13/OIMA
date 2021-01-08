//
//  SyncopeManagement.swift
//  OIMA
//
//  Created by Michael Albrecht on 1/7/21.
//  Copyright © 2021 Michael Albrecht. All rights reserved.
//

import SwiftUI

fileprivate enum ModalView {
    case cardiacMonitors
    case references
}

struct SyncopeManagement: View {
    
    @ObservedObject var syncope: SyncopeData
    
    @State private var showSheet = false
    @State private var modalView: ModalView = .references
    
    private let management: [String: String] = [
        "structuralHD":"Consider obtaining an echocardiogram as you've indicate the patient may have structural heart disease",
        "arrhythmia":"Outpatient cardiac monitoring may be indicated"
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Management")
                    .fontWeight(.black)
                    .modifier(ManagementMod(textColor: red))
                VStack (alignment: .leading) {
                    Text("Consider obtaining routine labs such as CBC, electrolytes, and brain natriuretic peptide if indicated.")
                    if syncope.structuralHD {
                        Text(management["structuralHD"]!)
                    }
                    if syncope.arrhythmia {
                        HStack {
                            Text(management["arrhythmia"]!)
                            Button(action: {
                                self.modalView = .cardiacMonitors
                                self.showSheet.toggle()
                            }) {
                                Image(systemName: "info.circle")
                            }
                        }
                    }
                }
                    
            
            }.font(.footnote).padding(.horizontal)
            .navigationBarTitle("Syncope Management", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.modalView = .references
                self.showSheet.toggle()
            }) {
                Image(systemName: "r.square")
            })
            
        }.sheet(isPresented: $showSheet, content: {
            if self.modalView == .cardiacMonitors {
                CardiacMonitors()
            } else if self.modalView == .references {
                SyncopeReference()
            }
            
        })
    }
}


struct SyncopeManagement_Previews: PreviewProvider {
    static var previews: some View {
        SyncopeManagement(syncope: SyncopeData())
    }
}
