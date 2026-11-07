import glob
import os
import duckdb

# Klasörlerdeki tüm .duckdb dosyalarını tara
db_files = (
    glob.glob("*.duckdb")
    + glob.glob("../*.duckdb")
    + glob.glob("C:/Users/demir/*.duckdb")
)

target_db = None
for db in db_files:
    try:
        conn = duckdb.connect(db)
        tables = [row[0] for row in conn.execute("SHOW TABLES").fetchall()]
        if 'stg_perakende_satis' in tables:
            target_db = db
            conn.close()
            break
        conn.close()
    except Exception:
        pass

if target_db:
    print(f"✅ Hedef veritabanı bulundu: {target_db}")
    conn = duckdb.connect(target_db)
    os.makedirs('powerbi_data', exist_ok=True)
    export_tables = [
        'stg_perakende_satis',
        'fct_kategori_performans',
        'fct_bolge_performans',
        'fct_sehir_avm_kanal',
    ]
    for table in export_tables:
        df = conn.execute(f'SELECT * FROM {table}').df()
        df.to_csv(f'powerbi_data/{table}.csv', index=False)
        print(f'✅ {table}.csv başarıyla dışa aktarıldı!')
    conn.close()
else:
    print('⚠️ Tablo bulunamadı, dbt run çalıştırılıyor...')