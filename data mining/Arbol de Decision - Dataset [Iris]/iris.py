# %%
import pandas as pd
import numpy as np
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import classification_report, confusion_matrix
import matplotlib.pyplot as plt

# %%
# Cargar el dataset
url = 'https://github.com/mwaskom/seaborn-data/raw/master/iris.csv'
data = pd.read_csv(url)

# %%
# Mostrar los primeros registros del dataset
data.head()

# %%
# Resumen
print('Data shape: ',data.shape)

# %%
# Información del data set
data.info()

# %%
# Descripción del dataset
data.describe()

# %%
# # Agrupación de Clases
data.groupby('species').size()

# %%
# Gráfico de caja dataset
data.plot(kind='box', sharex=False, sharey=False)

# %%
# Histograma
data.hist(edgecolor='red',linewidth=1.2)

# %%
sns.violinplot(data=data, x='species',y='petal_length')

# %%
from pandas.plotting import scatter_matrix
scatter_matrix(data,figsize=(15,15))
plt.show()

# %%
sns.pairplot(data, hue='species')

# %%
# -- Entrenando el modelo --
# Separando los datos en variables dependientes e independientes
X = data.iloc[:,:-1].values
y = data.iloc[:,-1].values

# %%
# Dividir el dataset para entrenamiento y prueba
from sklearn.model_selection import train_test_split

# Dividir el dataset para entrenamiento y prueba
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=0)

# %%
# Resumen de predicciones con CART ( Arbol de Decision )
from sklearn.tree import (DecisionTreeClassifier)
from sklearn.metrics import classification_report
from sklearn.metrics import confusion_matrix

arbol_clasificado = DecisionTreeClassifier()
arbol_clasificado.fit (X_train, y_train)

y_pred = arbol_clasificado.predict(X_test)

# %%
# Grafico del Arbol de Decision
from sklearn.tree import plot_tree
fig, ax = plt.subplots(figsize= (14,10))
plot_tree(arbol_clasificado, filled=True, feature_names=data.columns.values )
plt.show()

# %%
# Resumen de las predicciones aplicando el modelo
print(classification_report(y_test, y_pred))
print(confusion_matrix(y_test, y_pred))

# %%
# Precision del Modelo
from sklearn.metrics import accuracy_score
print('La efectividad es: ', accuracy_score(y_pred, y_test))

# %%



