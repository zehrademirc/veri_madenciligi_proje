# NovaPerakende Satış ve Bölgesel Karlılık Analizi

**YBS305 - Veri Madenciliği ve İş Zekası Vize Projesi (Bölüm 1)**

## 1. Proje Özeti ve İş Problemi

Bu projenin amacı, NovaPerakende şirketinin çok kanallı (Online ve Mağaza) satış verilerini inceleyerek ürün kategorileri ve coğrafi bölgeler bazında kârlılık dinamiklerini ortaya koymaktır. Ayrıca şehirlerdeki fiziki AVM sayılarının online ve mağaza kanalı satış hacimlerine etkisi analiz edilmiştir.

## 2. Kullanılan Teknolojiler ve Mimari

* **Veri Depolama & Motoru:** DuckDB (In-process OLAP)
* **Veri Dönüşümü (ELT):** dbt-duckdb
* **Görselleştirme & Dashboard:** Google Looker Studio
* **Versiyon Kontrolü:** Git & GitHub

## 3. Veri Kaynakları

1. **İç Veri Seti:** `raw_perakende_satis` (2.000 satırlık sipariş, maliyet, fiyat ve indirim verisi).
2. **Dış Kaynak Verisi:** `ext_sehir_avm` (İlgili 10 şehrin güncel fiziki AVM sayıları).

## 4. dbt Katmanları ve Veri Modelleri

* **Staging Katmanı (`stg_perakende_satis`):** Ham veri tipleri standartlaştırıldı; satır bazlı ciro, toplam maliyet ve net kâr formülleri hesaplandı.
* **Marts Katmanı:**
  * `fct_kategori_performans`: Kategori bazında sipariş hacmi, ciro ve kârlılık metrikleri özetlendi.
  * `fct_bolge_performans`: Bölge ve kanal kırılımında ortalama indirim oranları ve toplam kâr hesaplandı.
  * `fct_sehir_avm_kanal`: Satış verileri şehir AVM sayılarıyla birleştirilerek kanal performansı ve AVM başına düşen ciro modellendi.

## 5. Veri Kalitesi ve Testler

`schema.yml` üzerinden kritik birincil anahtarlar ve parasal değerler için `not_null` veri bütünlüğü testleri tanımlanmış ve doğrulanmıştır (`siparis_id`, `musteri_id`, `toplam_tutar`).

## 6. İş Zekası ve Dashboard

* **Canlı Looker Studio Dashboard:** [DASHBOARD_LINKINI_BURAYA_YAPISTIR]

### Temel Bulgular

1. Şehirlerdeki fiziki AVM yoğunluğu arttıkça mağaza cirosu artmakla birlikte, online kanal satış hacmi de büyük şehirlerde paralel olarak büyüme göstermektedir.
2. Uygulanan indirim oranları ciro hacmini artırırken belirli kategorilerde net kâr marjını baskılamaktadır.

## Grup Üyeleri

* Yusuf İsa Direk
* Zehra Demirci