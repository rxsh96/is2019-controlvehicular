import psycopg2
conn = psycopg2.connect("host=localhost dbname=care_db user=postgres password=postgres")
cur = conn.cursor()
with open('csv-items.csv', 'r') as f:
    next(f) # Skip the header row.
    cur.copy_from(f, 'api_Maintenance_item', sep=',')
    conn.commit()
conn.close()