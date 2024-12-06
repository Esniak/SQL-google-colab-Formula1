import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

def plot_top_drivers(data):
    """
    Crea un gráfico de barras para los 10 pilotos con más puntos.
    """
    df = pd.DataFrame(data)
    plt.figure(figsize=(10, 6))
    sns.barplot(x="total_points", y="surname", data=df, palette="viridis")
    plt.title("Top 10 Pilotos con Más Puntos")
    plt.xlabel("Puntos Totales")
    plt.ylabel("Piloto")
    plt.tight_layout()
    plt.show()

def plot_race_distribution(data):
    """
    Muestra un gráfico de barras con la distribución de carreras por país.
    """
    df = pd.DataFrame(data)
    plt.figure(figsize=(10, 6))
    sns.barplot(x="country", y="total_races", data=df, palette="coolwarm")
    plt.title("Distribución de Carreras por País")
    plt.xlabel("País")
    plt.ylabel("Total de Carreras")
    plt.xticks(rotation=45, ha="right")
    plt.tight_layout()
    plt.show()
