import psycopg2
conn = psycopg2.connect("host=localhost dbname=care_db user=postgres password=postgres")
cur = conn.cursor()
with open('marca.csv', 'r') as f:
    next(f) # Skip the header row.
    cur.copy_from(f, 'api_brand', sep=',')
    conn.commit()
with open('modelo.csv', 'r') as f:
    next(f) # Skip the header row.
    cur.copy_from(f, 'api_model', sep=',')
    conn.commit()
conn.close()