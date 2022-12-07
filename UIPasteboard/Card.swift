//
//  Card.swift
//  UIPasteboard
//
//  Created by mark me on 11/12/22.
//

import SwiftUI

struct Card: View {
    
    var data: Model
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundColor(Color.purple.opacity(0.4))
                .frame(maxWidth: .infinity)
                .frame(height: 120)
                .padding([.leading, .trailing], 10)
                .overlay {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(data.name)
                                .padding([.top, .bottom], 5)
                                .padding([.leading, .trailing], 13)
                                .font(.system(size: 20, weight: .heavy, design: .rounded))
                                .foregroundColor(Color.white)
                                .background(Color.purple)
                                .cornerRadius(10)
                               
                       
                                    .onTapGesture {
                                        vm.user_name_copied.toggle()
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            vm.user_name_copied = false
                                        }
                                        UIPasteboard.general.string = self.data.name
                                }
                            
                            Text(data.msg)
                                .font(.headline.bold())
                                .padding([.top, .bottom], 5)
                                .foregroundColor(Color.blue)
                                
                            
                            Spacer()
                        }
                        .padding(.leading, 30)
                        .padding(.top, 15)
                        Spacer()
                    }
                    
                }
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(data: Model(name: "Mark", msg: "This is my social name"))
            .environmentObject(ViewModel())
    }
}
