//
//  NewRestaurantView.swift
//  FoodPin
//
//  Created by Ly Gia Huy on 25/03/2023.
//

import SwiftUI

struct NewRestaurantView: View {
    
    @State private var restaurantImage = UIImage(named: "newphoto")!
    @State private var showPhotoOptions = false
    @State private var photoSource: PhotoSource?
    
    enum PhotoSource: Identifiable {
        case photoLibrary
        case camera
        
        var id: Int {
            hashValue
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                    VStack {
                        Image(uiImage: restaurantImage)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 200)
                            .backgroundStyle(Color(.systemGray6))
                            .clipShape(RoundedRectangle(cornerRadius: 20.0))
                            .padding(.bottom)
                            .onTapGesture {
                                showPhotoOptions.toggle()
                            }
                        
                        
                        FormTextField(label: "NAMW", placeHolder: "Fill in the restaurant name", value: .constant(""))
                        FormTextField(label: "TYPE", placeHolder: "Fill in the restaurant type", value: .constant(""))
                        FormTextField(label: "ADDRESS", placeHolder: "Fill in the restaurant address", value: .constant(""))
                        FormTextField(label: "PHONE", placeHolder: "Fill in the restaurant phone", value: .constant(""))
                        FormTextView(label: "DESCRIPTION", placeHolder: "Fill in the restaurant description", value: .constant(""))
                    }
                    .padding()
            }
            .navigationTitle("New Restaurant")
        }
        .actionSheet(isPresented: $showPhotoOptions) {
            
            ActionSheet(title: Text("Choose your photo source"), message: nil, buttons: [
                .default(Text("Camera"),action: {
                    photoSource = .camera
                }),
                .default(Text("Photo Library"), action: {
                    photoSource = .photoLibrary
                }),
                .cancel()
            ])
            
        }
    }
}

struct NewRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        NewRestaurantView()
    }
}


struct FormTextField: View {
    
    let label: String
    let placeHolder: String
    
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(label)
                .font(.system(.headline, design: .rounded))
                .foregroundColor(Color(.darkGray))
                
            TextField(placeHolder, text: $value)
                .font(.system(size: 20,weight: .semibold, design: .rounded))
                .padding(.horizontal)
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                }
            .padding(.vertical, 10)
        })
    
    }
}


struct FormTextView: View {
    let label: String
    let placeHolder: String
    
    @Binding var value: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.system(.headline, design: .rounded))
                .foregroundColor(Color(.darkGray))
                
            TextEditor(text: $value)
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray5),lineWidth: 1)
                }
                .padding(.top, 10)
        }
    }
}
