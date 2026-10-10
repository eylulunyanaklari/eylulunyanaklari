# Yanak Defteri — sadeleştirilmiş arayüz prototipi

## İçerik
- `index.html`: Mobil öncelikli arayüz; sekmeler sol üst menüden açılır.
- `supabase-schema.sql`: Ortak veritabanı için başlangıç şeması; canlı uygulama güvenliği için ayrıca tamamlanması gerekir.

## Yerel prototipi açma
`index.html` dosyasını bir tarayıcıda aç. Eylül yönetici girişi için `0403` kullan. Veriler yalnızca bu tarayıcının yerel depolamasında saklanır.

## Yeni arayüzde değişenler
- Sekmeler sol üstteki ☰ menüsünde; sayfa açılınca menü kapanır.
- Tarih ekranın üstünde büyük ve belirgin görünür.
- Ana sayfanın en üstünde büyük günlük yanak sayacı bulunur.
- Eylül yönetici hesabında `+ 1 Yanak ver` ve `− 1 Yanak çıkar` düğmeleriyle aynı gün içinde tekrar tekrar işlem yapılabilir.
- Günlük verilen toplam, çıkarılan miktar, günlük net ve genel net bakiye ayrı gösterilir.
- Daha ayrıntılı işlem ekleme, geçmiş hareketleri düzenleme/silme özellikleri korunmuştur.

## Çok önemli: henüz yayımlanmış/iki cihazlı sürüm değil
Tarayıcıdaki `0403` kontrolü yalnızca prototip içindir; kaynak kodunu gören biri bunu aşabilir. Veriler bu cihazın tarayıcısında kalır, iki cihaz arasında senkronize olmaz. Gerçek sürümde Eylül ve Şahan için ayrı Supabase Auth hesapları, sunucu tarafında rol kontrolü ve Row Level Security (RLS) politikaları kurulmalıdır. Şahan'ın yalnızca görüntüleme yetkisi veritabanında da zorunlu kılınmalıdır.

## Mevcut prototip özellikleri
- Ana sayfa ve günlük yanak sayacı
- Aylık takvim, ay değiştirme ve gün seçme
- Tarihe bağlı yanak ekleme/düzenleme/silme
- Günlük kategori puanları, taslak ve tamamlama
- Genel, 7 günlük ve 30 günlük ortalamalar
- Kategori ortalamaları ve günlük puan geçmişi
- Toplam bakiye ve dönem hedefleri
- Şahan'a notlar
- JSON yedek dışa aktarma ve geri yükleme

## Canlı bağlantı için sonraki adım
Supabase projesi, kullanıcı hesapları ve RLS politikaları kurulduktan sonra uygulama veritabanına bağlanmalı ve Netlify/Vercel gibi bir statik hosting hizmetine yayımlanmalıdır.
