//
//  ListCell.swift
//  AnimationRowList
//
//  Created by Sumit on 13/08/24.
//

import SwiftUI

struct ListCell: View {
    
    var model:UserInfoModel
    var isPhaseAnimator:Bool

    init(model: UserInfoModel , isPhaseAnimator: Bool) { 
        self.model = model
        self.isPhaseAnimator = isPhaseAnimator
    }

    var body: some View {
        HStack {
            Image(model.img)
                .resizable()
                .frame(width:80, height:80)
                .cornerRadius(6)
            VStack(alignment:.leading,spacing: 6) {
                Text(model.title)
                    .font(.system(size: 22))
                    .bold()
                Text(model.describtions)
                    .font(.system(size: 19))
            }.padding([.leading])
        }
    }
 }

#Preview {
    ListCell(model:UserInfoModel(item_id: 1, img: "Bg_image_One", title: "Loacker", describtions: "Looking for a cool brand name for your new business? You’ve come to the right place"), isPhaseAnimator: true)
}
