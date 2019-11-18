import psycopg2
conn = psycopg2.connect("host=localhost dbname=care_db user=postgres password=geartreakpgadmin#1")
cur = conn.cursor()
with open('csv-provincias.csv', 'r') as f:
    next(f) # Skip the header row.
    cur.copy_from(f, 'api_city', sep=',')
    conn.commit()
conn.close()