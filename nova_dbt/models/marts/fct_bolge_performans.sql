with mevcud_satislar as (
    select * from {{ ref('stg_perakende_satis') }}
)

select
    bolge,
    kanal,
    count(distinct siparis_id) as toplam_siparis_sayisi,
    round(sum(toplam_tutar), 2) as toplam_ciro,
    round(sum(net_kar), 2) as toplam_net_kar,
    round(avg(indirim_orani), 4) as ortalama_indirim_orani
from mevcud_satislar
group by bolge, kanal