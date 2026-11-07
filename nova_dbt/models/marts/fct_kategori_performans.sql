with mevcud_satislar as (
    select * from {{ ref('stg_perakende_satis') }}
)

select
    kategori,
    count(distinct siparis_id) as toplam_siparis_sayisi,
    sum(miktar) as toplam_satilan_urun,
    round(sum(toplam_tutar), 2) as toplam_ciro,
    round(sum(net_kar), 2) as toplam_net_kar
from mevcud_satislar
group by kategori