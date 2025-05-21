//
//  ReceiptView.swift
//  4st_assignment
//
//  Created by 이예지 on 4/10/25.
//

import SwiftUI
import PhotosUI

struct ReceiptView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var showCamera = false
    @State private var showActionSheet = false
    @State private var showPhotosPicker = false
    
    @State private var showImagePopup = false
    @State private var popupImage = "receiptsadang"
    
    private var viewModel: OCRViewModel = .init()
    
    var body: some View {
            ZStack {
                Color(.white01)
                    .ignoresSafeArea()
                VStack {
                    //네비바를 사용해야할거같은데 너무 어려우니 스택으로 대체..!
                    ZStack {
                        Color(.white)
                            .frame(width: 440, height: 110)
                        HStack() {
                            Button(action: {
                                dismiss()
                            }) {
                                Image(systemName: "chevron.backward")
                                    .foregroundStyle(.black)
                                    .frame(width: 35, height:35)
                            }
                            .padding(.leading, 30)
                            Spacer()
                            Text("전자 영수증")
                                .font(.PretendardMedium16)
                            Spacer()
                            Button(action: {
                                showActionSheet = true
                            }) {
                                Image(systemName: "plus")
                                    .foregroundStyle(.black)
                                    .frame(width: 35, height:35)
                            }
                            .padding(.trailing, 30)
                        }
                        .padding(.top, 50)
                        .confirmationDialog("영수증 추가하기", isPresented: $showActionSheet, titleVisibility: .visible) {
                            Button("앨범에서 등록하기") {
                                showPhotosPicker = true
                            }
                            
                            Button("카메라로 촬영하기") {
                                showCamera = true
                            }
                            
                            Button("취소", role: .cancel) {}
                        }
                        .sheet(isPresented: $showCamera) {
                            CameraPicker { image in
                                viewModel.addImage(image)
                            }
                        }
                        .photosPicker(isPresented: $showPhotosPicker, selection: $selectedItems, maxSelectionCount: 1, matching: .images)
                        .onChange(of: selectedItems) { oldItems, newItems in
                            for item in newItems {
                                Task {
                                    if let data = try? await item.loadTransferable(type: Data.self),
                                       let image = UIImage(data: data) {
                                        viewModel.addImage(image)
                                    }
                                }
                            }}
                    }
                    .padding(.bottom, 10)
                    
                    //상단 글자
                    HStack {
                        HStack {
                            Text("총")
                                .font(.PretendardRegular18)
                            Text("1건") //영수증 개수 불러오기
                                .font(.PretendardSemiBold18)
                                .foregroundColor(.brown01)
                        }
                        .padding(.leading, 40)
                        
                        Spacer()
                        
                        HStack {
                            Text("사용합계")
                                .font(.PretendardRegular18)
                            Text("6,500") //총 금액 합계 불러오기
                                .font(.PretendardSemiBold18)
                                .foregroundColor(.brown01)
                        }
                        .padding(.trailing, 35)
                    }
                    .padding(.bottom, 20)
                    
                    //영수증 목록
                    //OCR한테 벽 느껴요 완벽? 아니요 그냥 진짜 벽이요
                    HStack {
                        VStack(alignment: .leading, spacing: 7) {
                            Text("사당역") //OCR에서 지점 불러오기
                                .font(.PretendardSemiBold18)
                            Text("2025.01.05 11:30") //OCR에서 날짜 불러오기
                                .font(.PretendardMedium16)
                                .foregroundColor(.gray03)
                            Text("6,500원") //OCR에서 총 금액 불러오기
                                .font(.PretendardSemiBold18)
                                .foregroundStyle(.brown02)
                        }
                        Spacer()
                        //영수증 버튼
                        Button(action: {
                            withAnimation {
                                showImagePopup = true
                            }
                        }) {
                            Image(.receiptdetail)
                                .resizable()
                                .frame(width: 16, height: 20)
                        }
                    }
                    .padding([.leading, .trailing], 40)
                    .padding(.bottom, 14)
                    
                    Divider()
                        .frame(width: 370)
                        .foregroundColor(.gray01)
                    
                    Spacer()
                        .frame(height: 625)
                }
                //영수증 팝업
                if showImagePopup {
                    ZStack {
                        Color.black.opacity(0.8)
                            .ignoresSafeArea()
                        
                        Image(popupImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 720)
                            .overlay(
                                Button(action: {
                                    withAnimation {
                                        showImagePopup = false
                                    }
                                }) {
                                    Image(systemName: "multiply")
                                        .foregroundColor(.gray04)
                                }
                                .padding(20),
                                alignment: .topTrailing
                        )
                    }
                }
                
            }
        }
    }

#Preview {
    ReceiptView()
}
