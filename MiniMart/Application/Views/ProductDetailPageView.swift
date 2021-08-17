import SwiftUI

struct ProductDetailPageView: View {
    var product: FetchProductsQuery.Data.Product
    @EnvironmentObject var cartState: CartState
    var body: some View {
        
        ScrollView {
            RemoteImage(urlString: product.imageUrl)
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width)
            Text(product.name)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
            Spacer()
            Text("\(product.price) 円")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title2)
            Spacer()
            Text(product.summary)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
                .frame(height: 100)
            Button(action: {
                cartState.products.append(product)
            }) {
                Text("カートに追加")
            }
            .scaledToFit()
            .frame(width: (UIScreen.main.bounds.width - 30 ), height: 70,alignment: .center)
            .background(Color.orange)
            .foregroundColor(Color.white)
            .cornerRadius(10.0)
            .padding(.bottom,10.0)
            Spacer().frame(height: 100)
        }
    }
}

struct ProductDetailPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductDetailPageView(
                product: FetchProductsQuery.Data.Product(
                    id: UUID().uuidString,
                    name: "商品 \(1)",
                    price: 100,
                    summary: "おいしい食材 \(1)",
                    imageUrl: "https://image.mini-mart.com/dummy/1"
                )
            )
        }
    }
}
