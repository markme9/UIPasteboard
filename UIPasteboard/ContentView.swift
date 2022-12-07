//
//  ContentView.swift
//  UIPasteboard
//
//  Created by mark me on 11/12/22.
//

import SwiftUI

struct Model: Identifiable {
    var id = UUID()
    var name: String
    var msg: String
}
class ViewModel: ObservableObject {
    @Published var data: [Model] = []
    @Published var user_name_copied: Bool = false
}

struct ContentView: View {
    
    @EnvironmentObject var vm: ViewModel
    @State var isPresnted: Bool = false
    
    init() {
        let navigation = UINavigationBar.appearance()
        navigation.largeTitleTextAttributes = [.font: UIFont(name: "PlayfairDisplay-Bold", size: 40) as Any]
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView {
                    ForEach(vm.data) { item in
                        Card(data: item)
                    }
                }
                .navigationTitle(Text("Peoples"))
                .navigationBarItems(trailing: Button(action: {
                    isPresnted.toggle()
                }, label: {
                    Image(systemName: "plus")
                        .font(.headline.bold())
                        .foregroundColor(Color.red)
                }))
                .fullScreenCover(isPresented: $isPresnted) {
                    User { data in
                        vm.data.append(data)
                    }
                }
               
                if vm.user_name_copied == true {
                    Text("copied")
                        .font(.title2)
                        .frame(width: 100)
                        .frame(height: 40)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(14)
                       
                    
                }else {
                    Text("")
                        .hidden()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
