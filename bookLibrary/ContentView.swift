//
//  ContentView.swift
//  bookLibrary
//
//  Created by Mustafa  on 14.07.2022.
//

import Inject
import SwiftUI

struct ModalData {
  var id: Int
  var name: String
  var imageUrl: String
  var detail: String
}

struct ModalView: View {
  var bookData: ModalData
  @Environment(\.colorScheme) var colorScheme
  @Environment(\.dismiss) var dismiss
    
  let imageWidth = 100

  var body: some View {

      

    AsyncImage(url: URL(string: bookData.imageUrl)) { image in
      image.resizable()
    } placeholder: {
      Color.black
    }
    .frame(width: 172, height: 250)
    .clipShape(RoundedRectangle(cornerRadius: 6))
      
    Text(bookData.name)
          .fontWeight(.bold)
          .font(.system(size: 32) )
          .multilineTextAlignment(.center)
          .padding(.bottom)

    Text(bookData.detail)
          .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
          .padding(.horizontal)
      
    Spacer()
    Button("Kapat") {
      dismiss()
    }
    .foregroundColor(.white)
       .padding()
       .background(Color.black)
       .cornerRadius(8)

  }
}

struct ContentView: View {
  @ObserveInjection var inject
  @Environment(\.colorScheme) var colorScheme
  @State private var modalShow = false

