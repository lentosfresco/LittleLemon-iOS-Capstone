//
//  UserProfile.swift
//  Capstone-iOS
//
//  Created by Wael Shabana on 2024-04-20.
//

import SwiftUI

@available(iOS 17.0, *)
struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    @State private var firstName: String = (UserDefaults.standard.string(forKey: kFirstName) ?? "")
    @State private var lastName: String = (UserDefaults.standard.string(forKey: kLastName) ?? "")
    @State private var email: String = (UserDefaults.standard.string(forKey: kEmail) ?? "")
    @State private var phoneNumber: String = (UserDefaults.standard.string(forKey: kPhoneNumber) ?? "")
    @State private var showAlert = false
    
    @State var orderStatusChecked = (UserDefaults.standard.bool(forKey: kIsOrderStatusChecked) )
    @State var passwordChangesChecked = (UserDefaults.standard.bool(forKey: kIsPasswordChangesChecked) )
    @State var specialOffersChecked = (UserDefaults.standard.bool(forKey: kIsSpecialOffersChecked) )
    @State var newLettersChecked = (UserDefaults.standard.bool(forKey: kIsNewLettersChecked) )
    
    let backAction:()->Void
    
    init(backAction: @escaping () -> Void) {
        self.backAction = backAction
    }
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("Personal Information")
                    .font(.karlaLeadText).bold()
                    .padding(.horizontal,10).padding(.vertical,5)
//                Text("Avatar")
//                    .font(.karlaParagraph).foregroundColor(.gray)
//                    .padding(.horizontal,10)
                HStack{
                    ImageView(width: 80, height: 80)
                    
                    Button {
                    } label: {
                        Text("Change")
                    }
                    .padding(10)
                    .background(Color.primaryGreen)
                    .cornerRadius(10)
                    .foregroundColor(.highlightWhite)
                    .padding(.horizontal,10)
                    
                    Button {
                    } label: {
                        Text("Remove")
                    }
                    .padding(10)
                    .background(Color.highlightWhite)
                    .border(Color.primaryGreen)
                    .cornerRadius(2)
                    .foregroundColor(.primaryGreen)
                }.padding(.horizontal,10)
                Section{
                    TextView(label: "First Name", value: $firstName, iconName: "person.circle.fill")
                    TextView(label: "Last Name", value: $lastName, iconName: "person.circle.fill")
                    TextView(label: "Email", value: $email, iconName: "envelope.circle.fill").disabled(false)
                    TextView(label: "Phone Number", value: $phoneNumber, iconName: "phone")
                        .onChange(of: phoneNumber) {
                            if !phoneNumber.isEmpty {
                                phoneNumber = phoneNumber.formatPhoneNumber()
                            }
                        }
                    Text("Email notifications")
                        .font(.karlaLeadText).bold()
                        .padding(.horizontal,10).padding(.top,15)
                    VStack(alignment: .leading){
                        Toggle(isOn: $orderStatusChecked) {
                            Text("Order Status")
                        }.toggleStyle(CheckboxToggle()).padding(.vertical,3)
                        Toggle(isOn: $passwordChangesChecked) {
                            Text("Password Changes")
                        }.toggleStyle(CheckboxToggle()).padding(.vertical,3)
                        Toggle(isOn: $specialOffersChecked) {
                            Text("Special Offers")
                        }.toggleStyle(CheckboxToggle()).padding(.vertical,3)
                        Toggle(isOn: $newLettersChecked) {
                            Text("Newletters")
                        }.toggleStyle(CheckboxToggle()).padding(.vertical,3)
                    }.padding(.horizontal,10).padding(.bottom,15)
                        .overlay(
                            Image(.lemon)
                                .scaleEffect(CGSize(width: 0.25, height: 0.25))
                                .opacity(0.15)
                                .padding(.leading, 180)
                                .padding(.bottom, 30)
                                .foregroundColor(.gray).grayscale(0.5)
                        )
                    ButtonView(title: "Logout",action: {
                        UserDefaults.standard.set(
                            false, forKey: kIsLoggedIn
                        )
                        showAlert = true
                        self.presentation.wrappedValue.dismiss()
                    },isPrimary: false)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Logout Success"))
                    }
                }
                HStack(alignment: .center){
                    Spacer()
                    Button {
                        backAction()
                    } label: {
                        Text("Discard Changes")
                    }.padding(10)
                        .background(Color.highlightWhite)
                        .cornerRadius(10)
                        .border(Color.primaryGreen)
                        .foregroundColor(.primaryGreen)
                    Button {
                        UserDefaults.standard.set(
                            firstName, forKey: kFirstName
                        )
                        UserDefaults.standard.set(
                            lastName, forKey: kLastName
                        )
                        UserDefaults.standard.set(
                            email, forKey: kEmail
                        )
                        UserDefaults.standard.set(
                            phoneNumber, forKey: kPhoneNumber
                        )
                        UserDefaults.standard.set(
                            true, forKey: kIsLoggedIn
                        )
                        UserDefaults.standard.set(
                            orderStatusChecked, forKey: kIsOrderStatusChecked
                        )
                        UserDefaults.standard.set(
                            passwordChangesChecked, forKey: kIsPasswordChangesChecked
                        )
                        UserDefaults.standard.set(
                            specialOffersChecked, forKey: kIsSpecialOffersChecked
                        )
                        UserDefaults.standard.set(
                            newLettersChecked, forKey: kIsNewLettersChecked
                        )
                        backAction()
                    } label: {
                        Text("Save Changes")
                    }.padding(10)
                        .background(Color.primaryGreen)
                        .cornerRadius(5)
                        .foregroundColor(.highlightWhite)
                        .padding(.horizontal,10)
                    Spacer()
                }.padding(.horizontal,10).padding(.top,15)
            }
        }
    }
}

@available(iOS 17.0, *)
struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile(backAction:{})
    }
}
