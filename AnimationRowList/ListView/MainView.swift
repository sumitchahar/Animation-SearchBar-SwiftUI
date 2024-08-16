//
//  MainView.swift
//  AnimationRowList
//
//  Created by Sumit on 14/08/24.
//

 import SwiftUI

 struct MainView: View {

     @ObservedObject var modelView = UserInfoMVVM()
     
    var body: some View {
        ZStack {
            VStack(spacing:5) {
                SearchBar(modelView: modelView)
                ListView(modelView: modelView)
             }
         }
        .background(Color.init(red: 246.0/255.0, green: 246.0/255.0, blue: 246.0/255.0))
     }
  }

#Preview {
    MainView()
}
