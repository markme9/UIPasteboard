//
//  User.swift
//  UIPasteboard
//
//  Created by mark me on 11/12/22.
//

import SwiftUI

struct User: View {
    
    var data: (Model) -> ()
    @State var name: String = ""
    @State var msg: String = ""
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading) {
            
            TextField("Name", text: $name)
                .padding()
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.blue.opacity(0.3))
                .cornerRadius(30)
                .padding([.leading, .trailing])
            
            TextField("Message", text: $msg, axis: .vertical)
                .padding()
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.pink.opacity(0.3))
                .cornerRadius(30)
                .padding([.leading, .trailing])
            
            Button {
                presentationMode.wrappedValue.dismiss()
                self.data(.init(name: name, msg: msg))
            } label: {
                Text("Save Data")
                    .font(.title.bold())
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(30)
                    .padding([.leading, .trailing])
                    .padding(.top, 15)
            }

        }
        .frame(maxWidth: .infinity)
        .frame(height: 300)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 2)
        .padding([.leading, .trailing], 30)
    }
}

struct User_Previews: PreviewProvider {
    static var previews: some View {
        User(data: {_ in })
    }
}
