import 'package:finalmobile/soru.dart';


class Test{
  int _soruIndex=0;
  final List<Sorular> _soruBankasi=[
    Sorular(soruMetni:'1-  Kelebeklerin ömrü bir gündür' ,soruYaniti:false ),
    Sorular(soruMetni:'2-  Yargı yetkisi, Türk Milleti adına bağımsız ve adil mahkemelerce kullanılır' , soruYaniti:false ),
    Sorular(soruMetni:'3-  İstanbul 14. yüzyılda feth edilmiştir' , soruYaniti:false ),
    Sorular(soruMetni:'4-  Her yıl 12 mayıs anneler günü olarak kutlanır' , soruYaniti:false ),
    Sorular(soruMetni:'5-  Bir yıl 365 gün 6 saattir' , soruYaniti:true ),
    Sorular(soruMetni:'6-  Fatih Sultan Mehmet hiç patates yememiştir' ,soruYaniti:true ),
    Sorular(soruMetni:'7-  Fransızlar 80 demek için, 4 - 20 der' ,soruYaniti: true),
    Sorular(soruMetni:'8-  Hanefilik İslam dininde sünni bir mezheptir' , soruYaniti:true ),
    Sorular(soruMetni:"9-  Barcelona İspanya'nın başkentidir." , soruYaniti:false ),
    Sorular(soruMetni:"10-  Alanya Antalya'nın bir ilçesidir" , soruYaniti:true ),
    Sorular(soruMetni:'11-  Türkiye Avrupa Birliği üyesidir' , soruYaniti:false ),
    Sorular(soruMetni:'12-  Dünyadaki tavuk sayısı insan sayısından fazladır' ,soruYaniti:true ),
    Sorular(soruMetni:'13-  Her doğal sayı tam sayıdır' , soruYaniti:true ),
    Sorular(soruMetni:'14-  Afrika bir ülke değildir' , soruYaniti:true ),
    Sorular(soruMetni:'15-  Dünya düzdür' ,soruYaniti:false ),
    Sorular(soruMetni:'16-  Twitterda karakter sınırı 280dir' , soruYaniti:true ),
    Sorular(soruMetni:'17-  Isı termometre ile ölçülür' , soruYaniti:false ),
    Sorular(soruMetni:'18-  İrlanda cumhuriyerti birleşik krallıkın parçasıdır' , soruYaniti:false ),
    Sorular(soruMetni:'19-  Titanic gelmiş geçmiş en büyük gemidir' , soruYaniti:false ),
    Sorular(soruMetni:'20-  Kaju fıstığı aslında bir meyvenin sapıdır' ,soruYaniti: true),
    Sorular(soruMetni:'Başa Dönmek İçin butonlardan birine tıkla' ,soruYaniti: true),

  ];
  String getSoruMetni() {
    return _soruBankasi[_soruIndex].soruMetni;
  }
  bool getSoruYaniti() {
    return _soruBankasi[_soruIndex].soruYaniti;
  }
  bool getSoruYaniti2() {
    return _soruBankasi[_soruIndex-1].soruYaniti;
  }
  void sonrakiSoru(){
    if(_soruIndex<_soruBankasi.length) {
      _soruIndex++;

    }
  }
  bool testBittiMi(){
    if(_soruIndex+1 >= _soruBankasi.length){
      return true;
    }else {return false;}
  }
  void indexiSifirla(){
    _soruIndex = 0;
  }
}
