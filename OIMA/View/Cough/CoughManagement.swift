//
//  CoughManagement.swift
//  OIMA
//
//  Created by Michael Albrecht on 12/7/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct CoughManagement: View {
    
    @ObservedObject var cough: CoughData
    
    @State private var showReferences = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Management")
                    .fontWeight(.black)
                    .modifier(ManagementMod(textColor: pink))
            }
        }
    }
}

struct CoughManagement_Previews: PreviewProvider {
    static var previews: some View {
        CoughManagement(cough: CoughData())
    }
}
