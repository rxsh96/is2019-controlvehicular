import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

# Start a PostgreSQL database session
psqlCon = psycopg2.connect("host=localhost dbname=care_db user=postgres password=postgres")
psqlCon.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)

# Open a database cursor
psqlCursor = psqlCon.cursor()
# Name of the table to be deleted
province = "api_province"
city = "api_city"
# Form the SQL statement - DROP TABLE
dropTableProvince = "DROP TABLE %s CASCADE; "%province
dropTableCity = "DROP TABLE %s CASCADE;"%city

# Execute the drop table command
psqlCursor.execute(dropTableProvince);
psqlCursor.execute(dropTableCity);

# Free the resources
psqlCursor.close();
psqlCon.close();