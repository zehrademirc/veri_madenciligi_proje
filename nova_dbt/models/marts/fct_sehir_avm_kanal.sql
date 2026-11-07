with satislar as (
    select * from {{ ref('stg_perakende_satis') }}
),

avm_bilgisi as (
    select * from {{ ref('ext_sehir_avm') }}
)

select
    s.sehir,
    a.avm_sayisi,
    s.kanal,
    count(distinct s.siparis_id) as toplam_siparis_sayisi,
    sum(s.miktar) as toplam_urun_miktari,
    round(sum(s.toplam_tutar), 2) as toplam_ciro,
    round(sum(s.net_kar), 2) as toplam_net_kar,
    round(sum(s.toplam_tutar) / a.avm_sayisi, 2) as avm_basina_ciro
from satislar s
left join avm_bilgisi a on s.sehir = a.sehir
group by s.sehir, a.avm_sayisi, s.kanal