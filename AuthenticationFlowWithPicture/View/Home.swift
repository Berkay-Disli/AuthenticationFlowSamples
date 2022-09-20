//
//  Home.swift
//  AuthenticationFlowWithPicture
//
//  Created by Berkay Disli on 18.09.2022.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var authVM: AuthenticationViewModel
    @StateObject var dataVM = DataViewModel()
    @State private var showSignOutAlert = false
    @State private var searchText = ""
    @State private var isShowingPopover = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("pri").ignoresSafeArea()
                
                // MARK: Main Scroll
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        // categories
                        VStack(spacing: 0) {
                            HStack {
                                ForEach(Categories.allCases, id:\.self) { category in
                                    VStack {
                                        Text(category.title)
                                            .foregroundColor(dataVM.selectedCategory == category ? .black:.gray)
                                            .fontWeight(dataVM.selectedCategory == category ? .medium:.regular)
                                        
                                        Capsule().fill(dataVM.selectedCategory == category ? Color("brown"):.clear)
                                            .frame(height: 3)
                                    }
                                    .onTapGesture {
                                        withAnimation(.easeInOut) {
                                            dataVM.selectCategory(category: category)
                                        }
                                    }
                                }
                            }
                            
                            Divider()
                        }
                        .padding(.bottom)
                        
                        VStack {
                            // Image slideshow
                            TabView(selection: $dataVM.imageSelection) {
                                ForEach(SlideshowImages.allCases, id:\.self) { img in
                                    Image(img.rawValue)
                                        .resizable()
                                        .scaledToFill()
                                }
                            }
                            .frame(height: 210)
                            .padding(.horizontal)
                            .padding(.bottom, -20)
                            .tabViewStyle(.page)
                            //.indexViewStyle(.page(backgroundDisplayMode: .always))
                            
                            TabView(selection: $dataVM.newsSelection) {
                                ForEach(ScrollableNews.allCases, id:\.self) { item in
                                    VStack(alignment: .leading, spacing: 16) {
                                        Image(systemName: "arrow.up.right")
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                            
                                            
                                        
                                        Text(item.title)
                                            .font(.title2)
                                            .fontWeight(.medium)
                                            .foregroundColor(Color("bg"))
                                        
                                        HStack {
                                            Text(item.publisher)
                                            Spacer()
                                            Text(item.country)
                                        }
                                        .font(.footnote)
                                    }
                                    .padding()
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.3)))
                                    .padding()
                                    .frame(height: 220)
                                    .frame(maxWidth: UIScreen.main.bounds.width)
                                }
                            }
                            .frame(height: 220)
                            .tabViewStyle(.page)
                            .indexViewStyle(.page(backgroundDisplayMode: .always))
                            
                        }
                        
                        Rectangle().fill(Color("sec"))
                            .padding(.bottom, 12)
                            .padding(.top, -4)
                        
                        VStack {
                            // Image slideshow
                            TabView(selection: $dataVM.altImageSelection) {
                                ForEach(SlideshowImages.allCases, id:\.self) { img in
                                    Image(img.rawValue)
                                        .resizable()
                                        .scaledToFill()
                                }
                            }
                            .frame(height: 210)
                            .padding(.horizontal)
                            .padding(.bottom, -20)
                            .tabViewStyle(.page)
                            //.indexViewStyle(.page(backgroundDisplayMode: .always))
                            
                            TabView(selection: $dataVM.altNewsSelection) {
                                ForEach(ScrollableNews.allCases, id:\.self) { item in
                                    VStack(alignment: .leading, spacing: 16) {
                                        Image(systemName: "arrow.up.right")
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                            
                                            
                                        
                                        Text(item.title)
                                            .font(.title2)
                                            .fontWeight(.medium)
                                            .foregroundColor(Color("bg"))
                                        
                                        HStack {
                                            Text(item.publisher)
                                            Spacer()
                                            Text(item.country)
                                        }
                                        .font(.footnote)
                                    }
                                    .padding()
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.3)))
                                    .padding()
                                    .frame(height: 220)
                                    .frame(maxWidth: UIScreen.main.bounds.width)
                                }
                            }
                            .frame(height: 220)
                            .tabViewStyle(.page)
                            .indexViewStyle(.page(backgroundDisplayMode: .always))
                            
                        }
                        
                        

                        
                        
                        
                        Spacer()
                    }
                }
                .searchable(text: $searchText, prompt: "Search")
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSignOutAlert.toggle()
                    } label: {
                        Image(systemName: "power")
                            .foregroundColor(Color("bg"))
                    }
                    .alert("Signing Out", isPresented: $showSignOutAlert) {
                        Button(role: .destructive) {
                            authVM.signOut()
                        } label: {
                            Text("Sign Out")
                        }
                        
                    } message: {
                        Text("Do you want to sign out?")
                    }
                    
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "bell")
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(AuthenticationViewModel())
    }
}
