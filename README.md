# \# NovaPerakende Satış ve Bölgesel Karlılık Analizi

# \*\*YBS305 - Veri Madenciliği ve İş Zekası Vize Projesi (Bölüm 1)\*\*

# 

# \## 1. Proje Özeti ve İş Problemi

# Bu projenin amacı, NovaPerakende şirketinin çok kanallı (Online ve Mağaza) satış verilerini inceleyerek ürün kategorileri ve coğrafi bölgeler bazında kârlılık dinamiklerini ortaya koymaktır. Ayrıca şehirlerdeki fiziki AVM sayılarının online ve mağaza kanalı satış hacimlerine etkisi analiz edilmiştir.

# 

# \## 2. Kullanılan Teknolojiler ve Mimari

# \- \*\*Veri Depolama \& Motoru:\*\* DuckDB (In-process OLAP)

# \- \*\*Veri Dönüşümü (ELT):\*\* dbt-duckdb (v1.12)

# \- \*\*Görselleştirme \& Dashboard:\*\* Google Looker Studio

# \- \*\*Versiyon Kontrolü:\*\* Git \& GitHub

# 

# \## 3. Veri Kaynakları

# 1\. \*\*İç Veri Seti:\*\* `raw\_perakende\_satis` (2.000 satırlık sipariş, maliyet, fiyat ve indirim verisi).

# 2\. \*\*Dış Kaynak Verisi:\*\* `ext\_sehir\_avm` (İlgili 10 şehrin güncel fiziki AVM sayıları).

# 

# \## 4. dbt Katmanları ve Veri Modelleri

# \- \*\*Staging Katmanı:\*\*

# &#x20; - `stg\_perakende\_satis`: Ham veri tipleri standartlaştırıldı; satır bazlı ciro, toplam maliyet ve net kâr formülleri hesaplandı.

# \- \*\*Marts Katmanı:\*\*

# &#x20; - `fct\_kategori\_performans`: Kategori bazında sipariş hacmi, ciro ve kârlılık metrikleri özetlendi.

# &#x20; - `fct\_bolge\_performans`: Bölge ve kanal kırılımında ortalama indirim oranları ve toplam kâr hesaplandı.

# &#x20; - `fct\_sehir\_avm\_kanal`: Satış verileri şehir AVM sayılarıyla birleştirilerek kanal performansı ve AVM başına düşen ciro modellendi.

# 

# \## 5. Veri Kalitesi ve Testler

# `schema.yml` üzerinden kritik birincil anahtarlar ve parasal değerler için veri bütünlüğü testleri tanımlanmış ve başarıyla doğrulanmıştır:

# \- `siparis\_id` -> `not\_null`

# \- `musteri\_id` -> `not\_null`

# \- `toplam\_tutar` -> `not\_null`

# 

# \## 6. İş Zekası ve Dashboard

# Canlı Looker Studio Dashboard bağlantısı: \*\*\https://datastudio.google.com/reporting/a9db43a0-0484-4dcc-be8a-1e8cff36e50c\*\*

# 

# \### Temel Bulgular:

# 1\. Şehirlerdeki fiziki AVM yoğunluğu arttıkça mağaza cirosu artmakla birlikte, online kanal satış hacmi de büyük şehirlerde paralel olarak büyüme göstermektedir.

# 2\. Uygulanan indirim oranları ciro hacmini artırırken belirli kategorilerde net kâr marjını baskılamaktadır.

