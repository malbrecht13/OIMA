//
//  IntroSyncope.swift
//  OIMA
//
//  Created by Michael Albrecht on 12/24/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

fileprivate enum ModalView {
    case hospitalize
    case reference
}

struct IntroSyncope: View {
    
    
    @State private var modalView: ModalView = .hospitalize
    @State private var isSheetShown = false
    @State private var nextView = false
    @State private var eval = ["History", "Physical exam (include cardiac, vascular, neuro exams)", "ECG", "Orthostatic vitals (lying down, sitting, immediately upon standing, and 3 minutes after standing)"]

    
    var body: some View {
        ScrollView {
            VStack {
                
                Group {
                    Text("1. First perform the following").fontWeight(.black).foregroundColor(.red).font(.subheadline)
                    VStack(alignment: .leading) {
                        ForEach(eval, id: \.self) {
                            eval in
                            HStack {
                                Text("•")
                                Text("\(eval)")
                            }.padding(1).font(.footnote)
                        }
                    }.padding()
                    Text("2. Next decide if patient needs to be hospitalized.").fontWeight(.black).foregroundColor(.red).font(.subheadline)
                        
                    Text("Click on this button to see conditions that may require hospitalization:").padding(1).font(.footnote)
                }
                
                Button(action: {
                    self.modalView = .hospitalize
                    self.isSheetShown.toggle()
                }) {
                    Text("Hospitalize?")
                }.buttonStyle(NextButtonStyle(fillColor: .red, foregroundColor: .white))
                
            }
                
            Text("3. Hospitalize patient if needed.  If hospitalization isn't needed, proceed with this algorithm by using the 'Next' button:").fontWeight(.black).foregroundColor(.red).font(.subheadline).padding()
               
                Spacer()
                
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
    


struct IntroSyncope_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            IntroSyncope()
            IntroSyncope()
            IntroSyncope()
        }
    }
}
