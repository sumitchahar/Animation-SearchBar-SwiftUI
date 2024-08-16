//
//  SearchBar.swift
//  AnimationRowList
//  Created by Sumit on 14/08/24.

 import SwiftUI

 struct SearchBar: View {
 
     @ObservedObject var modelView:UserInfoMVVM
     @State private var name: String = ""
     @State private var offset: CGFloat = 0.0

     init(modelView: UserInfoMVVM) { self.modelView = modelView }

     var body: some View {
         ZStack {
             VStack {
                 HStack {
                     if modelView.isShowSearchBar {
                         HStack {
                             Rectangle()
                                 .fill(.white)
                                 .frame(height:52)
                                 .cornerRadius(25)
                                 .opacity(1.0)
                                 .shadow(radius: 1.3)
                                 .overlay(content: {
                                     HStack {
                                         Image(systemName: "magnifyingglass")
                                             .padding([.leading])
                                             .opacity(0.5)
                                         TextField("Search", text: $name)
                                             .onChange(of: name, initial: true) { oldCount, newCount in
                                                 modelView.filterData(name)
                                             }
                                         Spacer()
                                     }
                                 })
                         }.padding([.leading,.top])
                          .frame(width: UIScreen.main.bounds.size.width - 50)
                          .transition(AnyTransition.scale.animation(.easeInOut(duration: 0.7)))
                     } else {
                         HStack {
                             Image(systemName: "person.circle.fill")
                                 .resizable()
                                 .frame(width: 30,height:30)
                                 .padding(.leading)
                                 .foregroundColor(.gray)
                                 .padding(.top,10)
                             Spacer()
                             Text("Details")
                                 .font(.system(size: 26))
                                 .bold()
                                 .padding(.trailing, -10)
                                 .transition(AnyTransition.scale.animation(.easeInOut(duration: 0.7)))
                                 .padding(.top,10)

                             Spacer()
                         }
                     }
                     Spacer()
                    HStack {
                      Button {
                          withAnimation {
                              modelView.isShowSearchBar.toggle()
                              modelView.isPhaseAnimator.toggle()
                              name = ""
                              modelView.filterData(name)
                          }
                          DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                              modelView.isPhaseAnimator = false
                          }
                      } label: {
                      Image(systemName: modelView.isShowSearchBar == true ?  "xmark.seal.fill" : "magnifyingglass.circle.fill")
                      .resizable()
                      .frame(width: 30,height:30)
                      .padding([.trailing],4)
                      .tint(.gray)
                         }
                       }
                      .padding([.trailing],20)
                      .padding(.top,15)
                      .padding(.leading,10)
                      .frame(width:40)
                  }
                 .frame(height:52)
             }
         }
         Spacer()
     }
 }

 #Preview {
     SearchBar(modelView:UserInfoMVVM())
 }
