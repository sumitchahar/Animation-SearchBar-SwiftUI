//
//  UserInfoModel.swift
//  AnimationRowList
//
//  Created by Sumit on 13/08/24.
//

  import Foundation

  class UserInfoMVVM:ObservableObject {
      
      @Published var userInfoModel = [UserInfoModel]()
      @Published var isShowSearchBar:Bool = false
      @Published var isPhaseAnimator:Bool = false
     
      var items = [UserInfoModel]()

     init() {
         guard let feedsUrl = Bundle.main.url(forResource: "JsonFile", withExtension: "json") else { return }
         let decoder = JSONDecoder()
         guard let data = try? Data(contentsOf: feedsUrl) else { return }
         do {
             self.userInfoModel = try decoder.decode([UserInfoModel].self, from: data)
             
            } catch {
         }
         items = userInfoModel
     }
      
      func filterData(_ searchText:String) {
          if searchText != "" {
              let filterAudioData = userInfoModel.filter({($0.title ?? "").lowercased().prefix(searchText.count) == searchText.lowercased()})
                  userInfoModel = filterAudioData
          } else { if searchText == "" && searchText.count == 0 { userInfoModel = items } }
      }

 }
