import psycopg2

conn = psycopg2.connect("host=localhost dbname=care_db user=postgres password=postgres")
cur = conn.cursor()
with open('csv-provincias.csv', 'r', encoding='utf-8') as f:
    next(f) # Skip the header row.
    cur.copy_from(f, 'api_province', sep=',')
    conn.commit()
with open('csv-ciudades.csv', 'r', encoding='utf-8') as f:
    next(f) # Skip the header row.
    cur.copy_from(f, 'api_city', sep=',')
    conn.commit()
conn.close()