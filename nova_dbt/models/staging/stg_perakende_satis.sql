with source as (
    select * from {{ ref('raw_perakende_satis') }}
),

renamed as (
    select
        cast(SiparisID as string) as siparis_id,
        cast(Tarih as date) as siparis_tarihi,
        cast(Musteri_ID as string) as musteri_id,
        cast(Sehir as string) as sehir,
        cast(Bolge as string) as bolge,
        cast(Kanal as string) as kanal,
        cast(Kategori as string) as kategori,
        cast(Urun as string) as urun,
        cast(Miktar as integer) as miktar,
        cast(BirimFiyat as numeric) as birim_fiyat,
        cast(Maliyet as numeric) as maliyet,
        cast(IndirimOrani as numeric) as indirim_orani,

        -- Hesaplanan Hesaplamalar
        cast(Miktar * BirimFiyat * (1 - IndirimOrani) as numeric) as toplam_tutar,
        cast(Miktar * Maliyet as numeric) as toplam_maliyet,
        cast((Miktar * BirimFiyat * (1 - IndirimOrani)) - (Miktar * Maliyet) as numeric) as net_kar
    from source
)

select * from renamed