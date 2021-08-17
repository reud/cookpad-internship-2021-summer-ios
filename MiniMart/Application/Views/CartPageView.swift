import SwiftUI

struct CartPageView: View {
    @EnvironmentObject var cartState: CartState
    @Binding var isCartViewPresented: Bool
    @State private var isPresented = false;
    var body: some View {
        VStack {
            List {
                ForEach(cartState.aggregate(), id: \.product.id) {
                    result in
                    NavigationLink(destination: ProductDetailPageView(product: result.product)) {
                        HStack(alignment: .top) {
                            RemoteImage(urlString: result.product.imageUrl)
                                .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            VStack(alignment: .leading) {
                                Text(result.product.name)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("\(result.product.price)円")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("\(result.count) 個")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }.padding(.vertical, 8)
                        }
                    }
                    HStack {
                        Text("合計: \(cartState.cost()) 円").frame(maxWidth: .infinity, alignment: .trailing)
                        Spacer()
                    }
                }.listStyle(PlainListStyle())
            }

            Spacer()
            Button(action: {
                isPresented = true
            }) {
                Text("注文する")
            }.alert(isPresented: $isPresented){
                Alert(title: Text("注文しました。"),
                      message: Text("注文しました。"),
                      dismissButton: .default(Text("OK"),
                      action: {
                        isCartViewPresented = false
                      }
                    )
                )
            }
            .scaledToFit()
            .frame(width: (UIScreen.main.bounds.width - 30 ), height: 70,alignment: .center)
            .background(Color.orange)
            .foregroundColor(Color.white)
            .cornerRadius(10.0)
            .padding(.bottom,10.0)
            Spacer().frame(height: 20)
        }
        .navigationTitle("カート")
    }
}

struct CartPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CartPageView(isCartViewPresented: .constant(false)).environmentObject(CartState())
        }
    }
}
