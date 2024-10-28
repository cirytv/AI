import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Cargando el dataset de Titanic
data_original = pd.read_csv('./titanic.csv')

# Mostramos la informacion del dataset
data_original.info()

# Mostramos los primeros registros para analizar la informacion del dataset
data_original.head()

# Cambiamos nombre de algunas columnas
# Cambiamos nombre de algunas columnas
data_original.rename(columns={
    'Siblings/Spouses Aboard': 'SibSp',
    'Parents/Children Aboard': 'Parent'
}, inplace=True)

data_original.info()

# Revisamos si hay valores nulos en nuestro dataset
data_original.isnull().sum()

# Vamos preparando el modelo
# Verificamos la columna Sex
print(data_original['Sex'].unique())

# Ahora convertimos este campo en valores de 0 y 1. Donde 0 = Female y 1 = Male
from sklearn import preprocessing
le = preprocessing.LabelEncoder()
data_original['Sex']=le.fit_transform(data_original['Sex'])

print(data_original['Sex'].unique)

# Eliminamos la columna Name ya que no sera necesario para determinar una clasificacion o prediccion

data_original = data_original.drop(columns=['Name'])
data_original.info()

# Discretar la columna de Age ya que los rangos de edades son muy variadas por lo tanto haremos la siguiente discretacion

def valor_discretar(x):
    if x <= 12:
        return 1
    elif x > 12 and x <= 25:
        return 2
    elif x > 25 and x <= 45:
        return 3
    elif x > 45:
        return 4

data_original['Age_discre'] = data_original['Age'].apply(valor_discretar)

X = data_original[['Age_discre','SibSp', 'Parent', 'Fare', 'Pclass','Sex']]
y = data_original['Survived']

from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X,y,test_size=0.3, random_state=42)

from sklearn.tree import DecisionTreeClassifier
arbol = DecisionTreeClassifier()
arbol.fit(X_train,y_train)

y_train_pred = arbol.predict(X_train)
y_test_pred = arbol.predict(X_test)

from sklearn.metrics import accuracy_score

print('Accuracy de Train: ', accuracy_score(y_train_pred,y_train))
print('Accuracy de Test: ', accuracy_score(y_test_pred,y_test))


# Realizamos matriz de confusion para verificar la eficiencia y ver el comportamiento del modelo

from sklearn.metrics import ConfusionMatrixDisplay
ConfusionMatrixDisplay.from_estimator(
    arbol , X_test, y_test
)

plt.show()
