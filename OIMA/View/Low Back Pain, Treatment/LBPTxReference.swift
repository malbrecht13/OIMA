//
//  LBPTxReference.swift
//  OIMA
//
//  Created by Michael Albrecht on 11/12/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

fileprivate let topic = "Mechanical Low Back Pain Treatment"
fileprivate let fillColor = orange

fileprivate let citations : [Citation] =  [
    Citation(first: "Qaseem et al. Noninvasive treatments for acute, subacute, and chronic low back pain: A clinical practice guideline from the American College of Physicians. ", italicized: "Ann Intern Med. ", last: "2017;166:514-530.")]

fileprivate let sortedCitations = citations.sorted { $0.first < $1.first }

struct LBPTxReference: View {
    var body: some View {
        ReferenceView(sortedCitationArray: sortedCitations, topic: topic, fillColor: fillColor)
    }
}

struct LBPTxReference_Previews: PreviewProvider {
    static var previews: some View {
        LBPTxReference()
    }
}
