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
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("pri").ignoresSafeArea()
                
                // MARK: Main Stack
                VStack {
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
                    .padding(.vertical)
                    
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
                    .tabViewStyle(.page)
                    //.indexViewStyle(.page(backgroundDisplayMode: .always))
                    
                    
                    Spacer()
                }
            }
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