  let books = [
    (
      id: 1,
      name: "Harry Potter ve Felsefe Taşı",
      imageUrl:
        "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSL-Ijhxy5WskEjSCSe7n98bXAdO--hrX7ackMM-CLzjhb44bMf",
      detail:
        "Harry, elleri titreyerek zarfı çevirince mor balmumundan bir mühür gördü; bir arma – koca bir ‘H’ harfinin çevresinde bir aslan, bir kartal, bir porsuk, bir de yılan"
    ),
    (
      id: 2,
      name: "Harry Potter ve Sırlar Odası",
      imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ-sjwTiBK5pJ0m4Ed6kWzIaOktqjsQcG97fTJijT2MeVp2Awv",
      detail:
        "Dursley''ler o yaz öylesine çekilmez olmuşlardır ki, Harry bir an önce okulu Hogwarts''a geri dönmek için can atmaktadır. Eşyalarını toplarken ortaya çıkan ev cini Dobby ise onu uyarır: Hogwarts''a dönerse, bir felaket olacaktır. Olur da: Sırlar Odası''nın açılmasıyla ortaya çıkan karanlık bir güç, Hogwarts''takileri taşa çevirmeye başlar. Harry, hayatını tehlikeye atarak, Oda''nın elli yıllık ölümcül gizemini çözmeye çalışıyor."
    ),
    (
      id: 3,
      name: "Harry Potter ve Azkaban Tutsağı",
      imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRb6z81dAJgCUvxxO3O7rRJKGgOGdsfJZr_vZhI7H78rtL18wko",
      detail:
        "Sirius Black adında azılı bir katil, tüyler ürpertici Azkaban kalesinde tam on iki yıl boyunca tutsak kalmıştır. Tek lanetle on üç kişiyi birden öldüren Black’in, Karanlık Lord Voldemort’un hizmetkârı olduğuna kesin gözüyle bakılmaktadır. Bir yolunu bulup Azkaban’dan kaçan Black’in peşinde olduğu bir tek kişi vardır: Harry Potter. Harry, büyücülük okulunun sihirli duvarları arasındayken, arkadaşları ve öğretmenleriyle birlikteyken bile güvende değildir. Çünkü aralarında bir hain olabilir."
    ),
    (
      id: 4,
      name: "Harry Potter ve Ateş Kadehi",
      imageUrl:
        "https://metadata.isbn.nl/ie_fcache/0000318104_Harry_Potter_and_the_Goblet_of_Fire_Illustrated_edition_2_710_130_0_0.jpg",
      detail:
        "Harry Potter'ın büyücülük okulundaki dördüncü yılında başından geçenleri anlatan Harry Potter ve Ateş Kadehi, dizinin önceki kitaplarında tanık olduğumuzdan hem çok daha eğlenceli, hem çok daha ürkütücü bir büyücülük dünyasının kapılarını açıyor."
    ),
    (
      id: 5,
      name: "Harry Potter ve Zümrüdüanka Yoldaşlığı",
      imageUrl:
        "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQhCknB6G3zTIl1ydWgP509AbrrmZGb-fEKIXxMBcTATwPK_0tc",
      detail:
        "Hogwarts Cadılık ve Büyücülük Okulu'ndaki beşinci yılında Harry, hayatını cehenneme çeviren sihirli/sihirsiz pek çok şeyle başa çıkmak zorunda: Yaz tatilini yanlarında harcadığı aptal akrabaları; ergenlik çağının isyanları, heyecanları, korkuları; onun gösteriş düşkünü bir yalancı olduğunu düşünenler; okulun işleyişine burnunu sokan Sihir Bakanlığı; öncekileri mumla aratan yeni bir Karanlık Sanatlara Karşı Savunma öğretmeni; yine karşı karşıya geldiği Ruh Emici'ler ve Ölüm Yiyen'ler; varlığını her zamankinden çok hissettiren Voldemort; ağır dersler, zor sınavlar, acımasız cezalar; sürekli yinelenen bir kâbus ve acıyan yara izi; ona en yakın insanlardan birinin ölümü; beş yıl gecikmeyle öğrendiği bir gerçek..."
    ),
    (
      id: 6,
      name: "Harry Potter ve Melez Prens",
      imageUrl:
        "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRFo77X2wfAO78zuFlc6du-e1ncwJO7yPu37PYomGNZtpmdPtue",
      detail:
        "Büyücüler dünyasında devam eden karmaşa artık Muggle'ların dünyasını da etkilemeye başlamıştır. Harry Potter, Hogwarts'taki altıncı yılını Feci Yorucu Büyücülük Sınavlarına hazırlanarak geçireceğini düşünmektedir. Artık Quidditch takımının da kaptanıdır. Ancak Diagon Yolu'ndaki okul alışverişi sırasında Draco Malfoy'un bir şeyler çevirdiğini fark eder. Lord Voldemort'un geçmişiyle ilgili pek çok bilinmeyen ortaya çıkarken bir yandan da Malfoy'un neyin peşinde olduğunu öğrenmeye çalışan Harry'yi yine zor günler beklemektedir."
    ),
    (
        id: 7,
        name: "Harry Potter ve Ölüm Yadigârları",
        imageUrl:
          "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTgNG5bi_AhwMJmrRphfKLSQlobEBBqsoBrhqhDAu2qOhZp4W97",
        detail:
          "Sihir dünyası savaşta! Karanlık Lord iyice güç kazanırken iyiler de boş durmuyor. Yedinci yılında Hogwarts Cadılık ve Büyücülük Okulu'na dönmeyen Harry Potter, Dumbledore'un ona bıraktığı görevi tamamlamaya çalışıyor. Yanında -her zamanki gibi- Ron ve Hermione'yle, bir yandan Voldemort'tan ve onun Ölüm Yiyen'lerinden kaçarken bir yandan da Hortkuluklar'ı yok etmek, Ölüm Yadigârları'nın sırrını keşfetmek zorunda olan Harry kendi geçmişiyle ilgili de pek çok şey öğreniyor."
      ),
    (
        id: 8,
        name: "Harry Potter ve Lanetli Çocuk",
        imageUrl:
          "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRL6wfID483tofZj3CfDVg3vk3ylEgG23Oov3FL795TsrGXCPLV",
        detail:
          "Sekizinci Hikâye. On Dokuz Yıl Sonra... Harry ait olduğu yerde durmayı reddeden bir geçmişle boğuşurken, en küçük oğlu Albus da istemediği bir aile mirasının yükünü omuzlarında taşımakta zorlanır. Geçmişle gelecek uğursuzca iç içe geçerken hem baba hem oğul tedirgin edici bir gerçeği, bazen karanlığın beklenmedik yerlerden geldiğini öğrenir. “Harry Potter ve Lanetli Çocuk”, J.K. Rowling, John Tiffany ve Jack Thorne’a ait yeni bir özgün hikâyeden yola çıkarak Jack Thorne’un yazdığı yeni bir oyun. Bu oyun sadece sekizinci Harry Potter hikâyesi değil, aynı zamanda tescilli olarak sahneye koyulan ilk Harry Potter hikâyesi. 30 Temmuz 2016’da Londra West End’de gerçekleşen prömiyerin hemen ardından Sahne Metni Özel Baskısı, dünyanın dört bir yanındaki okuyucuları Harry Potter, arkadaşları ve ailesinin devam eden yolculuğuyla buluşturuyor."
      )
  ]

  var body: some View {
    NavigationView {

      List {
        ForEach(books, id: \.id) { currentBook in
          Button(
            action: {
              modalShow.toggle()
            },
            label: {
              HStack {
                AsyncImage(url: URL(string: currentBook.imageUrl)) { image in
                  image.resizable()
                } placeholder: {
                  Color.black
                }
                .frame(width: 100, height: 128)
                .clipShape(RoundedRectangle(cornerRadius: 6))

                Text(currentBook.name).foregroundColor(
                  colorScheme == .dark ? Color.white : Color.black)
                Spacer()
              }
            }
          )
          .sheet(isPresented: $modalShow) {
            ModalView(
              bookData: ModalData(
                id: currentBook.id, name: currentBook.name, imageUrl: currentBook.imageUrl,
                detail: currentBook.detail))
          }

        }
      }

      .navigationTitle("Harry Potter")
    }

    .enableInjection()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
