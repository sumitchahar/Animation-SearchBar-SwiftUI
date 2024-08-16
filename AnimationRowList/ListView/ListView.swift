//
//  ContentView.swift
//  AnimationRowList
//  Created by Sumit on 13/08/24.

import SwiftUI

struct ListView: View {
    
    @ObservedObject var modelView:UserInfoMVVM
    init(modelView: UserInfoMVVM) { self.modelView = modelView }
    @State private var animationAmount = 1.0
    
    var body: some View {
        
            VStack(spacing:40) {
                List {
                    ForEach(modelView.userInfoModel.indices, id: \.self) { index in
                        ListCell(model: modelView.userInfoModel[index], isPhaseAnimator: modelView.isPhaseAnimator)
                    }
                    .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
                .phaseAnimator([ false, modelView.isPhaseAnimator]) { content, phase in
                 content
                  .offset(y:  phase ? 70 : 0)
               }
            }
            .background(Color.init(red: 246.0/255.0, green: 246.0/255.0, blue: 246.0/255.0))
      }
  }

#Preview {
    ListView(modelView: UserInfoMVVM())
}
