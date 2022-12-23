//
//  ContentView.swift
//  testingScreen
//
//  Created by quan dang on 8/23/22.
//

import SwiftUI

struct ContentView: View
{
    @StateObject var viewModel = CalculatorViewModel()
    @State private var selection: String? = nil
    var body: some View
    {
        NavigationView
        {
            ZStack{
                Rectangle()
                    .foregroundColor(.black)
                    .edgesIgnoringSafeArea(.all)
//                Image("logo")
//                    .resizable()
//                    .offset(x: -30, y: -390)
//                    .frame(width: 100, height: 50)
//                Image("peace")
//                    .resizable()
//                    .frame(width: 350, height: 600, alignment:.center)
                VStack(spacing: 40)
                {
                    NavigationLink(destination: Tutorial(), tag: "help", selection: $selection){ EmptyView()}
                    NavigationLink(destination: Rams(viewModel: viewModel), tag: "Rams", selection: $selection){EmptyView()}
                    NavigationLink(destination: Buffalo(viewModel: viewModel), tag: "Bills", selection: $selection){EmptyView()}
                    NavigationLink(destination: Bucs(viewModel: viewModel), tag: "Bucs", selection: $selection){EmptyView()}
                    NavigationLink(destination: Chiefs(viewModel: viewModel), tag: "Chiefs", selection: $selection){EmptyView()}
                    
                    Button("Tutorial"){
                        self.selection = "help"
                    }
                    .font(.system(size:20))
                    .padding(.vertical,10)
                    .padding(.horizontal,20)
                    .background(Color.white)
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    Button("Los Angeles"){
                        self.selection = "Rams"
                    }
                    .font(.system(size:20))
                    .padding(.vertical,10)
                    .padding(.horizontal,20)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    Button("Buffalo"){
                        self.selection = "Bills"
                    }
                    .font(.system(size:20))
                    .padding(.vertical,10)
                    .padding(.horizontal,20)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    Button("Tampa Bay"){
                        self.selection = "Bucs"
                    }
                    .font(.system(size:20))
                    .padding(.vertical,10)
                    .padding(.horizontal,20)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    Button("Kansas"){
                        self.selection = "Chiefs"
                    }
                    .font(.system(size:20))
                    .padding(.vertical,10)
                    .padding(.horizontal,20)
                    .background(Color.red)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                }
            }
            .navigationBarTitle(Text("Teams"))
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
