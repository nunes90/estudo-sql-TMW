# %%
import pandas as pd
import sqlalchemy

# conexao com o banco
engine = sqlalchemy.create_engine('sqlite:///database.db')

# %%

# Lendo a query do arquivo
with open('etl_projeto.sql') as open_file:
    query = open_file.read()

# %%

# Listando as datas
dates = [
    '2025-01-01',
    '2025-02-01',
    '2025-03-01',
    '2025-04-01',
    '2025-05-01',
    '2025-06-01',
    '2025-07-01',
    '2025-08-01',
    '2025-09-01',
    '2025-10-01',
    '2025-11-01',
    '2025-12-01'
]

# %%

for i in dates:
    # Executa a query e traz os dados para o dataframe
    df = pd.read_sql(query.format(date=i), engine)
    # Pega os dados e insere no banco
    df.to_sql('tb_feature_store_cliente', engine, index=False,if_exists='append')
# %%
