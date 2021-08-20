from pyspark.sql.functions import mean, max, min, col, count
from pyspark.sql import SparkSession

spark = (
SparkSession.builder.appName("DesafioSpark")
    .getOrCreate()
)


# Ler os dados no Censo 2020
censo = ( 
    spark
    .read
    .format("CSV")
    .option("header", True)
    .option("inferSchema", True)
    .option("delimiter", "|")
    .load("s3://datalake-desafio-igti-prod-landing-zone-155914520574/raw-data/")

)

# Criando arquivos parquet. 

(
    censo
    .write
    .mode("overwrite")
    .format("parquet")
    .partitionBy("CO_UF")
    .save("s3://datalake-desafio-igti-prod-processing-zone-155914520574/censo-emr/")
)
