//
//  CoughCommonCauses.swift
//  OIMA
//
//  Created by Michael Albrecht on 12/7/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct CoughCommonCauses: View {
    
    @ObservedObject var cough: CoughData
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CoughCommonCauses_Previews: PreviewProvider {
    static var previews: some View {
        CoughCommonCauses(cough: CoughData())
    }
}
