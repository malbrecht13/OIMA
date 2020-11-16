//
//  CoughRedFlags.swift
//  OIMA
//
//  Created by Michael Albrecht on 11/16/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct CoughRedFlags: View {
    
    @ObservedObject var cough: CoughData
    
    var body: some View {
        Text("Red flags")
    }
}

struct CoughRedFlags_Previews: PreviewProvider {
    static var previews: some View {
        CoughRedFlags(cough: CoughData())
    }
}
